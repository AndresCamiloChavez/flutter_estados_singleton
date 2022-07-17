import 'package:flutter/material.dart';

import '../models/usuario.dart';

class UsuarioService with ChangeNotifier {
  Usuario? _usuario;
  Usuario? get usuario => _usuario;
  set usuario(Usuario? user) {
    _usuario = user;
    notifyListeners();
  }

  void cambiarEdad(int edad) {
    _usuario?.edad = edad;
    notifyListeners();
  }

  void removeUsurio() {
    _usuario = null;
    notifyListeners();
  }

  void agregarProfesion() {
    _usuario?.profesiones
        .add('Nueva profesion ${_usuario?.profesiones.length}');
    notifyListeners();
  }

  bool get existeUsuario => (_usuario != null) ? true : false;
}
