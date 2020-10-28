import 'package:flutter/material.dart';
import 'package:user_preferences/src/shared_prefs/preferencias_usuario.dart';
import 'package:user_preferences/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key key}) : super(key: key);

  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario = false;
  int _genero = 1;
  TextEditingController _textController;
  final prefs = new PreferenciasUsuarios();

  @override
  void initState() {
    super.initState();
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _textController = new TextEditingController(
      text: prefs.nombre,
    );
    prefs.ultimaPagina = SettingsPage.routeName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor:
            (prefs.colorSecundario ? Colors.black : Colors.blueAccent),
      ),
      drawer: MenuWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Settigns',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(),
            SwitchListTile(
              value: _colorSecundario,
              title: Text('Color secundario'),
              onChanged: (bool valor) => setState(
                () {
                  _colorSecundario = valor;
                  prefs.colorSecundario = valor;
                },
              ),
            ),
            RadioListTile(
              value: 1,
              title: Text('Masculino'),
              groupValue: _genero,
              onChanged: _setSelectedRadio,
            ),
            RadioListTile(
              value: 2,
              title: Text('Femenino'),
              groupValue: _genero,
              onChanged: _setSelectedRadio,
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Nombre del usuario',
                ),
                onChanged: (String valor) {
                  prefs.nombre = valor;
                },
                controller: _textController,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _setSelectedRadio(int value) async {
    prefs.genero = value;
    setState(() {});
  }
}
