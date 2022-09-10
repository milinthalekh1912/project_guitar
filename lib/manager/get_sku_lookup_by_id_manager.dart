import 'package:form/service/config_object.dart';
import 'package:form/service/get_sku_lookup_by_barcode/get_sku_lookup_by_bacode_service.dart';
import '../service/get_sku_lookup_by_barcode/get_sku_lookup_by_barcode_model.dart';

class SkuLookUpByIdManager{
  Future<dynamic> getSkuLookupById(String barcode)async{
    var resultApi = await Get_SKULookupByBarcode_API_Service()
        .getSkuLookupByBarcodeRequest(authorizationModelOnDevice, barcode);
    if(resultApi.runtimeType == SkuLookupBarcodeModel){
      SkuLookupBarcodeModel skuLookupBarcodeModel = resultApi;
      return skuLookupBarcodeModel;
    }
    return resultApi;
  }
}