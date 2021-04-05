import 'package:app_demo_sql/common/HttpHandler.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';

class RegConsumoEnergia extends StatefulWidget {
  static String tag = 'regconsumoenergia-page';
  @override
  _RegConsumoEnergiaPageState createState() => _RegConsumoEnergiaPageState();
}

class _RegConsumoEnergiaPageState extends State<RegConsumoEnergia> {
  HttpHandler _client = HttpHandler.get();

  Color colorverdeoscuro = Color(0xFF2B5B3C);

  String myActivity;
  String myActivityResult;
  final formKey = new GlobalKey<FormState>();

  Future pa_consultar_fundos() async {
    List data;
    data = await _client.fetchConsultarFundos();
    print(data.toString());
  }

  @override
  void initState() {
    super.initState();
    myActivity = '';
    myActivityResult = '';
    this.pa_consultar_fundos();
  }

  saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        myActivityResult = myActivity;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final dropubicacion = DropDownFormField(
      titleText: 'Ubicación',
      hintText: 'Seleccione Item',
      value: myActivity,
      onSaved: (value) {
        setState(() {
          myActivity = value;
        });
      },
      onChanged: (value) {
        setState(() {
          myActivity = value;
        });
      },
      dataSource: [
        {
          "display": "Motupe",
          "value": "0",
        },
        {
          "display": "Olmos",
          "value": "1",
        },
      ],
      textField: 'display',
      valueField: 'value',
    );

/*
    final dropfundos = DropdownButton(
      items: data.map((item) {
        return new DropdownMenuItem(
          child: new Text(item['item_name']),
          value: item['id'].toString(),
        );
      }).toList(),
      onChanged: (newVal) {
        setState(() {
          _mySelection = newVal;
        });
      },
      value: _mySelection,
    );
*/

    return new Scaffold(
      appBar: AppBar(
        title: Text("Nuevo Consumo de Energía"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          //shrinkWrap: true,
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          children: <Widget>[
            dropubicacion,
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

/*
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
  */

}
