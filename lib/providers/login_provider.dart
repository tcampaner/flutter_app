import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:practica_final_2/shared_preferences/preferences.dart';
import '../models/models.dart';

class LoginProvider extends ChangeNotifier {
  Login? login;
  String status = '';
  bool carregant = false;
  String urlapi = 'www.dawpaucasesnoves.com';
  String urlPath = 'baleartapi/public/login';

  Future<void> ferLogin(String email, String password) async {
    var url = Uri.http(urlapi, urlPath);
    final headers = {'Content-Type': 'application/json'};
    carregant = true;
    notifyListeners();
    var response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}));
    carregant = false;
    if (response.statusCode == 200) {
      final loginResponse = new LoginResponse.fromJson(response.body);
      login = loginResponse.result;
      status = loginResponse.status;
      Preferences.email = email;
      Preferences.password = password;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    notifyListeners();
  }
}
