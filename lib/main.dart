import 'package:flutter/material.dart';
import 'package:refazeratvsoma/principal.dart';
import 'imc.dart';
import 'usuario.dart';
import 'produto.dart';
import 'contador.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { // Classe sem estado
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rotas nomeadas',
      initialRoute: '/',
      routes: { '/': (context) => const Principal(),
        '/imc': (context) => const Imc(),      // Definindo as rotas
        '/contador': (context) => const Contador(),
        '/usuario': (context) => const Usuario(),
        '/produto': (context) => const Produto(),
      },
    );
  }
}