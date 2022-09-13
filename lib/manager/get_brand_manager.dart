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

  Future<dynamic> postBrand(String thName, String enName) async {
    BrandModel newBrand = BrandModel(
      brandID: null,
      tH_Brand: thName,
      eN_Brand: enName,
    );
    var brandId = await Get_Brand_API_Service()
        .postBrandRequest(authorizationModelOnDevice, newBrand);
    if(brandId.runtimeType == GetBrandModelResponse500Model){
      GetBrandModelResponse500Model response500 = brandId;
      return response500;
    }
    print(brandId);
    return brandId['brandID'].toString();
  }
}
