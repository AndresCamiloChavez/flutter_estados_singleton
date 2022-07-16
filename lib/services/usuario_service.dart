import 'dart:async';

import '../models/usuario.dart';

class _UsuarioService {
  Usuario? _usuario;
  Usuario? get usuario => _usuario;
  bool get existeUsuario => (_usuario != null) ? true : false;

  StreamController<Usuario?> usuarioStreamController =
      StreamController<Usuario?>();

  Stream<Usuario?> get usuarioStream => usuarioStreamController.stream;

  void cargarUsuario(Usuario user) {
    _usuario = user;
    usuarioStreamController.add(user);
  }

  void cambiarEdad(int edad) {
    _usuario?.edad = edad;
    usuarioStreamController.add(_usuario);

  }
}

final usuarioService = _UsuarioService();
