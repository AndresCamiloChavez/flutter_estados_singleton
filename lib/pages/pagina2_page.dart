import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:singleton_estado/controllers/usuario_controller.dart';
import 'package:singleton_estado/models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Valor arguments ${Get.arguments}');

    final usuarioCtrl = Get.find<UsuarioController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                usuarioCtrl.cargarUsuario(Usuario(
                    nombre: 'Andrés Camilo Chávez',
                    edad: 20,
                    profesiones: ['Developer']));

                Get.snackbar('Perfecto', 'Se ha creado el usuario', backgroundColor: Colors.white, boxShadows: [ const BoxShadow(color: Colors.black38, blurRadius: 10)]).show();
              },
              color: Colors.indigo,
              child: const Text(
                'Establecer usuario',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                usuarioCtrl.cambiarEdad(23);
              },
              color: Colors.indigo,
              child: const Text(
                'Cambiar edad',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                usuarioCtrl.agregarProfesion('Profesion ');
              },
              color: Colors.indigo,
              child: const Text(
                'Añaidr profesión',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
