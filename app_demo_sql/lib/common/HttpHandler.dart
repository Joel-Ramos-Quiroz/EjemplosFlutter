import 'dart:async';
import 'dart:convert';
import 'package:app_demo_sql/objetos/objFundos.dart';
import 'package:http/http.dart' as http;

class HttpHandler {
  static final _httHandler = new HttpHandler();
  final String _baseUrl = "http://172.16.10.54:80/ApiRestBDKPI/controladores/";

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
}
