class ValidationMixins {
  String validateEmail(String value) {
    if (!value.contains('@')) {
      return "Email Invalido";
    } else {
      return null;
    }
  }

  String validatePaswword(String value) {
    if (value.length < 6) {
      return "Contraseña Invalida";
    } else {
      return null;
    }
  }
}
