import 'package:app_demo_sql/Paginas/info_app.dart';
import 'package:app_demo_sql/objetos/objLogin.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static String tag = 'home-page';
  final ObjLogin obj;
  Home(this.obj);

  Drawer getDrawer(BuildContext context) {
    ListTile getItem(Icon icon, String descripcion, String route) {
      return ListTile(
          leading: icon,
          title: Text(descripcion),
          onTap: () {
            Navigator.pushNamed(context, route);
          });
    }

    ListTile getItemOtro(Icon icon, String descripcion) {
      return ListTile(
          leading: icon,
          title: Text(descripcion),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Home_Page(
                          obj,
                        )));
          });
    }

    var info = AboutListTile(
      child: Text("Información App"),
      applicationIcon: Icon(Icons.info),
      applicationVersion: "v1.0.0",
      icon: Icon(Icons.info),
    );

/*
    Widget _createHeader() {
      return DrawerHeader(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/foto.jpg'))),
          child: Stack(children: <Widget>[
            Positioned(
                bottom: 12.0,
                left: 16.0,
                child: Text("Bienvenido(a) "+obj.msj.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500))),
          ]));
    }
*/

    ListView getList() {
      return ListView(
        children: <Widget>[
          //_createHeader(),
          UserAccountsDrawerHeader(
            accountName: Text("Bienvenido(a) :",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
            accountEmail: Text(obj.msj.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
            currentAccountPicture: CircleAvatar(
              radius: 72,
              backgroundImage: AssetImage('assets/foto.jpg'),
              foregroundColor: Colors.white,
              /* child: Text(  
                  "A",  
                  style: TextStyle(fontSize: 40.0),  
                ),  
                */
            ),
            decoration: BoxDecoration(color: const Color(0xFF2B5B3C)),
            onDetailsPressed: () {
              Navigator.pop(context);
              //Navigator.pushNamed(context, Routes.userAccountEdit);
            },
          ),
          getItem(Icon(Icons.home), "Página Principal", "/"),
          getItem(Icon(Icons.settings), "Consumo de Energía",
              "regconsumoenergia-page"),
          //getItemOtro(Icon(Icons.info), "Mi pagina"),
          //getItem(Icon(Icons.battery_charging_full), "Batería", "/Bateria"),
          info,
        ],
      );
    }

    return Drawer(
      child: getList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3E7E54),
        title: Text("Página Principal", style: TextStyle(color: Colors.white)),
      ),
      drawer: Drawer(child: getDrawer(context)),
    );
  }
}
