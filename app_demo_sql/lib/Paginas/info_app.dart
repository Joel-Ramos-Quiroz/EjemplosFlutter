import 'package:app_demo_sql/objetos/objLogin.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Home_Page extends StatelessWidget {
  static String tag = 'info_app';
  final ObjLogin obj;
  Home_Page(this.obj);

  @override
  Widget build(BuildContext context) {
    final alucard = Hero(
      tag: 'hero',
      child: Padding(
          padding: EdgeInsets.all(16.0),
          child: CircleAvatar(
            radius: 72,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/foto.jpg'),
          )),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Bienvenido(a) ' + obj.msj,
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final lorem = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse et turpis a diam viverra euismod. Morbi sem ligula, efficitur non es',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );


    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.00),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.blue,
            Colors.red,
          ],
        ),
      ),
      child: Column(
        children: <Widget>[alucard, welcome, lorem],
      ),
    );

    return Scaffold(
      body: body,
    );
  }
}
