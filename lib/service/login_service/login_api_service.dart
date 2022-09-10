import 'dart:async';
import 'dart:convert';
import 'package:form/login/login_model.dart';
import 'package:form/service/config_path.dart';
import 'package:http/http.dart' as http;
import 'login_api_model.dart';

class Login_API_Service {
  Future<dynamic> loginRequest(LoginModel requestModel) async {
    try{
      final response = await http.post(
        Uri.parse(login_path),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(requestModel.toJson()),
      ).timeout(
        const Duration(seconds: 30),
      );

      if (response.statusCode == 200) {
        print('${response.statusCode} : Get Login API Request Complete');
        return LoginResponse200Model.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 500) {
        print('${response.statusCode} : ${response.body}');
        return LoginResponse500Model.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load Data');
      }
    } on TimeoutException catch (e) {
      String logMsg = 'API Login Request - TimeoutException Request again';
      print(logMsg);
      await loginRequest(requestModel);
    }
    }

}
