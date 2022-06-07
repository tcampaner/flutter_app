import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;
  static String _email = '';
  static String _password = '';

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static set email(String valor) {
    _email = valor;
    _prefs.setString('email', valor);
  }

  static String get email {
    return _prefs.getString('email') ?? _email;
  }

  static set password(String valor) {
    _password = valor;
    _prefs.setString('password', valor);
  }

  static String get password {
    return _prefs.getString('password') ?? _password;
  }
}
