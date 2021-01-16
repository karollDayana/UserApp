String validarEmail(String email) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(pattern);

  if (regExp.hasMatch(email)) {
    return null;
  } else {
    return 'Email invalido';
  }
}

String validarPassword(int password) {
  if (password.toString().length >= 6) {
    return null;
  } else {
    return 'Más de 6 carácteres por favor';
  }
}
