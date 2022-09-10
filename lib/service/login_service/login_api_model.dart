class LoginResponseModel {}

class LoginResponse200Model implements LoginResponseModel {
  final String username;
  final String token;
  final String expiration;

  LoginResponse200Model(
      {required this.username, required this.token, required this.expiration});

  factory LoginResponse200Model.fromJson(Map<String, dynamic> json) {
    return LoginResponse200Model(
      username: json['username'] ?? "",
      token: json["token"] ?? "",
      expiration: json["expiration"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "token": token,
      "expiration": expiration,
    };
  }
}

class LoginResponse500Model implements LoginResponseModel {
  final String errorCode;
  final String errorDetail;

  LoginResponse500Model({required this.errorCode, required this.errorDetail});

  factory LoginResponse500Model.fromJson(Map<String, dynamic> json) {
    return LoginResponse500Model(
      errorCode: json['errorCode'] ?? "",
      errorDetail: json["errorDetail"] ?? "",
    );
  }
}

class LoginRequestModel {
  String username = " ";
  String password = " ";
  String posclientid = " ";
  String version = "";

  LoginRequestModel({
    required this.username,
    required this.password,
    required this.posclientid,
    required this.version,
  });

  Map<String, dynamic> toJson() {
    Map<String, String> map = {
      'username': username,
      'password': password,
      'posclientid': posclientid,
      'version': version
    };
    return map;
  }
}
