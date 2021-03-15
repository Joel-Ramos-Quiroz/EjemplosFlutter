import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';

class DBProvider {
  Database db;

//Constructor
  DBProvider() {
    init();
  }

//Metodo Init
  void init() async {
    //Directorio principal donde se almacenara la BD
    //Las llamadas a nuestro directorio tiene que ser asincrono
    Directory documentDirectory = await getApplicationDocumentsDirectory();

//Colocamos la ruta final donde estara nuestra BD (Concatenando la ruta con el nombre de la BD)
    final path = join(documentDirectory.path, "Casts4.db");

    db = await openDatabase(path, //accedemos a la base de datos
        version: 1, //para realizar el seguimiento de las versiones de la BD
        onCreate: (Database newDb, int version) {
      newDb.execute("""
    CREATE TABLE Casts
    (
      id INTEGER PRIMARY KEY,
      name TEXT,
      profile_path TEXT,
      mediaId INTEGER
    )
  """);
    });
  }

//metodo para realizar la consulta a la BD
//le enviamos por parametro el mediaId para consultar la lista de cast
  fetchCasts(int mediaId) async {
    var maps=await db.query("Casts", columns: null, where: "mediaId =?", whereArgs: [mediaId]);

    if (maps.length > 0) {}
    return null;
  }
}
