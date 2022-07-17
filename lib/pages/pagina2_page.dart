import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton_estado/bloc/usuario/usuario_cubit.dart';
import 'package:singleton_estado/models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UsuarioCubit>();
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
                context.read<UsuarioCubit>().seleccionarUsuario(Usuario(
                    nombre: 'Andres Camilo Chavez',
                    edad: 21,
                    profesiones: ['Developer']));
              },
              color: Colors.indigo,
              child: const Text(
                'Establecer usuario',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                context.read<UsuarioCubit>().cambiarEdad(22);
              },
              color: Colors.indigo,
              child: const Text(
                'Cambiar edad',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                context.read<UsuarioCubit>().addProfesion(
                    'Nueva profesión ${usuarioCubit.cantidadProfesiones() ?? 0}');
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
