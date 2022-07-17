import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/usuario.dart';

part 'user_event.dart';
part 'user_state.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  UsuarioBloc() : super(const UsuarioInitialState()) {
    on<ActivateUsuarioEvent>((event, emit) {
      emit(UsuarioSetState(event.usuario));
    });
  }
}
