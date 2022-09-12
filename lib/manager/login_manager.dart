//Login Manager
import 'dart:convert';
import 'package:form/login/login_model.dart';
import 'package:form/manager/get_categories_managet.dart';
import 'package:form/manager/get_sku_lookup_by_id_manager.dart';
import 'package:form/service/authorization_service/authorization_model.dart';
import 'package:form/service/brand_service/brand_service.dart';
import 'package:form/service/general_info_service/general_info_service.dart';
import 'package:form/service/pos_config_service/pos_config_service.dart';
import 'package:form/service/product_categories_service/product_categories_model.dart';
import 'package:form/service/product_categories_service/product_categories_service.dart';
import 'package:form/service/product_group_service/get_product_group_service.dart';
import 'package:form/service/product_size_service/product_size_service.dart';
import 'package:form/service/product_subcategories_service/product_sub_categories_model.dart';
import 'package:form/service/product_subcategories_service/product_sub_categories_service.dart';
import 'package:form/service/product_unit_service/product_unit_service.dart';
import '../service/login_service/login_api_model.dart';
import '../service/login_service/login_api_service.dart';
import '../service/pos_config_service/pos_config_model.dart';
import '../service/config_object.dart';

class LoginManager {
  Future<dynamic> login(LoginModel model) async {
    final loginRequest = await Login_API_Service().loginRequest(model);
    if (loginRequest.runtimeType == LoginResponse200Model) {
      userOnPos = LoginResponse200Model(
          username: loginRequest.username,
          token: loginRequest.token,
          expiration: loginRequest.expiration);

      authorizationModelOnDevice =
          AuthorizationModel(authorization: loginRequest.token);
      print(authorizationModelOnDevice.authorization);
      var generalInfo = await GeneralInfo_API_Service()
          .generalInfoRequest(authorizationModelOnDevice);

      posConfigModelOnPos = await PosConfig_API_Service()
          .posConfigRequest(authorizationModelOnDevice);

      listBrandOnDevice = await Get_Brand_API_Service()
          .getBrandRequest(authorizationModelOnDevice);

      listProductgroupsOnDevice = await Get_ProductGroup_API_Service()
          .getProductGroupRequest(authorizationModelOnDevice);

      listProductcategoriesOnDevice = await CategoriesManager().getMockProductCategories();

      listProductSubCategoriesModel = await Get_ProductSubCategories_API_Service()
          .getProductSubCategoriesRequest(authorizationModelOnDevice);

      //ProductCategories result = await Get_ProductCategories_API_Service()
      // .getProductCategoriesByIdRequest(authorizationModelOnDevice, '1');
      //ProductSubCategoriesModel result = await Get_ProductSubCategories_API_Service()
      //.getProductSubCategoriesByIdRequest(authorizationModelOnDevice, '1');

      listProductSizeOnDevice = await Get_ProductSize_API_Service()
          .getProductSizeRequest(authorizationModelOnDevice);

      listProductUnitOnDevice = await Get_ProductUnit_API_Service()
          .getProductUnitRequest(authorizationModelOnDevice);
      return true;
    } else if (loginRequest.runtimeType == LoginResponse500Model) {
      LoginResponse500Model errorDetails = loginRequest;
      return errorDetails.errorDetail;
    }
  }
}


