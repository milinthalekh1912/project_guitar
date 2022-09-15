import 'dart:convert';
import 'dart:io';

import 'package:form/service/brand_service/brand_model.dart';
import 'package:form/service/config_object.dart';
import 'package:form/service/get_sku_lookup_by_barcode/get_sku_lookup_by_bacode_service.dart';
import 'package:form/service/get_sku_lookup_by_barcode/get_sku_lookup_by_barcode_model.dart';
import 'package:form/service/patch_sku_price/patch_sku_price_model.dart';
import 'package:form/service/patch_sku_price/patch_sku_price_service.dart';
import 'package:form/service/post_sku_service/post_sku_model.dart';
import 'package:form/service/product_categories_service/product_categories_model.dart';
import 'package:form/service/product_group_service/get_product_groups_model.dart';
import 'package:form/service/product_size_service/product_size_model.dart';
import 'package:form/service/product_unit_service/product_unit_model.dart';
import 'package:uuid/uuid.dart';
import '../service/post_sku_service/post_sku_service.dart';
var uuid = const Uuid();

class SKUPostManager {
  Future<dynamic> createSkuDetails(PostSkuModel model,TitleSkuModel titleSkuModel,String barcode,bool update) async {
    var result = await Get_SKULookupByBarcode_API_Service()
        .getSkuLookupByBarcodeRequest(authorizationModelOnDevice, barcode);
    String skuId;
    print("Update : $update");
    print('${result.runtimeType} : $result');
    if (result.runtimeType == SkuLookupBarcodeModel &&
        !update) {
      print("Barcode Dup");
      return 'Barcode นี้มีอยู่ในระบบแล้ว';
    } else if (model.skuid == "") {
      //"Create Item"
      print("Create Item Update $update");
      skuId = uuid.v4();
    }else if(result == 'Not Found'){
      skuId = uuid.v4();
    }else {
      //"Update Item"
      print("$result Update Item : Update = $update");
      SkuLookupBarcodeModel model = result;
      skuId = model.sku;
    }
    int? brandId = findBrandId(titleSkuModel.brandTitle);
    int productGroupId = findProductGroupId(titleSkuModel.departmentTitle);
    int productCateId = findProductCategories(titleSkuModel.categoryTitle);
    int productSubCateId = findProductSubcate(titleSkuModel.subcategoryTitle,productCateId);
    int productSizeId = findProductSizeId(titleSkuModel.sizeTitle);
    int productSizeUnit = findProductSizeUnit(titleSkuModel.unitTitle);

    PostSkuModel item = PostSkuModel(
      skuid: skuId,
      barcodePos: barcode.length > 15
          ? barcode.substring(0, 15)
          : barcode,
      productName: model.productName,
      brandID: brandId,
      productGroupID: productGroupId,
      productCatID: productCateId,
      productSubCatID: productSubCateId,
      productSizeID: productSizeId,
      productUnit: productSizeUnit,
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

    if (model.skuid == "") {
      //Create SKU
      await Patch_SKU_Price_API_Service().patchSkuPriceRequest(
          authorizationModelOnDevice,
          SkuPricePatchModel(items: [
            SkuPriceModel(
              sku: skuId,
              price: 0.0001,
            )
          ]));
          item.productCatID.toString();
    } else {
      //Update SKU
      print("Item updateIdToCategories,updateItemToItemsJson Method");
    }
    updateSku = false;
    return null;
  }
}

int? findBrandId(String nameBrand){
  for(BrandModel brand in listBrandOnDevice){
    if(nameBrand == brand.tH_Brand){
      return int.parse(brand.brandID!);
    }
  }
  return null;
}

int findProductGroupId(String productgroup_name){
  for(ProductgroupsModel prodGroup in listProductGroupsOnDevice){
    if(prodGroup.th_prodcat == productgroup_name){
      return int.parse(prodGroup.prodcatID);
    }
  }
  return 1;
}

int findProductCategories(String categories_name){
  for(ProductCategoriesModel cate in listProductCategoriesOnDevice){
    if(cate.title == categories_name){
      return int.parse(cate.id);
    }
  }
  return 1;
}

int findProductSubcate(String subcategoriesName,int categoriesId){
  for(ProductCategoriesModel cate in listProductCategoriesOnDevice){
    if(int.parse(cate.id) == categoriesId){
      for(SubcateInCateModel subcate in cate.subcates){
        if(subcategoriesName == subcate.title){
          return int.parse(subcate.id);
        }
      }
    }
  }
  return 1;
}

int findProductSizeId(String prodSizeName){
  for(ProductSizeModel prodSize in listProductSizeOnDevice){
    if(prodSizeName == prodSize.name){
      return prodSize.productSizeID;
    }
  }
  return 1;
}

int findProductSizeUnit(String prodUnitName){
  for(ProductUnitModel prodUnit in listProductUnitOnDevice){
    if(prodUnitName == prodUnit.name){
      return prodUnit.productUnitID;
    }
  }
  return 1;
}