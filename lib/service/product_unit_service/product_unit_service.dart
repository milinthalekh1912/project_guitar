import 'dart:convert';
import 'dart:io';
import 'package:form/service/authorization_service/authorization_model.dart';
import 'package:form/service/config_path.dart';
import 'package:http/http.dart' as http;

import 'product_unit_model.dart';


class Get_ProductUnit_API_Service {
  Future<dynamic> getProductUnitRequest(AuthorizationModel model) async {
    final response = await http.get(
      Uri.parse(product_unit_path),
      headers: <String, String>{
        'accept': 'text/plain',
        HttpHeaders.authorizationHeader: ' Bearer ${model.authorization}',
      },
    );
    if (response.statusCode == 200) {
      print('${response.statusCode} : Get Product Unit API Request Complete');
      return ProductUnitListModel.fromJson(jsonDecode(response.body)).items;
    } else if (response.statusCode == 401) {
      print('${response.statusCode} : ${response.body}');
      return response.body;
    } else if (response.statusCode == 500) {
      print('${response.statusCode} : ${response.body}');
      return response.body;
    } else {
      print('${response.statusCode} : ${response.body}');
      throw Exception('Failed to load Data');
    }
  }
}
