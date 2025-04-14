import 'package:flutter/material.dart';

class PrimeiraTela extends StatelessWidget {
  final List<String> nomes;

  PrimeiraTela(this.nomes, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tela Principal')),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text('Cadastro'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/segunda');
                  },
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  child: Text('Terceira Tela'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/terceira');
                  },
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: nomes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.person), // Ícone de pessoa
                    title: Text(nomes[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

