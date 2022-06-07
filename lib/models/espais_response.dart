// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'dart:convert';
import 'models.dart';

class EspaisResponse {
  EspaisResponse({
    required this.status,
    required this.result,
  });

  String status;
  List<Espai> result;

  factory EspaisResponse.fromJson(String str) =>
      EspaisResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EspaisResponse.fromMap(Map<String, dynamic> json) => EspaisResponse(
        status: json["status"],
        result: List<Espai>.from(json["result"].map((x) => Espai.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "result": List<dynamic>.from(result.map((x) => x.toMap())),
      };
}
