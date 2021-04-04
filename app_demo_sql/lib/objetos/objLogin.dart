class ObjLogin {
   String usuario;
   String clave;
   String msj;

String getUsuario() => this.usuario;
 set setUsuario( usuario) => this.usuario = usuario;

String getClave() => this.clave;
 set setClave( clave) => this.clave = clave;

 String getMsj() => this.msj;
 set setMsj( msj) => this.msj = msj;



 ObjLogin({this.usuario, this.clave,this.msj});

  factory ObjLogin.fromJson(Map json) {
    return ObjLogin(
        usuario: json['usuario'], clave: json['clave']);
  }

  Map toMap() {
    var map = new Map();
    map["usuario"] = usuario;
    map["clave"] = clave;

    return map;
  }
 
}

