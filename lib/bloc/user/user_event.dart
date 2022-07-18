part of 'user_bloc.dart';

@immutable
abstract class UsuarioEvent {}

class ActivateUsuarioEvent extends UsuarioEvent {
  final Usuario usuario;

  ActivateUsuarioEvent(this.usuario);
}

class CambiarEdadEvent extends UsuarioEvent {
  final int edad;
  CambiarEdadEvent(this.edad);
}

class AgregarProfesionEvent extends UsuarioEvent {
  final String profesion;
  AgregarProfesionEvent(this.profesion);
}
class EliminarUsuario extends UsuarioEvent {}
