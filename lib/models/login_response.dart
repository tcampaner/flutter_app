import 'dart:convert';
import 'models.dart';

class LoginResponse {
  LoginResponse({
    required this.status,
    required this.result,
  });

  String status;
  Login result;

  factory LoginResponse.fromJson(String str) =>
      LoginResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
        status: json["status"],
        result: Login.fromMap(json["result"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "result": result.toMap(),
      };
}
