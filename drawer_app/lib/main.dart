import 'package:drawer_app/home.dart';
import 'package:drawer_app/screens/battery.dart';
import 'package:drawer_app/screens/settings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    routes: <String, WidgetBuilder>{
      Settings.routname: (BuildContext context) => Settings(),
      Bateria.routname: (BuildContext context) => Bateria(),
    },
  ));
}
