import 'package:flutter/material.dart';

class TerceiraTela extends StatelessWidget {
  const TerceiraTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Terceira Tela')),
      body: Center(
        child: ElevatedButton(
          child: Text('Voltar'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
