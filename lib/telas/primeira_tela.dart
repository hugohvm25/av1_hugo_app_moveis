import 'package:flutter/material.dart';
import '../rotas/app_rotas.dart';

class PrimeiraTela extends StatelessWidget {
  const PrimeiraTela({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tela Inicial')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Ir para a Segunda Tela'),
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.segundaTela);
          },
        ),
      ),
    );
  }
}

