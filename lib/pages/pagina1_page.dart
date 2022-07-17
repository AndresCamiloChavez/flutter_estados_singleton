import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:singleton_estado/models/usuario.dart';
import 'package:singleton_estado/services/usuario_service.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Página 1'),
        actions: [
          IconButton(
              onPressed: () {
                final usuarioService =
                    Provider.of<UsuarioService>(context, listen: false);
                usuarioService.removeUsurio();
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: (usuarioService.existeUsuario)
          ? InformacionUsuario(
              usuario: usuarioService.usuario!,
            )
          : const Center(child: Text('No existe el usuario')),
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
          const Text(
            'Profesiones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),

          ...usuario.profesiones.map((e) => ListTile(title: Text(e),)).toList()

          
        ],
      ),
    );
  }
}
