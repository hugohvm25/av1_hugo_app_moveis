import 'package:flutter/material.dart';

class SegundaTela extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(); // Chave para acessar o estado do Form
  final _nomecontrolador = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Conecta o formulário à chave
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nomecontrolador,
                decoration: InputDecoration(labelText: 'Digite aqui'),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Por favor, insira seu nome';
                  } 
                  return null;
                },
              ),

              SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Se os campos estiverem válidos
                      final texto = _nomecontrolador.text;
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text('Dados Enviados'),
                          content: Text('Texto: $texto'),
                          actions: [
                            TextButton(
                              child: Text('OK'),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: Text('Enviar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
