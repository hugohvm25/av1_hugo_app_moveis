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

    var texto = ModalRoute.of(context)!.settings.arguments;

    if (texto is String) {
      _controlador.text = texto;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Adicionar Item', style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.indigo,
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
      ),
      backgroundColor: Color.fromRGBO(37, 37, 37, 1.0),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _controlador,
              decoration: const InputDecoration(
                labelText: 'Digite aqui', labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(
                color: Colors.white, // Cor do texto digitado
                fontSize: 18,        // Tamanho do texto (opcional)
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _controlador.text);
              },
              child: const Text('Adicionar'),
            )
          ],
        ),
      ),
    );
  }
}

