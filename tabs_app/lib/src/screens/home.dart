import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.red),
      child: Column(
        //Para centrar el icono en toda la pantalla
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.home,size: 170.0,color:Colors.white
          ),
          Text("Primer Tab",style: TextStyle(fontSize: 32,color: Colors.white,)),
        ],
      ),
    );
  }
}