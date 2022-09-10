import 'dart:convert';
import 'dart:io';
import 'package:form/service/authorization_service/authorization_model.dart';
import 'package:form/service/config_path.dart';
import 'package:http/http.dart' as http;

import 'get_sku_lookup_by_barcode_model.dart';

class Get_SKULookupByBarcode_API_Service {
  Future<dynamic> getSkuLookupByBarcodeRequest(
      AuthorizationModel model, String barcode) async {
    final response = await http.get(
      Uri.parse('$sku_lookup_barcode_pos_path/$barcode'),
      headers: <String, String>{
        'accept': 'text/plain',
        HttpHeaders.authorizationHeader: ' Bearer ${model.authorization}',
      },
    );
    SkuLookupBarcodeModel object;
    if (response.statusCode == 200) {
      print('${response.statusCode} : Get SKU Lookup By Barcode : $barcode  API Request Complete');
      if (response.body == "{}") {
        return "Not Found";
      }
      Map<String, dynamic> v = jsonDecode(response.body);
      String key = v.keys.first.toString();
      object = SkuLookupBarcodeModel(
        barcode: key,
        sku: v.values.first['sku'],
        title: v.values.first['title'],
        price: v.values.first['price'].toDouble(),
        updateStatus: v.values.first['updateStatus'],
        blueFlag: v.values.first['blueFlag'],
        promotion: v.values.first['promotion']!,
      );
      return object;
    } else if (response.statusCode == 401) {
      print('${response.statusCode} : ${response.body}');
      return {"errorDetails": "Unauthorized"};
    } else if (response.statusCode == 500) {
      print('${response.statusCode} : ${response.body}');
      return response.body;
    } else {
      print('${response.statusCode} : ${response.body}');
      throw Exception('Failed to load Data');
    }
  }
}
