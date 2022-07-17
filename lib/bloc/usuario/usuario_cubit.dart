import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:singleton_estado/models/usuario.dart';

part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super(UsuarioInitial());

  void seleccionarUsuario(Usuario user) {
    emit(UsuarioActivo(usuario: user));
  }

  void cambiarEdad(int edad) {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      Usuario newuser = currentState.usuario.copyWith(edad: edad);
      emit(UsuarioActivo(usuario: newuser));
    }
  }

  void addProfesion(String profesion) {
    if (state is UsuarioActivo) {
      final usuario = (state as UsuarioActivo).usuario.copyWith();
      usuario.profesiones.add(profesion);
      emit(UsuarioActivo(usuario: usuario));
    }
  }

  int? cantidadProfesiones() {
    if (state is UsuarioActivo) {
      return (state as UsuarioActivo).usuario.profesiones.length;
    }
  }

  void borrarUsuario() {
    emit(UsuarioInitial());
  }
}
