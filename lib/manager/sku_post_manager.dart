import 'dart:convert';
import 'dart:io';

import 'package:form/service/config_object.dart';
import 'package:form/service/get_sku_lookup_by_barcode/get_sku_lookup_by_bacode_service.dart';
import 'package:form/service/get_sku_lookup_by_barcode/get_sku_lookup_by_barcode_model.dart';
import 'package:form/service/patch_sku_price/patch_sku_price_model.dart';
import 'package:form/service/patch_sku_price/patch_sku_price_service.dart';
import 'package:form/service/post_sku_service/post_sku_model.dart';
import 'package:uuid/uuid.dart';

import '../service/post_sku_service/post_sku_service.dart';
var uuid = const Uuid();

class SKUPostManager {
  Future<dynamic> createSkuDetails(PostSkuModel model,String barcode,bool update) async {
    var result = await Get_SKULookupByBarcode_API_Service()
        .getSkuLookupByBarcodeRequest(authorizationModelOnDevice, barcode);
    String skuId;
    if (result.runtimeType == SkuLookupBarcodeModel &&
        !update) {
      print("Barcode Dup");
      return 'Barcode นี้มีอยู่ในระบบแล้ว';
    } else if (result == "Not Found") {
      print("Create Item");
      skuId = uuid.v4();
    } else {
      print("Update");
      SkuLookupBarcodeModel model = result;
      skuId = model.sku;
    }

    late String taxName;

    PostSkuModel item = PostSkuModel(
      skuid: skuId,
      barcodePos: barcode.length > 15
          ? barcode.substring(0, 15)
          : barcode,
      productName: model.productName,
      brandID: model.brandID,
      productGroupID: model.productGroupID,
      productCatID: model.productCatID,
      productSizeID: model.productSizeID,
      productUnit: model.productUnit,
      packSize: model.packSize, //
      unit: 0,
      banForPracharat: model.banForPracharat,
      isVat: model.isVat,
      createBy: userOnPos.username,
      createDate: DateTime.now().toIso8601String(),
      isActive: true,
      merchantID: null,
      mapSKU: null,
    );

    var resultPostSKU =
        await SKUPostService().skuPostRequest(authorizationModelOnDevice, item);

    if (update == false) {
      await Patch_SKU_Price_API_Service().patchSkuPriceRequest(
          authorizationModelOnDevice,
          SkuPricePatchModel(items: [
            SkuPriceModel(
              sku: skuId,
              price: 0.0001,
            )
          ]));
      await insertItemToItemsJson(item);
      await insertIdToCategories(
          item.productCatID.toString(), item.barcodePos);
    } else {
      print("Item updateIdToCategories,updateItemToItemsJson Method");
      await updateItemToItemsJson(item);
      await insertIdToCategories(
          item.productCatID.toString(), item.barcodePos);
    }


  }

  Future<void> insertItemToItemsJson(PostSkuModel item) async {
    var file = File('$pathJsonFile/items.json');
    final responseData = await file.readAsString();
    Map<String, dynamic> itemsData = jsonDecode(responseData);

    Map<String, dynamic> detail = {
      "sku": item.skuid,
      "title": item.productName,
      "price": 0.0001,
      "update": true,
      "blueFlag": item.banForPracharat == 1 ? true : false,
      "promotion": {},
    };

    Map<String, dynamic> newItem = {item.barcodePos: detail};

    itemsData.addAll(newItem);
    await deleteFolder(file);
    file.writeAsStringSync(jsonEncode(itemsData).toString());
    await refreshData('items.json');
  }

  Future<void> insertIdToCategories(String aaazzzeId, String barcode) async {
    var file = File('$pathJsonFile/categories.json');
    final responseData = await file.readAsString();
    var data = jsonDecode(responseData);

    for (var item in data) {
      if (item['id'] == aaazzzeId) {
        List<dynamic> currentData = item['itemsId'];
        currentData.add(barcode);
        item['itemsId'] = currentData;
        await deleteFolder(file);
        file.writeAsStringSync(jsonEncode(data).toString());

        return;
      }
    }
  }

