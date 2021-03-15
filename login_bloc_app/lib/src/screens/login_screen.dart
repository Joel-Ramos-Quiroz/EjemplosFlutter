import 'package:flutter/material.dart';
import 'package:login_bloc_app/src/bloc/bloc.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc=Provider.of<Bloc>(context);
    return new Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            emailField(bloc),
            passwordField(bloc),
            Container(
              margin: EdgeInsets.only(top: 25.0),
            ),
            submitButton()
          ],
        ));
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        //para renderizar el witget
        return TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: 'ejemplo@gmail.com',
                labelText: 'Email',
                errorText: snapshot.error),
            onChanged: bloc.changeEmail);
      },
    );
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
            decoration: InputDecoration(
                hintText: 'Contraseña', labelText: 'Contraseña', errorText: snapshot.error),
            onChanged: bloc.changePassword);
      },
    );
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder
    stream: bloc.su
    )
    return RaisedButton(
      child: Text('Enviar'),
      onPressed: () {},
    );
  }
}
