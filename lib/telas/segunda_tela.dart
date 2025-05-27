// import 'package:flutter/material.dart';
//
// class SegundaTela extends StatefulWidget {
//   const SegundaTela({super.key});
//
//   @override
//   State<SegundaTela> createState() => _SegundaTelaState();
// }
//
// class _SegundaTelaState extends State<SegundaTela> {
//   final TextEditingController _controlador = TextEditingController();
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//
//     var texto = ModalRoute.of(context)!.settings.arguments;
//
//     if (texto is String) {
//       _controlador.text = texto;
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: const Text('Adicionar Item', style: TextStyle(color: Colors.white)),
//       backgroundColor: Colors.indigo,
//         iconTheme: const IconThemeData(
//             color: Colors.white
//         ),
//       ),
//       backgroundColor: Color.fromRGBO(37, 37, 37, 1.0),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             TextField(
//               controller: _controlador,
//               decoration: const InputDecoration(
//                 labelText: 'Digite aqui', labelStyle: TextStyle(color: Colors.white),
//                 border: OutlineInputBorder(),
//               ),
//               style: TextStyle(
//                 color: Colors.white, // Cor do texto digitado
//                 fontSize: 18,        // Tamanho do texto (opcional)
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context, _controlador.text);
//               },
//               child: const Text('Adicionar'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//




import 'package:flutter/material.dart';

class SegundaTela extends StatefulWidget {
  const SegundaTela({super.key});

  @override
  State<SegundaTela> createState() => _SegundaTelaState();
}

class _SegundaTelaState extends State<SegundaTela> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final argumento = ModalRoute.of(context)?.settings.arguments;
    if (argumento != null && argumento is String) {
      _controller.text = argumento;
    }
  }

  void salvar() {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(context, _controller.text.trim());
    } else {
      // Mostra uma SnackBar se o campo estiver vazio
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('O nome do item não pode estar vazio.'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  void cancelar() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar / Editar Item', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.indigo,
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
      ),

      backgroundColor: const Color.fromRGBO(37, 37, 37, 1.0),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _controller,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Nome do item',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.indigo),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Informe o nome do item';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: salvar,
                    icon: const Icon(Icons.save),
                    label: const Text('Salvar'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  ),
                  OutlinedButton.icon(
                    onPressed: cancelar,
                    icon: const Icon(Icons.cancel, color: Colors.white),
                    label: const Text('Cancelar', style: TextStyle(color: Colors.white)),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
