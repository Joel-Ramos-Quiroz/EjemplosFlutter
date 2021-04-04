import 'package:app_demo_sql/Paginas/info_app.dart';
import 'package:flutter/material.dart';
import 'package:app_demo_sql/Paginas/home.dart';
import 'Paginas/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

final routes=<String,WidgetBuilder>{
  LoginPage.tag:(context)=>LoginPage(),
  Home.tag:(context)=>Home(null),
  Home_Page.tag:(context)=>Home_Page(null),
};

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejemplo',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: routes,
    );
  }
}
