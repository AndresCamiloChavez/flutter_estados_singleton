import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/usuario.dart';
import 'package:meta/meta.dart';
part 'user_event.dart';
part 'user_state.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  UsuarioBloc() : super(const UsuarioInitialState()) {
    on<ActivateUsuarioEvent>((event, emit) {
      emit(UsuarioSetState(event.usuario));
    });

    on<CambiarEdadEvent>((event, emit) {
      if (!state.existeUsuario) return;

      emit(UsuarioSetState(state.usuario!.copyWith(edad: event.edad)));
    });

    on<AgregarProfesionEvent>((event, emit) {
      if (!state.existeUsuario) return;
      final newUsuario = state.usuario!.copyWith();
      newUsuario.profesiones.add(
          event.profesion + (state.usuario!.profesiones.length + 1).toString());
      emit(UsuarioSetState(newUsuario));
    });
    on<EliminarUsuario>((event, emit) {
      emit(UsuarioInitialState());
    });
  }
}
