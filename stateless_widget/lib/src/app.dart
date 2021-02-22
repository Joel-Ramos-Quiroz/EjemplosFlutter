import 'package:flutter/material.dart';
import 'package:starteful_widget/src/screens/card.dart';

class MyApp extends StatelessWidget {
final double iconSize=40.0;
final TextStyle textStyle=TextStyle(color: Colors.grey,fontSize: 30.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateles Widget'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          MyCard(
            title:
            Text("TE AMO",style: this.textStyle,),
            icon: Icon(Icons.favorite,color: Colors.redAccent,size: this.iconSize),
          ),
          MyCard(
            title:
            Text("I LIKE THIS VIDEO",style: this.textStyle,),
            icon: Icon(Icons.headset_rounded,color: Colors.teal[900],size: this.iconSize),
          ),
          MyCard(
            title:
            Text("NEXT VIDEO",style: this.textStyle,),
            icon: Icon(Icons.linked_camera_outlined,color: Colors.purpleAccent,size: this.iconSize),
          )
        ]),
      ),
    );
  }
}
