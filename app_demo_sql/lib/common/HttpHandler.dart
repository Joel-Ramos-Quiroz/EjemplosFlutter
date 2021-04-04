import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpHandler {
  static final _httHandler=new HttpHandler();
  final String _baseUrl = "http://192.168.0.6:80/RepositoriosWebGitHub/ingleby/ApiRestBDDemoFlutter/controladores/api_pa.controller.php?p=login";

  static HttpHandler get(){
    return _httHandler;
  }
  
   Future fetchLogin(Map body) async {
    return http.post(_baseUrl, body: body).then((http.Response response) {
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error al obtener datos");
      }
      return  json.decode(response.body.toString());
    });
  }



}
