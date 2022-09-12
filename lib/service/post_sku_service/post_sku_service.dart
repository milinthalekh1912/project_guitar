import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:form/service/config_path.dart';
import 'package:form/service/post_sku_service/post_sku_model.dart';
import 'package:http/http.dart' as http;
import '../authorization_service/authorization_model.dart';

class SKUPostService {
  Future<dynamic> skuPostRequest(
      AuthorizationModel authorizationModel, PostSkuModel model) async {
    try {
      var body = jsonEncode(model.toJson());
      final response = await http
          .post(
            Uri.parse(sku_path),
            headers: <String, String>{
              'accept': 'text/plain',
              HttpHeaders.authorizationHeader:
                  ' Bearer ${authorizationModel.authorization}',
              'Content-Type': 'application/json',
            },
            body: body,
          )
          .timeout(
            const Duration(seconds: 30),
          );
      if (response.statusCode == 200) {
        print('API Post SKU Request - Complete ${response.statusCode}');
        return response.statusCode;
      } else if (response.statusCode == 401) {
        print('Unauthorized : Status = ${response.statusCode}');
        return response.body;
      } else if (response.statusCode == 500) {
        print('${response.body} : Status = ${response.statusCode}');
        return response.body;
      } else {
        print('${response.body} : Status = ${response.statusCode}');
        throw Exception('Failed to load Data');
      }
    } on TimeoutException catch (e) {
      print('API Saleorder Request - TimeoutException Request again');
      skuPostRequest(authorizationModel, model);
    }
  }
}
