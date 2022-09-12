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
          item.productCatID.toString();
    } else {
      print("Item updateIdToCategories,updateItemToItemsJson Method");
    }
  }
}