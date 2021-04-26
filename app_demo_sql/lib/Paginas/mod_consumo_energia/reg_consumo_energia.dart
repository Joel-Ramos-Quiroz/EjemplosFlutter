import 'package:app_demo_sql/common/HttpHandler.dart';
import 'package:app_demo_sql/common/colors.dart';
import 'package:app_demo_sql/common/variables_globales.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RegConsumoEnergia extends StatefulWidget {
  static String tag = 'regconsumoenergia-page';
  @override
  _RegConsumoEnergiaPageState createState() => _RegConsumoEnergiaPageState();
}

class _RegConsumoEnergiaPageState extends State<RegConsumoEnergia> {
  List jsonFundos;
  List jsonSuministros;

  String _codfundo = "MOTUPE";
  String _codsuministro;
  String _ubicacion;
  bool isEnabled = false;
  DateTime pickedDate;

  final _numrecibo = new TextEditingController(text: "");
  final _kw = new TextEditingController(text: "");
  final _importe = new TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    pa_consultar_fundos();
    pickedDate = DateTime.now();
  }

  Future<String> pa_consultar_fundos() async {
    HttpHandler _client = HttpHandler.get();
    Map<String, String> queryParameters = {
      "ubicacion": _ubicacion.isNotEmpty ? _ubicacion : "",
    };
    var r = await _client.fetchConsultarFundos(queryParameters);
    jsonSuministros = null;
    setState(() {
      _codfundo = r[0]["CodFundo"].toString();
      jsonFundos = r;
    });
    pa_consultar_suministros();
  }

  Future<String> pa_consultar_suministros() async {
    HttpHandler _client = HttpHandler.get();
    Map<String, String> queryParameters = {
      "codfundo": _codfundo.isNotEmpty ? _codfundo : "",
    };
    var r = await _client.fetchConsultarSuministros(queryParameters);
    setState(() {
      _codsuministro = r[0]["CodSum"].toString();
      jsonSuministros = r;
    });
  }

  _pickDate() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: pickedDate,
    );
    if (date != null)
      setState(() {
        pickedDate = date;
      });
  }

  @override
  Widget build(BuildContext context) {
    final dropubicaciones = DropdownButton(
      isExpanded: true,
      itemHeight: 50.0,
      hint: Text("Seleccione un Item"),
      style: TextStyle(
          fontSize: 15.0, color: isEnabled ? Colors.black : Colors.grey[700]),
      value: _ubicacion,
      items: <String>['MOTUPE', 'OLMOS']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String newValue) {
        setState(() {
          _ubicacion = newValue;
          pa_consultar_fundos();
          print(_ubicacion);
        });
      },
    );
    final dropfundos = DropdownButton<String>(
      isExpanded: true,
      itemHeight: 50.0,
      style: TextStyle(
          fontSize: 15.0, color: isEnabled ? Colors.black : Colors.grey[700]),
      value: _codfundo,
      onChanged: (String newVal) {
        setState(() {
          _codfundo = newVal;
          pa_consultar_suministros();
          print(_codfundo);
        });
      },
      items: jsonFundos?.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['Descripcion']),
              value: item['CodFundo'].toString(),
            );
          })?.toList() ??
          [],
      hint: Text("Seleccione un Item"),
    );
    final dropsuministros = DropdownButton<String>(
      isExpanded: true,
      itemHeight: 50.0,
      style: TextStyle(
          fontSize: 15.0, color: isEnabled ? Colors.black : Colors.grey[700]),
      value: _codsuministro,
      onChanged: (String newVal) {
        setState(() {
          _codsuministro = newVal;
          print(_codsuministro);
        });
      },
      items: jsonSuministros?.map((item) {
            return DropdownMenuItem(
              child: Text(item['descripcion'].toString()),
              value: item['CodSum'].toString(),
            );
          })?.toList() ??
          [],
      hint: Text("Seleccione un Suministro"),
    );

    final _numreciboInput = TextFormField(
      controller: _numrecibo,
      decoration: const InputDecoration(
        hintText: 'xxxxx-xxxxxx',
        //labelText: 'N° Recibo',
      ),
    );
    final _kwInput = TextFormField(
      controller: _kw,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        hintText: '0000',

        //labelText: 'N° Recibo',
      ),
    );
    final _importeInput = TextFormField(
      controller: _importe,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        hintText: '0000',
        //labelText: 'N° Recibo',
      ),
    );

    Widget _label(String texto) {
      return Text(
        texto,
        style: TextStyle(color: darkText, fontWeight: FontWeight.w500),
      );
    }

    Widget _botonguardar() {
      return Container(
        constraints: BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
        margin: EdgeInsets.all(10),
        child: RaisedButton(
          onPressed: () {
            pa_Guardar();
          },
          color: Theme.of(context).accentColor,
          child: Padding(
            padding: EdgeInsets.all(0),
            child: Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Guardar',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Nuevo Consumo de Energía"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          //shrinkWrap: true,
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          children: <Widget>[
            SizedBox(height: 24.0),
            _label("Ubicación :"),
            dropubicaciones,
            SizedBox(height: 24.0),
            _label("Fundo :"),
            dropfundos,
            SizedBox(height: 24.0),
            _label("Suministro :"),
            dropsuministros,
            SizedBox(height: 24.0),
            _label("N° Recibo :"),
            _numreciboInput,
            SizedBox(height: 24.0),
            _label("Consumo en KW :"),
            _kwInput,
            SizedBox(height: 24.0),
            _label("Importe Total S/ :"),
            _importeInput,
            SizedBox(height: 24.0),
            _label("Fecha :"),
            ListTile(
              title: Text(
                  "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}"),
              trailing: Icon(Icons.keyboard_arrow_down),
              onTap: _pickDate,
            ),
            SizedBox(height: 24.0),
            _botonguardar(),
          ],
        ),
      ),
    );
  }

  Future pa_Guardar() async {
    if (_codfundo == null ||
        _codsuministro == null ||
        _ubicacion == null ||
        _numrecibo.text.length == 0 ||
        _kw.text.length == 0 ||
        _importe.text.length == 0) {
      _showAlert("Complete todos los Campos", 1);
    } else {
      Map<String, String> queryParameters = {
        "operacion": "0",
        "codigo": "0",
        "codsum": _codsuministro,
        "codubi": _ubicacion == "MOTUPE" ? "1" : "2",
        "dni": vg_dniuser,
        "num_recibo": _numrecibo.text,
        "importe": _importe.text,
        "kq": _kw.text,
        "fecha": "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}",
        "estado": "P",
      };
      HttpHandler _client = HttpHandler.get();
      List data;
      data = await _client.fetchGuardar_ConsumoEnergia(queryParameters);

      if (data[1].toString() == "0") {
        _showAlert(data[0].toString(), 0);
        _numrecibo.text = "";
        _importe.text = "";
        _kw.text = "";
        //Navigator.pop(context);
      } else {
        _showAlert(data[0].toString(), 1);
      }
    }
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
}
