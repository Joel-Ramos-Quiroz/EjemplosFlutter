import 'package:app_demo_sql/Paginas/consumo_energia.dart';
import 'package:app_demo_sql/Paginas/info_app.dart';
import 'package:app_demo_sql/Paginas/mod_consumo_energia/reg_consumo_energia.dart';

import 'package:flutter/material.dart';
import 'package:app_demo_sql/Paginas/home.dart';
import 'Paginas/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    RegConsumoEnergia.tag: (context) => RegConsumoEnergia(),
    ConsumoEnergia.tag: (context) => ConsumoEnergia(),
    Home.tag: (context) => Home(null),
    Home_Page.tag: (context) => Home_Page(null),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Operaciones',
      //debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: routes,
    );
  }
}
