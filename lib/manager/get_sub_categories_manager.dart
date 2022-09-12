import 'package:form/service/config_object.dart';
import 'package:form/service/product_subcategories_service/product_sub_categories_model.dart';
import 'package:form/service/product_subcategories_service/product_sub_categories_service.dart';

class SubCategoriesManager {
  Future<dynamic> getProductSubCategories(String productSubCategoriesId) async {
    var resultApi = await Get_ProductSubCategories_API_Service()
        .getProductSubCategoriesByIdRequest(
            authorizationModelOnDevice, productSubCategoriesId);
    if (resultApi.runtimeType == ProductSubCategoriesModel) {
      ProductSubCategoriesModel productSubCategoriesModel = resultApi;
      return productSubCategoriesModel;
    }
    return null;
  }
}
