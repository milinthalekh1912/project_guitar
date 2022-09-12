import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pos/logs/log_contents.dart';
import 'package:pos/logs/log_types.dart';
import 'package:pos/logs/logger.dart';
import 'package:pos/service/authorization_service/authorization_model.dart';
import 'package:pos/service/brand_service/brand_model.dart';
import 'package:pos/service/config_path.dart';
import 'package:pos/service/sku_service/patch_sku_price/patch_sku_price_model.dart';

class Patch_SKU_Price_API_Service {
  Future<dynamic> patchSkuPriceRequest(
    AuthorizationModel model,
    SkuPricePatchModel items,
  ) async {
    var list = [];
    for (SkuPriceModel i in items.items) {
      list.add(i.toJson());
    }
    print(list);
    try {
      Logger logger = Logger();
      String logMsg = 'API Post SKU Price Request - ';

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
      print(response.statusCode);
      if (response.statusCode == 200) {
        logMsg += 'Complete : Status = ${response.statusCode}';
        LogContents logContents = LogContents(
          logOrigin: 'request',
          logType: LogTypes.info,
          logMessage: logMsg,
          timeStamp: DateTime.now().toString(),
        );
        logger.log(contents: logContents);

        return response.statusCode;
      } else if (response.statusCode == 401) {
        logMsg += '${response.statusCode} : Status = ${response.body}';

        LogContents logContents = LogContents(
          logOrigin: 'request',
          logType: LogTypes.info,
          logMessage: logMsg,
          timeStamp: DateTime.now().toString(),
        );
        logger.log(contents: logContents);

        return {"errorDetails": "Unauthorized"};
      } else if (response.statusCode == 500) {
        logMsg += '${response.statusCode} : Status = ${response.body}';

        LogContents logContents = LogContents(
          logOrigin: 'request',
          logType: LogTypes.info,
          logMessage: logMsg,
          timeStamp: DateTime.now().toString(),
        );
        logger.log(contents: logContents);

        return GetBrandModelResponse500Model.fromJson(
            jsonDecode(response.body));
      } else {
        logMsg += '${response.statusCode} : Status = ${response.body}';

        LogContents logContents = LogContents(
          logOrigin: 'request',
          logType: LogTypes.info,
          logMessage: logMsg,
          timeStamp: DateTime.now().toString(),
        );
        logger.log(contents: logContents);

        throw Exception('Failed to load Data');
      }
    } on TimeoutException catch (e) {
      Logger logger = Logger();
      String logMsg = 'API Get Brand Request - TimeoutException Request again';

      LogContents logContents = LogContents(
        logOrigin: 'request',
        logType: LogTypes.info,
        logMessage: logMsg,
        timeStamp: DateTime.now().toString(),
      );
      logger.log(contents: logContents);

      await patchSkuPriceRequest(
        model,
        items,
      );
    }
  }
}
