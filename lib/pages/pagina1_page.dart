import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:singleton_estado/pages/pagina2_page.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 1'),
      ),
      body: const InformacionUsuario(),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => Get.to(const Pagina2Page(),transition: Transition.zoom),
        onPressed: () => Get.toNamed('/pagina2', arguments: {'nombre': 'Andres', 'edad': '20'}),
        child: const Icon(Icons.arrow_back_ios_new),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  const InformacionUsuario({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ListTile(
            title: Text('Nombre'),
          ),
          ListTile(
            title: Text('Edad'),
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
