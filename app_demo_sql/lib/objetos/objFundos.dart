class ObjFundos {
  final String codfundo;
  final String descripcion;

  ObjFundos({this.codfundo, this.descripcion});

  factory ObjFundos.fromJson(Map<String, dynamic> json) {
    return ObjFundos(
      codfundo: json['codfundo'],
      descripcion: json['descripcion'],
    );
  }
}
