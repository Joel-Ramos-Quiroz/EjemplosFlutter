import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatelessWidget {

Drawer getDrawer(BuildContext context){

  ListTile getItem(Icon icon, String descripcion, String route) {
    return ListTile(
        leading: icon,
        title: Text(descripcion),
        onTap: () {
          Navigator.pushNamed(context, route);
        });
  }
  
  Widget _createHeader() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image:  NetworkImage('https://i.ibb.co/tXCbsX3/Ingleby-fondo.png'))),
      child: Stack(children: <Widget>[
        Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text("Flutter Step-by-Step",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500))),
      ]));
}

  ListView getList() {
    return ListView(
      children: <Widget>[
        _createHeader(),
        getItem(Icon(Icons.settings), "Configuración","/Settings"),
        getItem(Icon(Icons.home), "Página Principal","/"),
        getItem(Icon(Icons.battery_charging_full), "Batería","/Bateria"),
      ],
    );
  }
  return Drawer(child: getList(),);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página Principal"),
      ),
      drawer: Drawer(child: getDrawer(context)),
    );
  }
}
