import 'package:flutter/material.dart';
import 'package:singleton_estado/models/usuario.dart';
import 'package:singleton_estado/services/usuario_service.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder( 
          initialData: usuarioService.usuario,
          stream: usuarioService.usuarioStream,
          builder: (context, AsyncSnapshot<Usuario?> snapshot) {
            print('valor snap ${snapshot}');
            if ((snapshot.hasData)) {
              return Text('Pagina ${snapshot.data?.nombre}');
            } else {
              return const Text('Página 2');
            }
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                usuarioService.cargarUsuario(Usuario(
                    nombre: 'Andres Camilo',
                    edad: 21,
                    profesiones: ['Desarrollador']));
              },
              color: Colors.indigo,
              child: const Text(
                'Establecer usuario',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                usuarioService.cambiarEdad(22);
              },
              color: Colors.indigo,
              child: const Text(
                'Cambiar edad',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {},
              color: Colors.indigo,
              child: const Text(
                'Añaidr profesión',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
