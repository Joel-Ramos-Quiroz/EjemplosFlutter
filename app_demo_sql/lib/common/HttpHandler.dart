import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpHandler {
  static final _httHandler = new HttpHandler();
  final String _baseUrl =
      //"http://172.16.102.99:80/ApiRestBDKPI/controladores/";
      "http://192.168.0.9:80/ApiRestBDKPI/controladores/";

  static HttpHandler get() {
    return _httHandler;
  }


  Future fetchLogin(Map body) async {
    return await http
        .post(_baseUrl + "api_pa.controller.php?p=login", body: body)
        .then((http.Response response) {
      if (response.statusCode < 200 || response.statusCode > 400) {
        throw new Exception("Error al obtener datos");
      }
      return json.decode(response.body.toString());
    });
  }

  Future fetchGuardar_ConsumoEnergia(Map body) async {
    return await http
        .post(_baseUrl + "api_pa.controller.php?p=GuardarConsumoEnergia",
            body: body)
        .then((http.Response response) {
      if (response.statusCode < 200 || response.statusCode > 400) {
        throw new Exception("Error al obtener datos"+response.body.toString());
      }
      return json.decode(response.body.toString());
    });
  }

  Future fetchConsultarFundos(Map body) async {
    return await http
        .post(_baseUrl + "api_pa.controller.php?p=listar_fundos", body: body)
        .then((http.Response response) {
      if (response.statusCode < 200 || response.statusCode > 400) {
        throw new Exception("Error al obtener datos");
      }
      //return json.decode(response.body.toString());
      return json.decode(response.body);
    });
  }

  Future fetchConsultarSuministros(Map body) async {
    return await http
        .post(_baseUrl + "api_pa.controller.php?p=listar_suministros",
            body: body)
        .then((http.Response response) {
      if (response.statusCode < 200 || response.statusCode > 400) {
        throw new Exception("Error al obtener datos");
      }
      //return json.decode(response.body.toString());
      return json.decode(response.body);
    });
  }
}
