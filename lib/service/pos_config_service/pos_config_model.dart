import 'dart:ffi';

class PosConfigModel {
  String authorization;
  PosConfigModel({required this.authorization});
}

class PosConfigModelModelResponseModel {}

class PosConfigModelResponse200Model {
  String posClientID;
  String branchID;
  String branchName;
  String accountName;
  String accountCode;
  String merchantID;
  String merchantName;
  bool isDrawer;
  bool isBarcode;
  bool isQRCode;
  int sessionType;
  int barcodeReaderType;
  int printerType;
  bool isActive;
  String posRunning;
  bool isVat;
  PosConfigModelResponse200Model({
    required this.posClientID,
    required this.branchID,
    required this.branchName,
    required this.accountName,
    required this.accountCode,
    required this.merchantID,
    required this.merchantName,
    required this.isDrawer,
    required this.isBarcode,
    required this.isQRCode,
    required this.sessionType,
    required this.barcodeReaderType,
    required this.printerType,
    required this.isActive,
    required this.posRunning,
    required this.isVat,
  });

  factory PosConfigModelResponse200Model.fromJson(Map<String, dynamic> json) {
    return PosConfigModelResponse200Model(
      posClientID: json['posClientID'] ?? "",
      branchID: json['branchID'] ?? "",
      branchName: json['branchName'],
      accountName: json['accountName'] ?? "",
      accountCode: json['accountCode'] ?? "",
      merchantID: json['merchantID'] ?? "",
      merchantName: json['merchantName'],
      isDrawer: json['isDrawer'] ?? false,
      isBarcode: json['isBarcode'] ?? false,
      isQRCode: json['isQRCode'] ?? false,
      sessionType: json['sessionType'] ?? 0,
      barcodeReaderType: json['barcodeReaderType'] ?? 0,
      printerType: json['printerType'] ?? 0,
      isActive: json['isActive'] ?? false,
      posRunning: json['posRunning'],
      isVat: json['isVat'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'posClientID': posClientID,
      'branchID': branchID,
      'branchName': branchName,
      "accountName": accountName,
      "accountCode": accountCode,
      'merchantID': merchantID,
      'merchantName': merchantName,
      'isDrawer': isDrawer,
      'isBarcode': isBarcode,
      'isQRCode': isQRCode,
      'sessionType': sessionType,
      'barcodeReaderType': barcodeReaderType,
      'printerType': printerType,
      'isActive': isActive,
      'posRunning': posRunning,
      'isVat': isVat,
    };
    return map;
  }
}

class PosConfigModelResponse500Model {
  String errorCode;
  String errorDetails;

  PosConfigModelResponse500Model(
      {required this.errorCode, required this.errorDetails});

  factory PosConfigModelResponse500Model.fromJson(Map<String, dynamic> json) {
    return PosConfigModelResponse500Model(
      errorCode: json['errorCode'],
      errorDetails: json['errorDetails'],
    );
  }
}

class PosConfigModelResponse401Model {
  String type;
  String title;
  Int32 status;
  String detail;
  String instance;
  String additionalProp1;
  String additionalProp2;
  String additionalProp3;

  PosConfigModelResponse401Model(
      {required this.type,
      required this.title,
      required this.status,
      required this.detail,
      required this.instance,
      required this.additionalProp1,
      required this.additionalProp2,
      required this.additionalProp3});

  factory PosConfigModelResponse401Model.fromJson(Map<String, dynamic> json) {
    return PosConfigModelResponse401Model(
      type: json['type'] ?? "",
      title: json['title'] ?? "",
      status: json['status'],
      detail: json['details'] ?? "",
      instance: json['instance'] ?? "",
      additionalProp1: json['additionalProp1'] ?? "",
      additionalProp2: json['additionalProp2'] ?? "",
      additionalProp3: json['additionalProp3'] ?? "",
    );
  }
}
