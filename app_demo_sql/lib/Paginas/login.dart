import 'package:app_demo_sql/Paginas/home.dart';
import 'package:app_demo_sql/objetos/objLogin.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../common/HttpHandler.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  HttpHandler _client = HttpHandler.get();

  final _usuario = new TextEditingController(text: "");
  final _clave = new TextEditingController(text: "");
  Color co_verde_oscuro = Color(0xFF2B5B3C);
  bool _obscureText = true;
  // Toggles the password show status
  void _togglePasswordStatus() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 72,
        child: Image.asset('assets/logo.png'),
      ),
    );

    final usuario = TextFormField(
      keyboardType: TextInputType.number,
      controller: _usuario,
      autofocus: false,
      maxLength: 8,
      //obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.account_box,
          color: co_verde_oscuro,
        ),
        //hintText: 'Usuario',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        labelText: 'Dni :',
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: co_verde_oscuro,
              style: BorderStyle.solid,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(32.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: co_verde_oscuro,
              style: BorderStyle.solid,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(32.0)),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28.0),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );

    final clave = TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: _clave,
      autofocus: false,
      maxLength: 15,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.lock,
          color: co_verde_oscuro,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: _togglePasswordStatus,
          color: co_verde_oscuro,
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        labelText: 'Clave :',
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: co_verde_oscuro,
              style: BorderStyle.solid,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(32.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: co_verde_oscuro,
              style: BorderStyle.solid,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(32.0)),
      ),
      validator: (val) {
        return val.length < 6
            ? 'Ingrese una contraseña de más de 6 caracteres'
            : null;
      },
      obscureText: _obscureText,
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 10.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 50.0,
          /*
          onPressed: () {
            Navigator.of(context).pushNamed(Home_Page.tag);
          },
          */
          onPressed: pa_Login,
          color: co_verde_oscuro,
          child: Text('INICIAR SESIÓN', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        '¿Se te olvidó tu contraseña?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
        _showAlert("Mensaje Demo", 0);
      },
    );

    return new Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            usuario,
            SizedBox(height: 8.0),
            clave,
            SizedBox(height: 24.0),
            loginButton,
            forgotLabel
          ],
        ),
      ),
    );
  }

  void _showAlert(String msj, int code) {
    AwesomeDialog(
            context: context,
            dialogType: code == 0 ? DialogType.SUCCES : DialogType.ERROR,
            animType: AnimType.RIGHSLIDE,
            headerAnimationLoop: false,
            title: code == 0 ? 'Aviso' : 'Error',
            desc: msj,
            btnOkOnPress: () {},
            btnOkIcon: Icons.cancel,
            btnOkColor: code == 0 ? Colors.green : Colors.red)
        .show();
  }

  Future pa_Login() async {
    if (_usuario.text.length == 0 || _clave.text.length == 0) {
      _showAlert("Complete todos los Campos", 1);
    } else {
      ObjLogin obj = new ObjLogin(
        usuario: _usuario.text,
        clave: _clave.text,
      );
      List data;
      data = await _client.fetchLogin(obj.toMap());
      obj.msj = data[1].toString();
      if (data[2].toString() == "0") {
        //Navigator.of(context).pushNamed(Home_Page.tag);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Home(
                      obj,
                    )));
      } else {
        _showAlert(data[0].toString(), 1);
      }
    }
  }
}
