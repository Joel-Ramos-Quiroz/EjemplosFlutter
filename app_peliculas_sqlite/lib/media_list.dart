import 'package:app_peliculas_sqlite/common/MediaProvider.dart';
import 'package:flutter/material.dart';
import 'package:app_peliculas_sqlite/model/Media.dart';
import 'package:app_peliculas_sqlite/media_list_item.dart';

class MediaList extends StatefulWidget {
  final MediaProvider provider;
  String category="popular";
  MediaList(this.provider,this.category);

  @override
  _MediaListState createState() => _MediaListState();
}

class _MediaListState extends State<MediaList> {
  List<Media> _media = new List<Media>();

  @override //Metodo
  void initState() {
    super.initState();
    loadMovies();
  }

  @override
  void didUpdateWidget(MediaList oldWidget){
    if(oldWidget.provider.runtimeType != widget.provider.runtimeType){
      _media=new List();
      loadMovies();
    }
    super.didUpdateWidget(oldWidget);
  }

  void loadMovies() async {
    var media = await widget.provider.fetchMedia(widget.category);
    setState(() {
      _media.addAll(media);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new ListView.builder(
      itemCount: _media.length,
      itemBuilder: (BuildContext context, int index) {
          //new Image.network(_media[index].getPosterUrl()),
          return new MediaListIgem(_media[index]);
      },
    ));
  }
}
