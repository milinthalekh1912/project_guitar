class GeneralInfoModel {
  String authorized;
  GeneralInfoModel({required this.authorized});
}

class GeneralInfoResponse200Model {
  final String info;

  GeneralInfoResponse200Model({required this.info});

  factory GeneralInfoResponse200Model.fromJson(Map<String, dynamic> json) {
    return GeneralInfoResponse200Model(
      info: json['info'] ?? "",
    );
  }
}

class GeneralInfoResponse500Model {
  String errorCode;
  String errorDetails;

  GeneralInfoResponse500Model(
      {required this.errorCode, required this.errorDetails});

  factory GeneralInfoResponse500Model.fromJson(Map<String, dynamic> json) {
    return GeneralInfoResponse500Model(
      errorCode: json['errorCode'],
      errorDetails: json['errorDetails'],
    );
  }
}

class GeneralInfoResponse401Model {
  String type;
  String title;
  int status;
  String detail;
  String instance;

  GeneralInfoResponse401Model({
    required this.type,
    required this.title,
    required this.status,
    required this.detail,
    required this.instance,
  });

  factory GeneralInfoResponse401Model.fromJson(Map<String, dynamic> json) {
    return GeneralInfoResponse401Model(
      type: json['type'] ?? "",
      title: json['title'] ?? "",
      status: json['status'] ?? 0,
      detail: json['details'] ?? "",
      instance: json['instance'] ?? "",
    );
  }
}
