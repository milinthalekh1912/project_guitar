import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:form/service/authorization_service/authorization_model.dart';
import 'package:form/service/config_path.dart';
import 'package:form/service/pos_config_service/pos_config_model.dart';

class PosConfig_API_Service {
  Future<dynamic> posConfigRequest(AuthorizationModel model) async {
    final response = await http.get(
      Uri.parse(pos_config_path),
      headers: <String, String>{
        'accept': 'text/plain',
        HttpHeaders.authorizationHeader: ' Bearer ${model.authorization}',
      },
    );
    if (response.statusCode == 200) {
      print('${response.statusCode} : Get PosConfig Request Complete');
      return PosConfigModelResponse200Model.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 401) {
      return {"errorDetails": "Unauthorized"};
      //PosConfigModelResponse401Model.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 500) {
      return PosConfigModelResponse500Model.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Data');
    }
  }
}
