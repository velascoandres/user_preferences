import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_preferences/src/pages/home_page.dart';

class PreferenciasUsuarios {
  static final PreferenciasUsuarios _instancia =
      new PreferenciasUsuarios._internal();

  factory PreferenciasUsuarios() {
    return _instancia;
  }

  PreferenciasUsuarios._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  int get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int value) {
    _prefs.setInt('genero', value);
  }

  bool get colorSecundario {
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool value) {
    _prefs.setBool('colorSecundario', value);
  }

  String get nombre {
    return _prefs.getString('nombre') ?? '';
  }

  set nombre(String value) {
    _prefs.setString('nombre', value);
  }

  String get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'home';
  }

  set ultimaPagina(String value) {
    _prefs.setString('ultimaPagina', value);
  }
}
