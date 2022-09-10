import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:form/service/config_object.dart';
import 'package:form/service/authorization_service/authorization_model.dart';
import 'package:form/service/config_path.dart';
import 'package:http/http.dart' as http;


class Logout_Api_Service {
  Future<dynamic> logoutRequest() async {
    AuthorizationModel authorizationModel = AuthorizationModel(
        authorization: authorizationModelOnDevice.authorization);
    try {
      final response = await http
          .post(Uri.parse(logout_path),
              headers: <String, String>{
                'accept': 'text/plain',
                HttpHeaders.authorizationHeader:
                    ' Bearer ${authorizationModel.authorization}',
                'Content-Type': 'application/json',
              },
              body: '{}')
          .timeout(
            const Duration(seconds: 30),
          );
      print("In Function API Service");
      print(response.statusCode);

      if (response.statusCode == 200) {
        return response.body;
        //SaleOrderPostResponse200Model.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        return {"errorDetails": "Unauthorized"};
        //PosConfigModelResponse401Model.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 500) {
        return jsonDecode(response.body)['errorDetail'];
      } else {
        throw Exception('Failed to load Data');
      }
    } on TimeoutException catch (e) {
      print("In TimeoutException");
      print(e);
    }
  }
}
