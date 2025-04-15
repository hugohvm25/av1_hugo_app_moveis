import 'package:flutter/material.dart';

class PrimeiraTela extends StatefulWidget {
  const PrimeiraTela({super.key});

  @override
  State<PrimeiraTela> createState() => _PrimeiraTelaState();
}

class _PrimeiraTelaState extends State<PrimeiraTela> {
  List<String> itens = [];

  void adicionarItem() async {
    final novoItem = await Navigator.pushNamed(context, '/segunda');
    if (novoItem != null) {
      setState(() {
        itens.add(novoItem as String);
      });
    }
  }

  void editarItem(int index) async {
    final novoItem = await Navigator.pushNamed(
      context,
      '/formulario',
      arguments: itens[index],
    );
    if (novoItem != null) {
      setState(() {
        itens[index] = novoItem as String;
      });
    }
  }

  void removerItem(int index) {
    setState(() {
      itens.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Itens'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () => Navigator.pushNamed(context, '/terceira'),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: itens.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(itens[index]),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.orange),
                onPressed: () => editarItem(index),
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => removerItem(index),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: adicionarItem,
        child: const Icon(Icons.add),
      ),
    );
  }
}
