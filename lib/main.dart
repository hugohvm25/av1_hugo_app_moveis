import 'package:flutter/material.dart';
import 'telas/primeira_tela.dart';
import 'telas/segunda_tela.dart';
import 'telas/terceira_tela.dart';

void main() => runApp(const MeuApp());

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const PrimeiraTela(),
        '/segunda': (context) => const SegundaTela(),
        '/terceira': (context) => const TerceiraTela(),
      },
    );
  }
}
