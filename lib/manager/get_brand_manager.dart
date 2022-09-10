import 'package:form/service/brand_service/brand_model.dart';
import 'package:form/service/brand_service/brand_service.dart';
import 'package:form/service/config_object.dart';

class BrandManager {
  Future<dynamic> getBrandManager() async {
    var resultApi = await Get_Brand_API_Service()
        .getBrandRequest(authorizationModelOnDevice);
    if (resultApi.runtimeType == BrandModel) {
      List<BrandModel> brandList = resultApi;
      return brandList;
    }
    return resultApi;
  }
}
