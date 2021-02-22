import 'package:flutter/material.dart';

class Video extends StatelessWidget {
  const Video({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.red),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.ondemand_video,size: 170.0,color:Colors.white
          ),
          Text("Segundo Tab",style: TextStyle(fontSize: 32,color: Colors.white,)),
        ],
      ),
    );
  }
}