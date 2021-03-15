import 'package:flutter/material.dart';
import 'package:login_bloc_app/src/bloc/bloc.dart';
import 'package:login_bloc_app/src/screens/login_screen.dart';
import 'package:provider/provider.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: missing_required_param
    return Provider<Bloc>(
      // ignore: deprecated_member_use
      builder:  (context)=>Bloc(),
      dispose: (context,bloc)=>bloc.dispose(),
      child: new MaterialApp(
        home: Scaffold(body: LoginScreen()),
      ),
    );
  }
}
