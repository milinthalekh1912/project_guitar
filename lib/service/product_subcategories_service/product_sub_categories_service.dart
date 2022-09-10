import 'dart:convert';
import 'dart:io';
import 'package:form/service/authorization_service/authorization_model.dart';
import 'package:form/service/config_path.dart';
import 'package:form/service/product_categories_service/product_categories_model.dart';
import 'package:form/service/product_subcategories_service/product_sub_categories_model.dart';
import 'package:http/http.dart' as http;


class Get_ProductSubCategories_API_Service {
  Future<dynamic> getProductSubCategoriesByIdRequest(AuthorizationModel model,String productSubCategoriesId) async {

    final response = await http.get(
      Uri.parse('$prod_cate_path/$productSubCategoriesId'),
      headers: <String, String>{
        'accept': 'text/plain',
        HttpHeaders.authorizationHeader: ' Bearer ${model.authorization}',
      },
    );
    if (response.statusCode == 200) {
      print('${response.statusCode} : Get Product Sub-Categories By Id : $productSubCategoriesId  API Request Complete');
      return ProductSubCategoriesModel.fromJson(
          jsonDecode(response.body));
    } else if (response.statusCode == 401) {
      print('${response.statusCode} : ${response.body}');
      return {"errorDetails": "Unauthorized"};
    } else if (response.statusCode == 500) {
      print('${response.statusCode} : ${response.body}');
      return response.body;
    } else {
      throw Exception('Failed to load Data');
    }
  }
}
