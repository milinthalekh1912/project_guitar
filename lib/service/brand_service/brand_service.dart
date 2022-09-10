import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:form/service/authorization_service/authorization_model.dart';
import 'package:form/service/brand_service/brand_model.dart';
import 'package:form/service/config_path.dart';
import 'package:http/http.dart' as http;

class Get_Brand_API_Service {
  Future<dynamic> getBrandRequest(AuthorizationModel model) async {
    try {
      final response = await http.get(
        Uri.parse(brand_path),
        headers: <String, String>{
          'accept': 'text/plain',
          HttpHeaders.authorizationHeader: ' Bearer ${model.authorization}',
        },
      ).timeout(
        const Duration(seconds: 30),
      );

      if (response.statusCode == 200) {
        print('${response.statusCode} : Get Brand API Request Complete');
        return GetBrandModelResponse200Model.fromJson(
            jsonDecode(response.body)).items;
      } else if (response.statusCode == 401) {
        print('${response.statusCode} : ${response.body}');
        return {"errorDetails": "Unauthorized"};
      } else if (response.statusCode == 500) {
        print('${response.statusCode} : ${response.body}');
        return GetBrandModelResponse500Model.fromJson(
            jsonDecode(response.body));
      } else {
        throw Exception('Failed to load Data ${response.body}');
      }
    } on TimeoutException catch (e) {
      print('API Get Brand Request - TimeoutException Request again');
      await getBrandRequest(model);
    }
  }

  Future<dynamic> postBrandRequest(
      AuthorizationModel model, BrandModel brandModel) async {
    try {
      final response = await http
          .post(
            Uri.parse(brand_path),
            headers: <String, String>{
              'accept': 'text/plain',
              'Content-Type': 'application/json',
              HttpHeaders.authorizationHeader: ' Bearer ${model.authorization}',
            },
            body: jsonEncode(brandModel.toJson()),
          )
          .timeout(
            const Duration(seconds: 30),
          );
      print(response.statusCode);
      print('${response.statusCode} : Post Brand API Request Complete');
      if (response.statusCode == 200) {
        print('${response.statusCode} : ${response.body}');
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        print('${response.statusCode} : ${response.body}');
        return {"errorDetails": "Unauthorized"};
      } else if (response.statusCode == 500) {
        print('${response.statusCode} : ${response.body}');
        return GetBrandModelResponse500Model.fromJson(
            jsonDecode(response.body));
      } else {
        throw Exception('Failed to load Data');
      }
    } on TimeoutException catch (e) {
      String logMsg = 'API Brand Request - TimeoutException Request again';
      print(logMsg);
      return e;
    }
  }
}