  Future<void> updateItemToItemsJson(PostSkuModel item) async {
    var file = File('$pathJsonFile/items.json');
    final responseData = await file.readAsString();
    Map<String, dynamic> itemsDataJson = jsonDecode(responseData);

    late bool result = false;
    for (var items in itemsDataJson.entries) {
      if (item.skuid == items.value['sku']) {
        result = true;
        break;
      }
    }
    if (!result) {
      await Patch_SKU_Price_API_Service().patchSkuPriceRequest(
          authorizationModelOnPos,
          SkuPricePatchModel(items: [
            SkuPriceModel(
              sku: item.skuid,
              price: 0.0001,
            )
          ]));

      await insertItemToItemsJson(item);
      return;
    } else {
      Map<String, dynamic> detail = {
        "sku": item.skuid,
        "title": item.productName,
        "price": 0.0001,
        "update": true,
        "blueFlag": item.banForPracharat == 1 ? true : false,
        "promotion": {},
      };
      Map<String, dynamic> newItem = {item.barcodePos: detail};
      itemsDataJson.addAll(newItem);

      await updateIdToCategories(item.barcodePos);
    }

    await deleteFolder(file);
    file.writeAsStringSync(jsonEncode(itemsDataJson).toString());
    await refreshData('items.json');
  }

  Future<void> updateIdToCategories(String barcode) async {
    var file = File('$pathJsonFile/categories.json');
    final responseData = await file.readAsString();
    var data = jsonDecode(responseData);

    for (Map<String, dynamic> item in data) {
      var dataList = item['itemsId'] as List;

      for (int index = 0; index < dataList.length; index++) {
        if (dataList[index] == barcode) {
          dataList.removeAt(index);
          item['itemsId'] = dataList;
          print("Delete Complete In updateIdToCategories Method ");
        }
      }
    }
    await deleteFolder(file);
    file.writeAsStringSync(jsonEncode(data).toString());
    return;
  }
}

class GetProductgroupsMasterDataManager {
  Future<List<ProductgroupModel>> getProductgroups() async {
    var items = listProductgroupsOnPos;
    List<ProductgroupModel> _productgroups = [];
    for (GetProductgroupsModel cate in items) {
      _productgroups.add(
          ProductgroupModel(id: cate.prodcatID.toString(), title: cate.th_prodcat));
    }
    return _productgroups;
  }

  Future<String> checkProductgroups(int productgroupsId) async {
    List<ProductgroupModel> productgroupsList = await getProductgroups();

    for (ProductgroupModel cate in productgroupsList) {
      if (int.parse(cate.id) == productgroupsId) {
        return cate.title;
      }
    }
    return "";
  }
}

class GetCategoriesDataManager {
  Future<List<Category>> getCategories() async {
    List<Category> _category = [];
    var items = listCategoriesOnPos;
    for (Category aaaZzze in items) {
      _category.add(Category(aaaZzze.id.toString(), aaaZzze.title, []));
    }
    return _category;
  }

  Future<String> checkCategories(int categoriesId) async {
    List<Category> categories = await getCategories();

    for (Category aaaZzze in categories) {
      if (int.parse(aaaZzze.id) == categoriesId) {
        return aaaZzze.title;
      }
    }
    return "";
  }
}

class GetProductUnitDataManager {
  Future<List<ProductUnitModel>> getUnits() async {
    var result = await Get_Product_Unit_API_Service()
        .getProductUnitRequest(authorizationModelOnPos);

    List<ProductUnitModel> units = [];

    for (ProductUnitModel item in result.items) {
      units.add(
          ProductUnitModel(productUnitID: item.productUnitID, name: item.name));
    }
    return units;
  }
}

class GetProductSizeDataManager {
  Future<List<ProductSizeModel>> getProductsSize() async {
    var resultProductSize = await Get_Product_Size_API_Service()
        .getProductSizeRequest(authorizationModelOnPos);
    List<ProductSizeModel> units = [];

    for (ProductSizeModel item in resultProductSize.items) {
      units.add(
          ProductSizeModel(productSizeID: item.productSizeID, name: item.name));
    }
    return units;
  }
}
