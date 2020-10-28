import 'package:flutter/material.dart';
import 'package:user_preferences/src/shared_prefs/preferencias_usuario.dart';
import 'package:user_preferences/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  static final String routeName = 'home';
  final prefs = new PreferenciasUsuarios();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
        backgroundColor: (prefs.colorSecundario ? Colors.black  : Colors.blueAccent),
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color secundario ${prefs.colorSecundario}'),
          Divider(),
          Text('Genero ${prefs.genero}'),
          Divider(),
          Text('Nombre de usuario ${prefs.nombre}'),
          Divider(),
        ],
      ),
    );
  }
}
