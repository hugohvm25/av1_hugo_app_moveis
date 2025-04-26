import 'package:flutter/material.dart';

class TerceiraTela extends StatelessWidget {
  const TerceiraTela({super.key});

  @override
  Widget build(BuildContext context) {
    final argumentos = ModalRoute.of(context)!.settings.arguments as Map;
    final List<String> itensExcluidos = List<String>.from(argumentos['itensExcluidos']);
    final Function(String) restaurarItem = argumentos['restaurarItem'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Itens Excluídos', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.indigo,
        iconTheme: const IconThemeData(
        color: Colors.white
        ),
      ),

      backgroundColor: Color.fromRGBO(37, 37, 37, 1.0),

      body: itensExcluidos.isEmpty
          ? const Center(child: Text('Nenhum item excluído.', style: TextStyle(color: Colors.white)))
          : ListView.builder(
        itemCount: itensExcluidos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
                itensExcluidos[index],
                style: TextStyle(
                color: Colors.white, // Cor do texto digitado
                fontSize: 18,        // Tamanho do texto (opcional)
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.restore, color: Colors.green),
              onPressed: () {
                restaurarItem(itensExcluidos[index]);
                Navigator.pop(context); // volta para a PrimeiraTela
              },
            ),
          );
        },
      ),
    );
  }
}
