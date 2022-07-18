import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user/user_bloc.dart';
import '../models/usuario.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página 1'),
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<UsuarioBloc>(context).add(EliminarUsuario());
              },
              icon: Icon(Icons.exit_to_app_sharp))
        ],
      ),
      body: BlocBuilder<UsuarioBloc, UsuarioState>(
        builder: (_, state) {
          return (state.existeUsuario)
              ? InformacionUsuario(
                  usuario: state.usuario!,
                )
              : const Center(
                  child: Text('No existe el usuario'),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
        child: const Icon(Icons.arrow_back_ios_new),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;
  const InformacionUsuario({
    Key? key,
    required this.usuario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'General',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Divider(),
            ListTile(
              title: Text('Nombre ${usuario.nombre}'),
            ),
            ListTile(
              title: Text('Edad ${usuario.edad}'),
            ),
            Text(
              'Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Divider(),
            ...usuario.profesiones
                .map((e) => ListTile(
                      title: Text(e),
                    ))
                .toList()
          ],
        ),
      ),
    );
  }
}
