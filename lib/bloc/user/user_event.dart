part of 'user_bloc.dart';

@immutable
abstract class UsuarioEvent {}

class ActivateUsuarioEvent extends UsuarioEvent {
  final Usuario usuario;

  ActivateUsuarioEvent(this.usuario);
}
