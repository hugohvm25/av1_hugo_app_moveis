import 'package:flutter/material.dart';

class SegundaTela extends StatefulWidget {
  const SegundaTela({super.key});

  @override
  State<SegundaTela> createState() => _SegundaTelaState();
}

class _SegundaTelaState extends State<SegundaTela> {
  final TextEditingController _controlador = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final texto = ModalRoute.of(context)!.settings.arguments;
    if (texto != null && texto is String) {
      _controlador.text = texto;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Item')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _controlador,
              decoration: const InputDecoration(
                labelText: 'Digite algo',
                border: OutlineInputBorder(), // 👉 contorno aplicado aqui
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _controlador.text);
              },
              child: const Text('Salvar'),
            )
          ],
        ),
      ),
    );
  }
}

