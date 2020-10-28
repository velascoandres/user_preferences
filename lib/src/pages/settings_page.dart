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
  String _nombre = 'Pedro';
  TextEditingController _textController;
  final prefs = new PreferenciasUsuarios();

  @override
  void initState() {
    super.initState();
    _textController = new TextEditingController(
      text: _nombre,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
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
              onChanged: (valor) => setState(
                () => _colorSecundario = valor,
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
                onChanged: (valor) {},
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
