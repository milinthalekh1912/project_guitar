import 'dart:convert';

// ignore: non_constant_identifier_names
class ProductgroupsModel {
  String prodcatID;
  String th_prodcat;
  String eN_prodcat;
  bool updateStatus;
  List<CategoriesID> categories;

  ProductgroupsModel({
    required this.prodcatID,
    required this.th_prodcat,
    required this.eN_prodcat,
    required this.updateStatus,
    required this.categories,
  });

  factory ProductgroupsModel.fromJson(Map<String, dynamic> json) {
    var listSubId = json['categories'] as List;
    List<CategoriesID> itemList =
        listSubId.map((i) => CategoriesID.fromJson(i)).toList();
    return ProductgroupsModel(
      prodcatID: json['id'] ?? "",
      th_prodcat: json['titleTh'] ?? "",
      eN_prodcat: json['titleEn'] ?? "",
      updateStatus: json['updateStatus'],
      categories: itemList,
    );
  }

  Map toJson() => {
        'prodcatID': prodcatID,
        'th_prodcat': th_prodcat,
        'eN_prodcat': eN_prodcat,
        'updateStatus':updateStatus,
      };
}

class CategoriesID {
  String id;

  CategoriesID({required this.id});
  factory CategoriesID.fromJson(Map<String, dynamic> json) {
    return CategoriesID(
      id: json['id'] ?? "",
    );
  }
}

class GetProductgroupsModelResponse200Model {
  List<ProductgroupsModel> items;
  GetProductgroupsModelResponse200Model({required this.items});

  factory GetProductgroupsModelResponse200Model.fromJson(
      Map<String, dynamic> json) {
    var list = json['items'] as List;
    List<ProductgroupsModel> itemList =
        list.map((i) => ProductgroupsModel.fromJson(i)).toList();
    return GetProductgroupsModelResponse200Model(
      items: itemList,
    );
  }
}

class GetProductgroupsModelResponse500Model {
  String errorCode;
  String errorDetails;

  GetProductgroupsModelResponse500Model(
      {required this.errorCode, required this.errorDetails});

  factory GetProductgroupsModelResponse500Model.fromJson(
      Map<String, dynamic> json) {
    return GetProductgroupsModelResponse500Model(
      errorCode: json['errorCode'],
      errorDetails: json['errorDetails'],
    );
  }
}
