import 'dart:convert';
import 'dart:io';
import 'package:form/service/authorization_service/authorization_model.dart';
import 'package:form/service/config_path.dart';
import 'package:http/http.dart' as http;

import 'general_info_model.dart';

class GeneralInfo_API_Service {
  Future<dynamic> generalInfoRequest(AuthorizationModel model) async {
    final response = await http.get(
      Uri.parse(general_info_path),
      headers: <String, String>{
        HttpHeaders.authorizationHeader: ' bearer ${model.authorization}',
        'accept': 'text/plain',
      },
    );
    if (response.statusCode == 200) {
      print('${response.statusCode} : Get General Info API Request Complete');
      return response.body;
      // return GeneralInfoResponse200Model.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 401) {
      print('${response.statusCode} : ${response.body}');
      return {"errorDetails": "Unauthorized"};
      //GeneralInfoResponse401Model.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 500) {
      print('${response.statusCode} : ${response.body}');
      return GeneralInfoResponse500Model.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Data');
    }
  }
}
