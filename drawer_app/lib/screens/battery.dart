import 'package:flutter/material.dart';

class Bateria extends StatefulWidget {
  static const String routname="/Bateria";

  Bateria({Key key}) : super(key: key);

  @override
  _BateriaState createState() => _BateriaState();
}

class _BateriaState extends State<Bateria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Bateria"),),
         body: Container(
           child:Center(
             child: Text("Bateria")
           ),
         ),
    );
  }
}