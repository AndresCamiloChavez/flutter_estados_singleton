import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:singleton_estado/models/usuario.dart';
import 'package:singleton_estado/services/usuario_service.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioS = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: (usuarioS.usuario != null)
            ? Text('Página ${usuarioS.usuario?.nombre}')
            : const Text('Página 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                final usuarioService =
                    Provider.of<UsuarioService>(context, listen: false);
                usuarioService.usuario = Usuario(
                    nombre: 'Andrés Camilo Chávez',
                    edad: 21,
                    profesiones: ['Desarrollador', 'FullStack Developer']);
              },
              color: Colors.indigo,
              child: const Text(
                'Establecer usuario',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                final usuarioService =
                    Provider.of<UsuarioService>(context, listen: false);
                usuarioService.cambiarEdad(22);
              },
              color: Colors.indigo,
              child: const Text(
                'Cambiar edad',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                final usuarioService =
                    Provider.of<UsuarioService>(context, listen: false);

                usuarioService.agregarProfesion();
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
