
import 'package:form/service/config_object.dart';
import 'package:form/service/product_categories_service/product_categories_service.dart';
import '../service/product_categories_service/product_categories_model.dart';

class CategoriesManager{
  Future<dynamic>getProductCategories(String productcategoriesId) async{
    var resultApi = await Get_ProductCategories_API_Service()
        .getProductCategoriesByIdRequest(authorizationModelOnDevice, productcategoriesId);
    if(resultApi.runtimeType == ProductCategories){
      ProductCategories productCategories = resultApi;
      return productCategories;
    }
    return null;
  }
}