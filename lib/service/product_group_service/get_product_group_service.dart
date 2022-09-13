import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:form/service/authorization_service/authorization_model.dart';
import 'package:form/service/config_object.dart';
import 'package:form/service/config_path.dart';
import 'package:form/service/product_group_service/get_product_groups_model.dart';
import 'package:http/http.dart' as http;

class Get_ProductGroup_API_Service {
  Future<dynamic> getProductGroupRequest(AuthorizationModel model) async {
    try {
      final response = await http.get(
        Uri.parse(prod_group_path),
        headers: <String, String>{
          'accept': 'text/plain',
          HttpHeaders.authorizationHeader: ' Bearer ${model.authorization}',
        },
      ).timeout(
        const Duration(seconds: 30),
      );
      if (response.statusCode == 200) {
        print('${response.statusCode} : Get Product Group API Request Complete');
        listProductGroupsOnDevice = [];
        for (var element in jsonDecode(response.body)) {
          ProductgroupsModel item = ProductgroupsModel.fromJson(element);
          listProductGroupsOnDevice.add(item);
        }

        return listProductGroupsOnDevice;
      } else if (response.statusCode == 401) {
        print('${response.statusCode} : ${response.body}');
        return {"errorDetails": "Unauthorized"};
        //PosConfigModelResponse401Model.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 500) {
        print('${response.statusCode} : ${response.body}');
        return response.body;
      } else {
        print('${response.statusCode} : ${response.body}');
        throw Exception('Failed to load Data');
      }
    } on TimeoutException catch (e) {
      await getProductGroupRequest(model);
    }
  }
}
