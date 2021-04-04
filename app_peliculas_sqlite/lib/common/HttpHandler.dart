import 'dart:async';
import 'dart:convert';
import 'package:app_peliculas_sqlite/common/Constants.dart';
import 'package:app_peliculas_sqlite/model/Media.dart';
import 'package:http/http.dart' as http;

class HttpHandler {
  static final _httHandler=new HttpHandler();
  final String _baseUrl = "api.themoviedb.org";
  final String _lenguaje = "es-ES";

  static HttpHandler get(){
    return _httHandler;
  }


//Metodo asincrono
  Future<dynamic> getJson(Uri uri) async {
    http.Response response = await http.get(uri);
    return json.decode(response.body);
  }

//Metodo asincrono
  Future<List<Media>> fetchMovies({String category: "populares"}) async {
    var uri=new Uri.https(_baseUrl,"3/movie/$category",{
      'api_key':API_KEY,
      'page':'1',
      'languaje':_lenguaje
    });

 return getJson(uri).then(((data)=>
    data["results"].map<Media>((item)=> new Media(item,MediaType.movie)).toList()
    ));
  }
  
  //Metodo asincrono
  Future<List<Media>> fetchShow({String category: "pupulares"}) async{
    var uri=new Uri.https(_baseUrl,"3/tv/$category",{
      'api_key':API_KEY,
      'page':'1',
      'languaje':_lenguaje
    });

    return getJson(uri).then(((data)=>
    data["results"].map<Media>((item)=> new Media(item,MediaType.show)).toList()
    ));
  }
}
