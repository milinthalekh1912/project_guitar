import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:form/service/brand_service/brand_model.dart';
import 'package:form/service/config_path.dart';
import 'package:http/http.dart' as http;
// import 'package:pos/logs/log_contents.dart';
// import 'package:pos/logs/log_types.dart';
// import 'package:pos/logs/logger.dart';
// import 'package:pos/service/authorization_service/authorization_model.dart';
// import 'package:pos/service/brand_service/brand_model.dart';
// import 'package:pos/service/config_path.dart';
// import 'package:pos/service/sku_service/patch_sku_price/patch_sku_price_model.dart';

import '../authorization_service/authorization_model.dart';
import 'patch_sku_price_model.dart';

class Patch_SKU_Price_API_Service {
  Future<dynamic> patchSkuPriceRequest(
    AuthorizationModel model,
    SkuPricePatchModel items,
  ) async {
    var list = [];
    for (SkuPriceModel i in items.items) {
      list.add(i.toJson());
    }
    try {
      // Logger logger = Logger();

      final response = await http
          .post(
            Uri.parse(sku_branch_price_path),
            headers: <String, String>{
              'accept': 'text/plain',
              HttpHeaders.authorizationHeader: ' Bearer ${model.authorization}',
              'Content-Type': 'application/json',
            },
            body: jsonEncode(list),
          )
          .timeout(
            const Duration(seconds: 30),
          );
      if (response.statusCode == 200) {
        print('API Post SKU Price Request - Complete : Status = ${response.statusCode}');

        return response.statusCode;
      } else if (response.statusCode == 401) {
        print('API Post SKU Price Request - ${response.statusCode} : Status = ${response.body}');
        return {"errorDetails": "Unauthorized"};
      } else if (response.statusCode == 500) {
        print('API Post SKU Price Request - ${response.statusCode} : Status = ${response.body}');

        return GetBrandModelResponse500Model.fromJson(
            jsonDecode(response.body));
      } else {
        print('API Post SKU Price Request - ${response.statusCode} : Status = ${response.body}');
        throw Exception('Failed to load Data');
      }
    } on TimeoutException catch (e) {
      print('API Get Brand Request - TimeoutException Request again');
      await patchSkuPriceRequest(
        model,
        items,
      );
    }
  }
}
