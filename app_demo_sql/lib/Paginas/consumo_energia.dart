import 'package:app_demo_sql/Paginas/mod_consumo_energia/reg_consumo_energia.dart';
import 'package:app_demo_sql/common/colors.dart';
import 'package:flutter/material.dart';

class ConsumoEnergia extends StatefulWidget {
  static String tag = 'consumoenergia-page';
  @override
  _ConsumoEnergiaState createState() => _ConsumoEnergiaState();
}

class _ConsumoEnergiaState extends State<ConsumoEnergia> {
  String _ubicacion;
  bool isEnabled = false;
  DateTime pickedDate;

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
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

  Widget build(BuildContext context) {
    final dropubicaciones = DropdownButton(
      isExpanded: true,
      itemHeight: 50.0,
      hint: Text("Seleccione un Item"),
      style: TextStyle(
          fontSize: 15.0, color: isEnabled ? Colors.black : Colors.grey[700]),
      value: _ubicacion,
      items: <String>['TODOS', 'MOTUPE', 'OLMOS']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String newValue) {
        setState(() {
          _ubicacion = newValue;
        });
      },
    );

    Widget _label(String texto) {
      return Text(
        texto,
        style: TextStyle(color: darkText, fontWeight: FontWeight.w500),
      );
    }

    Widget _botonbuscar() {
      return Container(
        constraints: BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
        margin: EdgeInsets.all(10),
        child: RaisedButton(
          onPressed: () {
//pa_Guardar();
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
                    'Buscar',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.search,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
    Widget _botonnuevo() {
      return Container(
        constraints: BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
        margin: EdgeInsets.all(10),
        child: RaisedButton(
          onPressed: () {
Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RegConsumoEnergia()));
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
                    'Nuevo',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.add,
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
        title: Text("Consumos de Energía"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          //shrinkWrap: true,
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          children: <Widget>[
            SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _label("Fecha Inicio :"),
                        ListTile(
                          title: Text(
                              "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}"),
                          trailing: Icon(Icons.keyboard_arrow_down),
                          onTap: _pickDate,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _label("Fecha Fin :"),
                        ListTile(
                          title: Text(
                              "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}"),
                          trailing: Icon(Icons.keyboard_arrow_down),
                          onTap: _pickDate,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                         _label("Ubicación :"),
            dropubicaciones,
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _botonbuscar(),
                        _botonnuevo(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            //SizedBox(height: 10.0),
            
          ],
        ),
      ),
    );
  }
}
