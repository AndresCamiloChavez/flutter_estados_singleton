part of 'user_bloc.dart';

@immutable
abstract class UsuarioState {
  final bool existeUsuario;
  final Usuario? usuario;

  const UsuarioState({this.existeUsuario = false, this.usuario});
}

class UsuarioInitialState extends UsuarioState {
  const UsuarioInitialState() : super(existeUsuario: false, usuario: null);
}

class UsuarioSetState extends UsuarioState {
  final Usuario newUser;

  const UsuarioSetState(this.newUser): super(existeUsuario: true, usuario: newUser);
  
}
