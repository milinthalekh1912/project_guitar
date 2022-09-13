import 'package:form/service/config_object.dart';
import 'package:form/service/get_sku_by_id_url/get_sku_by_id_model.dart';
import 'package:form/service/get_sku_by_id_url/get_sku_by_id_service.dart';
import 'package:form/service/get_sku_lookup_by_barcode/get_sku_lookup_by_bacode_service.dart';
import '../service/get_sku_lookup_by_barcode/get_sku_lookup_by_barcode_model.dart';

class SkuLookUpByIdManager{
  Future<dynamic> getSkuLookupById(String barcode)async{
    var resultApi = await Get_SKULookupByBarcode_API_Service()
        .getSkuLookupByBarcodeRequest(authorizationModelOnDevice, barcode);
    if(resultApi.runtimeType == SkuLookupBarcodeModel){
      SkuLookupBarcodeModel skuLookupBarcodeModel = resultApi;
      var resultApiSku = await SKU_API_Service().getSkuByIdRequest(skuLookupBarcodeModel.sku);
      if(resultApiSku.runtimeType == GetSkuByIdModelResponse200Model){
        GetSkuModel skuResult = resultApiSku.items;
        updateSku = true;
        return skuResult;
      }
      List<SkuLookupBarcodeModel> emptyResult = [];
      return emptyResult;
    }
    return resultApi;
  }
}
