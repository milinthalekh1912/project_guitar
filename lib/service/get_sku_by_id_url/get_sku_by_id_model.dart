// ignore: non_constant_identifier_names
class GetSkuByIdModelResponse200Model {
  GetSkuModel items;
  GetSkuByIdModelResponse200Model({required this.items});

  factory GetSkuByIdModelResponse200Model.fromJson(Map<String, dynamic> json) {
    return GetSkuByIdModelResponse200Model(
      items: GetSkuModel.fromJson(json),
    );
  }
}

class GetSkuByIdModelResponse500Model {
  String errorCode;
  String errorDetails;

  GetSkuByIdModelResponse500Model(
      {required this.errorCode, required this.errorDetails});

  factory GetSkuByIdModelResponse500Model.fromJson(Map<String, dynamic> json) {
    return GetSkuByIdModelResponse500Model(
      errorCode: json['errorCode'],
      errorDetails: json['errorDetails'],
    );
  }
}

class GetSkuModel {
  String skuid;
  String barcodePOS;
  String productName;
  int brandID;
  int prodGroupID;
  int prodCatID;
  int? productSubCatID;
  int productSizeID;
  int productUnit;
  String? packSize;
  int? unit;
  int banForPracharat;
  bool isVat;
  String createBy;
  String createDate;
  double price;
  String? startDate;
  String? endDate;

  GetSkuModel({
    required this.skuid,
    required this.barcodePOS,
    required this.productName,
    required this.brandID,
    required this.prodGroupID,
    required this.prodCatID,
    required this.productSubCatID,
    required this.productSizeID,
    required this.productUnit,
    required this.packSize,
    required this.unit,
    required this.banForPracharat,
    required this.isVat,
    required this.createBy,
    required this.createDate,
    required this.price,
    required this.startDate,
    required this.endDate,
  });

  factory GetSkuModel.fromJson(Map<String, dynamic> json) {
    return GetSkuModel(
      skuid: json['skuid'] ?? "",
      barcodePOS: json['barcodePOS'],
      productName: json['productName'],
      brandID: json['brandID'],
      prodGroupID: json['productGroupID'],
      prodCatID: json['productCatID'],
      productSubCatID :json["productSubCatID"],
      productSizeID: json['productSizeID'],
      productUnit: json['productUnit'],
      packSize: json['packSize'] == null ? "0.00" : json['packSize'],
      unit: json['unit'],
      banForPracharat: json['banForPracharat'],
      isVat: json['isVat'],
      createBy: json['createBy'],
      createDate: json['createDate'],
      price: json['price'] == null ? 0.0001 : json['price'] * 1.00,
      startDate: json['startDate'],
      endDate: json['endDate'],
    );
  }

  Map<String, dynamic> toJson() => {
    'skuid': skuid,
    'barcodePOS': barcodePOS,
    'productName': productName,
    'brandID': brandID,
    'productGroupID': prodGroupID,
    'productCatID': prodCatID,
    'productSubCatID' : productSubCatID,
    'productSizeID': productSizeID,
    'productUnit': productUnit,
    'PackSize': packSize,
    'unit': unit,
    'banForPracharat': banForPracharat,
    'isVat': isVat,
    'createBy': createBy,
    'createDate': createDate,
    'price': price,
    'startDate': startDate,
  };
}

class GetSkuModelResponse200Model {
  List<GetSkuModel> items;
  GetSkuModelResponse200Model({required this.items});

  factory GetSkuModelResponse200Model.fromJson(Map<String, dynamic> json) {
    var list = json['items'] as List;
    List<GetSkuModel> itemList =
    list.map((i) => GetSkuModel.fromJson(i)).toList();
    return GetSkuModelResponse200Model(
      items: itemList,
    );
  }
}
