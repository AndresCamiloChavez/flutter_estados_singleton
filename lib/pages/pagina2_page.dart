import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pagina2Page extends StatelessWidget {
   
  const Pagina2Page({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    print('Valor arguments ${Get.arguments}');
    return  Scaffold(
      appBar: AppBar(title: Text('Página 2'),),
      body: Center(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
              },
              color: Colors.indigo,
              child: const Text('Establecer usuario', style: TextStyle(color: Colors.white),),
            ),
            MaterialButton(
              onPressed: () {
              },
              color: Colors.indigo,
              child: const Text('Cambiar edad', style: TextStyle(color: Colors.white),),
            ),
            MaterialButton(
              onPressed: () {
              },
              color: Colors.indigo,
              child: const Text('Añaidr profesión', style: TextStyle(color: Colors.white),),
            )
          ],
         ),
      ),
    );
  }
}