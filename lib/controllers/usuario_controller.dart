import 'package:get/get.dart';
import '../models/usuario.dart';

class UsuarioController extends GetxController {
  RxBool existeUsuario = false.obs; // crea e inicializa el observable
  Rx<Usuario?> usuario = Rx(null);

  cargarUsuario(Usuario pUsuario) {
    existeUsuario.value = true;
    usuario.value = pUsuario;
  }

  void cambiarEdad(int edad) {
    usuario.update((val) {
      val?.edad = edad;
    });
  }
  void agregarProfesion(String profesion) {
    usuario.update((val) {
      val?.profesiones  = [...val.profesiones, (profesion + val.profesiones.length.toString())];
    });
  }
}
