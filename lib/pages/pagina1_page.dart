import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:singleton_estado/controllers/usuario_controller.dart';

import '../models/usuario.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioCtrl = Get.put(UsuarioController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Página 1'),
      ),
      body: Obx(() => usuarioCtrl.existeUsuario.value
          ?  InformacionUsuario(usuario: usuarioCtrl.usuario.value!,)
          : const NoInfo()),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => Get.to(const Pagina2Page(),transition: Transition.zoom),
        onPressed: () => Get.toNamed('/pagina2',
            arguments: {'nombre': 'Andres', 'edad': '20'}),
        child: const Icon(Icons.arrow_back_ios_new),
      ),
    );
  }
}

class NoInfo extends StatelessWidget {
  const NoInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No hay usuario seleccionado'),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;
  const InformacionUsuario({
    Key? key, required this.usuario,
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
          ...usuario.profesiones.map((e) => ListTile(title: Text(e),)).toList()
        ],
      ),
    );
  }
}
