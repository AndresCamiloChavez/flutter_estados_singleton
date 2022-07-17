import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton_estado/bloc/usuario/usuario_cubit.dart';
import 'package:singleton_estado/pages/pagina1_page.dart';
import 'package:singleton_estado/pages/pagina2_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UsuarioCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,  
        title: 'Material App',
        initialRoute: 'pagina1',
        routes: {
          'pagina1': (_) => const Pagina1Page(),
          'pagina2': (_) => const Pagina2Page()
        },
      ),
    );
  }
}