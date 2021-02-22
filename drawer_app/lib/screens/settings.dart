import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  static const String routname = "/Settings";

  Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configuración"),
      ),
      body: Container(
        child: Center(child: Text("Configuración")),
      ),
    );
  }
}
