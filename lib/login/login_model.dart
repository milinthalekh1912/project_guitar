class LoginModel {
  String username;
  String password;
  String posclientId;
  String version;

  LoginModel(
      {required this.username,
        required this.password,
        required this.posclientId,
        required this.version,
      });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
        username: json["username"] ?? "",
        password: json['password'] ?? "",
        posclientId: json["posclientid"] ?? "",
        version: "",
    );
  }
  Map<String, dynamic> toJson() {
    Map<String, String> map = {
      'username': username,
      'password': password,
      'posclientid': username,
      'version':version,
    };
    return map;
  }
}
