import 'dart:convert';
import 'package:form/service/config_path.dart';
import 'package:http/http.dart' as http;
import 'get_sku_by_id_model.dart';

class SKU_API_Service {
  Future<dynamic> getSkuByIdRequest(String sku) async {
    final response = await http.get(
      Uri.parse('$sku_path/$sku'),
      headers: <String, String>{
        'accept': 'text/plain',
      },
    );
    if (response.statusCode == 200) {
      print('API Get SKU By Id Request - Complete ${response.statusCode}');
      return GetSkuByIdModelResponse200Model.fromJson(
          jsonDecode(response.body));
    } else if (response.statusCode == 401) {
      print('${response.body} : Status = ${response.statusCode}');
      return {"errorDetails": "Unauthorized"};
    } else if (response.statusCode == 500) {
      print('${response.body} : Status = ${response.statusCode}');
      return response.body;
    } else {
      throw Exception('Failed to load Data');
    }
  }
}
