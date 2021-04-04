import 'package:app_peliculas_sqlite/common/HttpHandler.dart';
import 'package:app_peliculas_sqlite/model/Media.dart';
import 'dart:async';

abstract class MediaProvider {
  Future<List<Media>> fetchMedia(String category);
}

class MovieProvider extends MediaProvider {
  HttpHandler _client = HttpHandler.get();
  @override
  Future<List<Media>> fetchMedia(String category) {
     return _client.fetchMovies(category: category);
  }
}

class ShowProvider extends MediaProvider {
  HttpHandler _client = HttpHandler.get();
  @override
  Future<List<Media>> fetchMedia(String category) {
     return _client.fetchShow(category: category);
  }
}

enum MediaType{
  movie,show
}