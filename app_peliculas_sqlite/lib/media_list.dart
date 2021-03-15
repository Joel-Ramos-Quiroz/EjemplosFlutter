import 'package:flutter/material.dart';
import 'package:app_peliculas_sqlite/common/HttpHandler.dart';
import 'package:app_peliculas_sqlite/model/Media.dart';

class MediaList extends StatefulWidget {
  @override
  _MediaListState createState() => _MediaListState();
}

class _MediaListState extends State<MediaList> {
  List<Media> _media = new List<Media>();
  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  void loadMovies() async {
    var movies = await HttpHandler().fetchMovies();
    setState(() {
      _media.addAll(movies);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new ListView.builder(
      itemCount: _media.length,
      itemBuilder: (BuildContext context, int index) {
        return new Column(children: <Widget>[
          new Image.network(_media[index].getPosterUrl()),
          new Text(_media[index].getTitulo()),
          new Padding(
            // Esta seccion sera para los botones de acciones
            padding: new EdgeInsets.all(7.0), // Un padding general entre cada elemento
            child: new Row(
              // mainAxisAlignment permite alinear el contenido dentro de Row
              // en este caso le digo que use spaceBetwee, esto hara que
              // cualquier espacio horizontal que no se haya asignado dentro de children
              // se divida de manera uniforme y se coloca entre los elementos secundarios.
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Agregamos los botones de tipo Flat, un icono, un texto y un evento
                new FlatButton.icon(
                  // Un icono puede recibir muchos atributos, aqui solo usaremos icono, tamaño y color
                  icon: const Icon(Icons.favorite, size: 18.0, color: Colors.redAccent),
                  label: const Text('Like'),
                  // Esto mostrara 'Me encanta' por la terminal
                  onPressed: () {
                    print('Me encanta');
                  },
                ),
                new FlatButton.icon(
                  icon: const Icon(Icons.comment, size: 18.0, color: Colors.brown),
                  label: const Text('Comment'),
                  onPressed: () {
                    print('Comenta algo');
                  },
                ),
                new FlatButton.icon(
                  icon: const Icon(Icons.share, size: 18.0, color: Colors.blueAccent),
                  label: const Text('Share'),
                  onPressed: () {
                    print('Compartelo');
                  },
                )
              ]
            )
          )
        ]);
      },
    ));
  }
}
