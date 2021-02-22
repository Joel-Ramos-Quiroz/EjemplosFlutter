import 'package:flutter/material.dart';
import 'package:tabs_app/src/screens/contact.dart';
import 'package:tabs_app/src/screens/home.dart';
import 'package:tabs_app/src/screens/video.dart';

class MyTabs extends StatefulWidget {
  MyTabs({Key key}) : super(key: key);

  @override
  _MyTabsState createState() => _MyTabsState();
}

class _MyTabsState extends State<MyTabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title:
                Center(child: Text("Video Tabss", textAlign: TextAlign.center)),
            /*bottom: TabBar(
              indicatorColor: Colors.blueAccent,
              //indicator: UnderlineTabIndicator(
              //borderSide: BorderSide(width: 9.0)),
              tabs: <Widget>[
                Tab(text: "INICIO", icon: Icon(Icons.home)),
                Tab(text: "VIDEOS", icon: Icon(Icons.ondemand_video)),
                Tab(text: "CONTACTOS", icon: Icon(Icons.contacts)),
              ],
            ),*/
          ),
          body: TabBarView(
            children: <Widget>[Home(), Video(), Contact()],
          ),
          bottomNavigationBar: 
            Material(
              color: Colors.purple[800],
              child: TabBar(tabs: <Tab>[
                Tab(text: "INICIO", icon: Icon(Icons.home)),
                Tab(text: "VIDEOS", icon: Icon(Icons.ondemand_video)),
                Tab(text: "CONTACTOS", icon: Icon(Icons.contacts)),
              ]),
            ),
          ),
        );
  }
}
