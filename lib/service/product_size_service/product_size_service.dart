import 'dart:convert';
import 'dart:io';import 'package:form/service/config_path.dart';
import 'package:form/service/product_size_service/product_size_model.dart';

import 'package:http/http.dart' as http;

import '../authorization_service/authorization_model.dart';


class Get_ProductSize_API_Service {
  Future<dynamic> getProductSizeRequest(AuthorizationModel model) async {
    final response = await http.get(
      Uri.parse(product_size_path),
      headers: <String, String>{
        'accept': 'text/plain',
        HttpHeaders.authorizationHeader: ' Bearer ${model.authorization}',
      },
    );
    if (response.statusCode == 200) {
      print('${response.statusCode} : Get Product Size API Request Complete');
      return ProductSizeListModel.fromJson(jsonDecode(response.body)).items;
    } else if (response.statusCode == 401) {
      print('${response.statusCode} : ${response.body}');
      return {"errorDetails": "Unauthorized"};
      //PosConfigModelResponse401Model.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 500) {
      print('${response.statusCode} : ${response.body}');
      return response.body;
    } else {
      print('${response.statusCode} : ${response.body}');
      throw Exception('Failed to load Data');
    }
  }
}
