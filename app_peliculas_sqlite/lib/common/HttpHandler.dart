import 'dart:async';
import 'dart:convert';
import 'package:app_peliculas_sqlite/common/Constants.dart';
import 'package:app_peliculas_sqlite/model/Media.dart';
import 'package:http/http.dart' as http;

class HttpHandler {
  final String _baseUrl = "api.themoviedb.org";
  final String _lenguaje = "es-ES";

  Future<dynamic> getJson(Uri uri) async {
    http.Response response = await http.get(uri);
    return json.decode(response.body);
  }

  Future<List<Media>> fetchMovies() {
    var uri=new Uri.https(_baseUrl,"3/movie/popular",{
      'api_key':API_KEY,
      'page':'1',
      'languaje':_lenguaje
    });

    return getJson(uri).then(((data)=>
    data["results"].map<Media>((item)=> new Media(item)).toList()
    ));
  }
}
