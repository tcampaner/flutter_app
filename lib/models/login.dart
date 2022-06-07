import 'models.dart';

class Login {
  Login({
    required this.id,
    required this.email,
    required this.nom,
    required this.llinatges,
    required this.gestor,
    required this.dni,
    required this.telefon,
    required this.rememberToken,
    required this.apiToken,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String email;
  String nom;
  String llinatges;
  String gestor;
  String dni;
  String telefon;
  dynamic rememberToken;
  String apiToken;
  dynamic createdAt;
  DateTime updatedAt;

  factory Login.fromJson(String str) => Login.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Login.fromMap(Map<String, dynamic> json) => Login(
        id: json["id"],
        email: json["email"],
        nom: json["nom"],
        llinatges: json["llinatges"],
        gestor: json["gestor"],
        dni: json["dni"],
        telefon: json["telefon"],
        rememberToken: json["remember_token"],
        apiToken: json["api_token"],
        createdAt: json["created_at"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "nom": nom,
        "llinatges": llinatges,
        "gestor": gestor,
        "dni": dni,
        "telefon": telefon,
        "remember_token": rememberToken,
        "api_token": apiToken,
        "created_at": createdAt,
        "updated_at": updatedAt.toIso8601String(),
      };
}
