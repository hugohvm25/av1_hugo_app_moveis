import 'package:flutter/material.dart';

class SegundaTela extends StatelessWidget {
  const SegundaTela({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo de Entrada de Dados',
      home: const PaginaCaixasEdicao(),
    );
  }
}

class PaginaCaixasEdicao extends StatefulWidget {
  const PaginaCaixasEdicao({Key? key}) : super(key: key);
  @override
  State<PaginaCaixasEdicao> createState() => _PaginaCaixasEdicaoState();
}

class _PaginaCaixasEdicaoState extends State<PaginaCaixasEdicao> {
  TextEditingController _controladorNome = TextEditingController();
  TextEditingController _controladorEmail = TextEditingController();
  TextEditingController _controladorTelefone = TextEditingController();
  TextEditingController _controladorCPF = TextEditingController();

  TextField criarCaixaEdicao({
    required TextEditingController controlador,
    required String rotulo,
    String dica = '',
  }) {
    return TextField(
      controller: controlador,
      decoration: InputDecoration(
        labelText: rotulo,
        border: OutlineInputBorder(),
        hintText: dica,
      ),
    );
  }

  @override
  void dispose() {
    _controladorNome.dispose();
    _controladorEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Entrada de Dados')),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            criarCaixaEdicao(
              controlador: _controladorNome,
              rotulo: 'Nome',
              dica: 'Digite o nome',
            ),
            SizedBox(height: 10),

            criarCaixaEdicao(
              controlador: _controladorEmail,
              rotulo: 'Email',
              dica: 'Digite o email',
            ),
            SizedBox(height: 10),

            criarCaixaEdicao(
              controlador: _controladorTelefone,
              rotulo: 'Telefone',
              dica: 'Digite o telefone',
            ),
            SizedBox(height: 10),

            criarCaixaEdicao(
              controlador: _controladorCPF,
              rotulo: 'CPF',
              dica: 'Digite o CPF',
            ),
            SizedBox(height: 10),

            Text('Nome: ' + _controladorNome.text),
            Text('Email: ' + _controladorEmail.text),
            Text('Telefone: ' + _controladorTelefone.text),
            Text('CPF: ' + _controladorCPF.text),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        tooltip: 'Confirmar',
        child: const Icon(Icons.add),
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Segunda Tela')),
//       body: Center(
//         child: ElevatedButton(
//           child: const Text('Voltar'),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//     );
//   }
// }
