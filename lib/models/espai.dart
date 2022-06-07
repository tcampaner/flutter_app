import 'dart:convert';
import 'models.dart';

class Espai {
  Espai({
    required this.id,
    required this.nom,
    required this.desc,
    required this.numRegistre,
    required this.municipiId,
    required this.adreca,
    required this.telefon,
    required this.web,
    required this.email,
    required this.valoracio,
    required this.destacat,
    required this.tipusId,
    //required this.createdAt,
    //required this.updatedAt,
    required this.municipi,
    //required this.illa,
    required this.foto,
    //required this.tipus,
    required this.idmodalitats,
    required this.idserveis,
    required this.modalitats,
    required this.serveis,
  });

  int id;
  String nom;
  String desc;
  String numRegistre;
  int municipiId;
  String adreca;
  String telefon;
  String web;
  String email;
  String valoracio;
  int destacat;
  int tipusId;
  //dynamic createdAt;
  //DateTime updatedAt;
  String municipi;
  // Illa? illa;
  Foto? foto;
  //Tipus? tipus;
  List<int> idmodalitats;
  List<int> idserveis;
  List<Modalitat> modalitats;
  List<ServeiElement> serveis;

  get fotoPath {
    if (this.foto != null) {
      return this.foto!.uri;
    } else {
      return 'https://i.stack.imgur.com/GNhxO.png';
    }
  }

  factory Espai.fromJson(String str) => Espai.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Espai.fromMap(Map<String, dynamic> json) => Espai(
        id: json["id"],
        nom: json["nom"],
        desc: json["desc"],
        numRegistre: json["num_registre"],
        municipiId: json["municipi_id"],
        adreca: json["adreca"],
        telefon: json["telefon"],
        web: json["web"],
        email: json["email"],
        valoracio: json["valoracio"],
        destacat: json["destacat"],
        tipusId: json["tipus_id"],
        //createdAt: json["created_at"],
        //updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        municipi: json["municipi"],
        //illa: json["illa"] == null ? null : illaValues.map[json["illa"]],
        foto: json["foto"] == null ? null : Foto.fromMap(json["foto"]),
        //tipus: tipusValues.map[json["tipus"]],
        idmodalitats: List<int>.from(json["idmodalitats"].map((x) => x)),
        idserveis: List<int>.from(json["idserveis"].map((x) => x)),
        modalitats: List<Modalitat>.from(
            json["modalitats"].map((x) => Modalitat.fromMap(x))),
        serveis: List<ServeiElement>.from(
            json["serveis"].map((x) => ServeiElement.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nom": nom,
        "desc": desc,
        "num_registre": numRegistre,
        "municipi_id": municipiId,
        "adreca": adreca,
        "telefon": telefon,
        "web": web,
        "email": email,
        "valoracio": valoracio,
        "destacat": destacat,
        "tipus_id": tipusId,
        //"created_at": createdAt,
        //"updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "municipi": municipi,
        // "illa": illa == null ? null : illaValues.reverse[illa],
        "foto": foto == null ? null : foto?.toMap(),
        //"tipus": tipusValues.reverse[tipus],
        "idmodalitats": List<dynamic>.from(idmodalitats.map((x) => x)),
        "idserveis": List<dynamic>.from(idserveis.map((x) => x)),
        "modalitats": List<dynamic>.from(modalitats.map((x) => x.toMap())),
        "serveis": List<dynamic>.from(serveis.map((x) => x.toMap())),
      };
}

class Foto {
  Foto({
    required this.id,
    required this.uri,
    required this.espaiId,
    required this.descripcio,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String uri;
  int espaiId;
  String descripcio;
  DateTime createdAt;
  DateTime updatedAt;

  factory Foto.fromJson(String str) => Foto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Foto.fromMap(Map<String, dynamic> json) => Foto(
        id: json["id"],
        uri: json["uri"],
        espaiId: json["espai_id"],
        descripcio: json["descripcio"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic>? toMap() => {
        "id": id,
        "uri": uri,
        "espai_id": espaiId,
        "descripcio": descripcio,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

/*
enum Illa { MALLORCA }

final illaValues = EnumValues({
    "Mallorca": Illa.MALLORCA
});
*/

class Modalitat {
  Modalitat({
    required this.espaiId,
    required this.modalitatId,
    required this.createdAt,
    required this.updatedAt,
  });

  int espaiId;
  int modalitatId;
  dynamic createdAt;
  dynamic updatedAt;

  factory Modalitat.fromJson(String str) => Modalitat.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Modalitat.fromMap(Map<String, dynamic> json) => Modalitat(
        espaiId: json["espai_id"],
        modalitatId: json["modalitat_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toMap() => {
        "espai_id": espaiId,
        "modalitat_id": modalitatId,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class ServeiElement {
  ServeiElement({
    required this.espaiId,
    required this.serveiId,
    required this.createdAt,
    required this.updatedAt,
    required this.servei,
  });

  int espaiId;
  int serveiId;
  dynamic createdAt;
  dynamic updatedAt;
  ServeiServei servei;

  factory ServeiElement.fromJson(String str) =>
      ServeiElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ServeiElement.fromMap(Map<String, dynamic> json) => ServeiElement(
        espaiId: json["espai_id"],
        serveiId: json["servei_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        servei: ServeiServei.fromMap(json["servei"]),
      );

  Map<String, dynamic> toMap() => {
        "espai_id": espaiId,
        "servei_id": serveiId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "servei": servei.toMap(),
      };
}

class ServeiServei {
  ServeiServei({
    required this.id,
    required this.desc,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String desc;
  dynamic createdAt;
  dynamic updatedAt;

  factory ServeiServei.fromJson(String str) =>
      ServeiServei.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ServeiServei.fromMap(Map<String, dynamic> json) => ServeiServei(
        id: json["id"],
        desc: json["desc"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "desc": desc,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
/*
enum Tipus { MUSEU, GALERIA, CENTRE_CULTURAL }

final tipusValues = EnumValues({
    "Centre Cultural": Tipus.CENTRE_CULTURAL,
    "Galeria": Tipus.GALERIA,
    "Museu": Tipus.MUSEU
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}*/
