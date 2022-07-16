import 'package:flutter/material.dart';

import '../models/usuario.dart';
import '../services/usuario_service.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página 1'),
      ),
      // body: (usuarioService.existeUsuario)
      //     ? InformacionUsuario(
      //         usuario: usuarioService.usuario!,
      //       )
      //     : const Center(child: Text('No hay un usuario')),
      body: StreamBuilder(
        stream: usuarioService.usuarioStream,
        builder: (context, AsyncSnapshot<Usuario?> snapshot) {
          return (snapshot.data != null)
              ? InformacionUsuario(
                  usuario: snapshot.data!,
                )
              : const Center(child: Text('No hay un usuario'));
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
          ListTile(
            title: Text('Profesión 1'),
          ),
          ListTile(
            title: Text('Profesión 2'),
          ),
        ],
      ),
    );
  }
}
