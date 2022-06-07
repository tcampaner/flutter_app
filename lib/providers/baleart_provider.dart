import 'package:flutter/cupertino.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import '../models/models.dart';

class EspaisProvider extends ChangeNotifier {
  List<Espai> onDisplayEspais = [];
  String urlapi = 'www.dawpaucasesnoves.com';

  EspaisProvider() {
    //print('mp ini');
    getOnDisplayEspais('baleartapi/public/espais');
  }

  getOnDisplayEspais(urlPath) async {
    var url = Uri.http(urlapi, urlPath);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final nowPlayingResponse = new EspaisResponse.fromJson(response.body);
      onDisplayEspais = nowPlayingResponse.result;
      notifyListeners(); // notifica als usuaris dels providers que hi ha un canvi de valors
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
