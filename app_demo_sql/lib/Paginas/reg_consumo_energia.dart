import 'package:app_demo_sql/common/HttpHandler.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RegConsumoEnergia extends StatefulWidget {
  static String tag = 'regconsumoenergia-page';
  @override
  _RegConsumoEnergiaPageState createState() => _RegConsumoEnergiaPageState();
}

class _RegConsumoEnergiaPageState extends State<RegConsumoEnergia> {
  HttpHandler _client = HttpHandler.get();
  List jsonResponse = List();

  String _codigo = "28";
  List<String> lista_ubicaciones = <String>['MOTUPE', 'OLMOS'];
  String dropdownValue_ubicaciones = 'MOTUPE';
  final bool isEnabled = true;

  Future pa_consultar_fundos() async {
    Map<String, String> queryParameters = {
      "ubicacion": dropdownValue_ubicaciones
    };
    var r = await _client.fetchConsultarFundos(queryParameters);
    //jsonResponse.map((job) => new ObjFundos.fromJson(job)).toList();
    //print(jsonResponse.toString());
    setState(() {
      jsonResponse = r;
    });
  }

  @override
  void initState() {
    super.initState();
    this.pa_consultar_fundos();
  }

  @override
  Widget build(BuildContext context) {
    final dropubicaciones = DropdownButton(
      isExpanded: true,
      itemHeight: 50.0,
      style: TextStyle(
          fontSize: 15.0, color: isEnabled ? Colors.black : Colors.grey[700]),
      items: lista_ubicaciones.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      hint: Text("Seleccione un Item"),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue_ubicaciones = newValue;
        });
      },
      value: dropdownValue_ubicaciones,
    );

    final dropfundos = DropdownButton(
      isExpanded: true,
      itemHeight: 50.0,
      style: TextStyle(
          fontSize: 15.0, color: isEnabled ? Colors.black : Colors.grey[700]),
      items: jsonResponse.map((item) {
        return DropdownMenuItem(
          child: Text(item['Descripcion'].toString()),
          value: item['CodFundo'].toString(),
        );
      }).toList(),
      hint: Text("Seleccione un Item"),
      onChanged: (newVal) {
        this.setState(() {
          _codigo = newVal;
        });
      },
      value: _codigo,
    );

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
            Text(
              "Seleccione una Ubicación :",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
            ),
            dropubicaciones,
            Text(
              "Seleccione un Fundo :",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
            ),
            dropfundos
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
