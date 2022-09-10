class BrandModel {
  String? brandID;
  String tH_Brand;
  String eN_Brand;

  BrandModel({
    required this.brandID,
    required this.tH_Brand,
    required this.eN_Brand,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      brandID: json['brandID'].toString(),
      tH_Brand: json['tH_Brand'],
      eN_Brand: json['eN_Brand'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "brandID": brandID,
      "tH_Brand": tH_Brand,
      "eN_Brand": eN_Brand,
    };
  }
}

class GetBrandModelResponse200Model {
  List<BrandModel> items;
  GetBrandModelResponse200Model({required this.items});

  factory GetBrandModelResponse200Model.fromJson(Map<String, dynamic> json) {
    var list = json['items'] as List;
    List<BrandModel> itemList =
        list.map((i) => BrandModel.fromJson(i)).toList();
    return GetBrandModelResponse200Model(items: itemList);
  }
}

class GetBrandModelResponse500Model {
  String errorCode;
  String errorDetails;

  GetBrandModelResponse500Model(
      {required this.errorCode, required this.errorDetails});

  factory GetBrandModelResponse500Model.fromJson(Map<String, dynamic> json) {
    return GetBrandModelResponse500Model(
      errorCode: json['errorCode'],
      errorDetails: json['errorDetail'],
    );
  }
}
