import 'package:flutter/material.dart';
import 'telas/primeira_tela.dart';
import 'telas/segunda_tela.dart';
import 'telas/terceira_tela.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  final List<String> nomes = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AV1_Hugo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: (cfg) {
        switch (cfg.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => PrimeiraTela(nomes));
          case '/segunda':
            return MaterialPageRoute(builder: (_) => SegundaTela(nomes));
          case '/terceira':
            return MaterialPageRoute(builder: (_) => const TerceiraTela());
          default:
            return null;
        }
      },
    );
  }
}
