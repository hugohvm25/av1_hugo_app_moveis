import 'package:flutter/material.dart';
import 'telas/primeira_tela.dart';  // Garante que PrimeiraTela está corretamente importada
import 'telas/segunda_tela.dart';  // Garante que SegundaTela está corretamente importada
import 'telas/terceira_tela.dart'; // Garante que TerceiraTela está corretamente importada

void main() => runApp(const MeuApp());

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Opcional, remove a faixa "DEBUG"
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
