import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuarios {
  static final PreferenciasUsuarios _instancia =
      new PreferenciasUsuarios._internal();

  factory PreferenciasUsuarios() {
    return _instancia;
  }

  PreferenciasUsuarios._internal() {
    initPrefs();
  }

  SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get genero {
    return _prefs.getInt('genero');
  }

  set genero(int value) {
    _prefs.setInt('genero', value);
  }
}
