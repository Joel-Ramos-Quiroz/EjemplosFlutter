import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:form_app/src/mixins/validation_mixins.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixins {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30.0),
      child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              emailField(),
              paswordField(),
              Container(
                margin: EdgeInsets.only(top: 25.0),
              ),
              submitField()
            ],
          )),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration:
          InputDecoration(labelText: 'Email', hintText: 'tu@example.com'),
      validator: validateEmail,
      onSaved: (String value) {
        print("Save "+value);
      },
    );
  }

  Widget paswordField() {
    return TextFormField(
      //keyboardType: TextInputType.visiblePassword,
      decoration:
          InputDecoration(labelText: 'Contraseña', hintText: 'Contraseña'),
      validator: validatePaswword,
      onSaved: (String value) {
        print("Save "+value);
      },
    );
  }

  Widget submitField() {
    return RaisedButton(
      color: Colors.blue,
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(8.0),
      splashColor: Colors.blueAccent,
      child: Text("Enviar"),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
        }
      },
    );
  }
}
