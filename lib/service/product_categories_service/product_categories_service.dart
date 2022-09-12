import 'dart:convert';
import 'dart:io';
import 'package:form/service/authorization_service/authorization_model.dart';
import 'package:form/service/config_path.dart';
import 'package:form/service/product_categories_service/product_categories_model.dart';
import 'package:http/http.dart' as http;


class Get_ProductCategories_API_Service {
  Future<dynamic> getProductCategoriesByIdRequest(AuthorizationModel model,String productcategoriesId) async {

    final response = await http.get(
      Uri.parse('$prod_cate_path/$productcategoriesId'),
      headers: <String, String>{
        'accept': 'text/plain',
        HttpHeaders.authorizationHeader: ' Bearer ${model.authorization}',
      },
    );
    if (response.statusCode == 200) {
      print('${response.statusCode} : Get Product Categories By Id : $productcategoriesId  API Request Complete');
      return ProductCategoriesModel.fromJson(
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

  Future<dynamic> getProductCategoriesRequest(AuthorizationModel model) async {
    final response = await http.get(
      Uri.parse('$prod_cate_path'),
      headers: <String, String>{
        'accept': 'text/plain',
        HttpHeaders.authorizationHeader: ' Bearer ${model.authorization}',
      },
    );
    if (response.statusCode == 200) {
      print('${response.statusCode} : Get All Product Categories : API Request Complete');
      return jsonDecode(response.body);
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
