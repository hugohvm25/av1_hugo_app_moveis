import 'package:flutter/material.dart';
import 'rotas/app_rotas.dart';
import 'telas/primeira_tela.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo de Navegação',
      initialRoute: AppRoutes.primeiraTela,
      routes: AppRoutes.routes,
    );
  }
}
