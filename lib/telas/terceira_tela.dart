import 'package:flutter/material.dart';

class TerceiraTela extends StatelessWidget {
  const TerceiraTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tela Extra')),
      body: const Center(
        child: Text(
          'Aqui é a tela extra. Você pode colocar qualquer conteúdo.',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
