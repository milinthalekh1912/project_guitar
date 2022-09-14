class PostSkuModel {
  String skuid;
  String barcodePos;
  String productName;
  int? brandID;
  int? productGroupID;
  int? productCatID;
  int? productSubCatID;
  int? productSizeID;
  int? productUnit;
  String packSize;
  int unit;
  int banForPracharat;
  bool isVat;
  String createBy;
  String createDate;
  bool isActive;
  String? merchantID;
  String? mapSKU;

  PostSkuModel({
    required this.skuid,
    required this.barcodePos,
    required this.productName,
    required this.brandID,
    required this.productGroupID,
    required this.productCatID,
    required this.productSubCatID,
    required this.productSizeID,
    required this.productUnit,
    required this.packSize,
    required this.unit,
    required this.banForPracharat,
    required this.isVat,
    required this.createBy,
    required this.createDate,
    required this.isActive,
    required this.merchantID,
    required this.mapSKU,
  });

  Map<String, dynamic> toJson() {
    return {
      "skuid": skuid,
      "barcodePOS": barcodePos,
      "productName": productName,
      "brandID": brandID,
      "productGroupID": productGroupID,
      "productCatID": productCatID,
      "productSubCatID": productSubCatID,
      "productSizeID": productSizeID,
      "productUnit": productUnit,
      "packSize": packSize,
      "unit": unit,
      "banForPracharat": banForPracharat,
      "isVat": isVat,
      "createBy": createBy,
      "createDate": createDate,
      "isActive": isActive,
      "merchantID": merchantID,
      "mapSKU": mapSKU,
    };
  }
}

class TitleSkuModel {
  String departmentTitle;
  String categoryTitle;
  String subcategoryTitle;
  String brandTitle;
  String sizeTitle;
  String unitTitle;

  TitleSkuModel(
      {required this.departmentTitle,
      required this.categoryTitle,
      required this.subcategoryTitle,
      required this.brandTitle,
      required this.sizeTitle,
      required this.unitTitle});
}
