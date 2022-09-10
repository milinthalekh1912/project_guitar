class AuthorizationModel {
  String authorization;
  AuthorizationModel({required this.authorization});

  factory AuthorizationModel.fromJson(Map<String, dynamic> json) {
    return AuthorizationModel(authorization: json['authorization']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'authorization': authorization,
    };
    return map;
  }
}
