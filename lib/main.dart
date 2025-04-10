import 'package:flutter/material.dart';
import 'telas/primeira_tela.dart';
import 'telas/segunda_tela.dart';
import 'telas/terceira_tela.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App com Rotas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Define a primeira rota (inicial)
      initialRoute: '/',
      // Rotas nomeadas
      routes: {
        '/': (context) => PrimeiraTela(),
        '/segunda': (context) => SegundaTela(),
        '/terceira': (context) => TerceiraTela(),
      },
    );
  }
}
