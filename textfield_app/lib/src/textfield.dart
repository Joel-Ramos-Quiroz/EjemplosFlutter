import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  MyTextField({Key key}) : super(key: key);

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  String input = "";

  void onSubmitted(String value) {
    setState(() {
      input = input + "\n" + value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Textfield widget"),
      ),
      body: Container(
        child: Column(children: <Widget>[
          TextField(
            decoration: InputDecoration(hintText: "Ingrese el Texto"),
            onSubmitted: onSubmitted,
          ),
          Text(input)
        ]),
      ),
    );
  }
}
