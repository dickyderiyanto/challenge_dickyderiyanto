import 'dart:convert';

LoginModel loginModelFromMap(String str) =>
    LoginModel.fromMap(json.decode(str));
String loginModelToMap(LoginModel data) => json.encode(data.toMap());

class LoginModel {
  final int status;
  final String message;
  final Data data;
  final Links links;

  LoginModel({
    required this.status,
    required this.message,
    required this.data,
    required this.links,
  });

  factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromMap(json["data"]),
        links: Links.fromMap(json["links"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data.toMap(),
        "links": links.toMap(),
      };
}

class Data {
  final String token;

  Data({
    required this.token,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "token": token,
      };
}

class Links {
  final String apiUrl;
  final String apiUrlVersion;
  final String imageUrl;

  Links({
    required this.apiUrl,
    required this.apiUrlVersion,
    required this.imageUrl,
  });

  factory Links.fromMap(Map<String, dynamic> json) => Links(
        apiUrl: json["api_url"],
        apiUrlVersion: json["api_url_version"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toMap() => {
        "api_url": apiUrl,
        "api_url_version": apiUrlVersion,
        "image_url": imageUrl,
      };
}

class LoginRequestModel {
  String? phoneNumber;
  String? password;
  String? countryCode;

  LoginRequestModel({
    this.phoneNumber,
    this.password,
    this.countryCode,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone_number'] = phoneNumber;
    data['password'] = password;
    data['country_code'] = countryCode;
    return data;
  }
}
