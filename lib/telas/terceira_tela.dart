// import 'package:flutter/material.dart';
//
// class TerceiraTela extends StatelessWidget {
//   const TerceiraTela({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final argumentos = ModalRoute.of(context)!.settings.arguments as Map;
//     final List<String> itensExcluidos = List<String>.from(argumentos['itensExcluidos']);
//     final Function(String) restaurarItem = argumentos['restaurarItem'];
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Itens Excluídos', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.indigo,
//         iconTheme: const IconThemeData(
//         color: Colors.white
//         ),
//       ),
//
//       backgroundColor: Color.fromRGBO(37, 37, 37, 1.0),
//
//       body: itensExcluidos.isEmpty
//           ? const Center(child: Text('Nenhum item excluído.', style: TextStyle(color: Colors.white)))
//           : ListView.builder(
//         itemCount: itensExcluidos.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(
//                 itensExcluidos[index],
//                 style: TextStyle(
//                 color: Colors.white, // Cor do texto digitado
//                 fontSize: 18,        // Tamanho do texto (opcional)
//               ),
//             ),
//             trailing: IconButton(
//               icon: const Icon(Icons.restore, color: Colors.green),
//               onPressed: () {
//                 restaurarItem(itensExcluidos[index]);
//                 Navigator.pop(context); // volta para a PrimeiraTela
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'banco_dados.dart';

class TerceiraTela extends StatefulWidget {
  const TerceiraTela({super.key});

  @override
  State<TerceiraTela> createState() => _TerceiraTelaState();
}

class _TerceiraTelaState extends State<TerceiraTela> {
  List<Map<String, dynamic>> itensExcluidos = [];
  late BancoDados banco;
  late VoidCallback carregarItensAtivos;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final argumentos = ModalRoute.of(context)?.settings.arguments as Map?;
    if (argumentos != null) {
      banco = argumentos['banco'];
      carregarItensAtivos = argumentos['carregarItens'];
      carregarItensExcluidos();
    }
  }

  Future<void> carregarItensExcluidos() async {
    final dados = await banco.database;
    final resultado = await dados.query(
      'itens',
      where: 'excluido = ?',
      whereArgs: [1],
    );
    if (mounted) {
      setState(() {
        itensExcluidos = resultado;
      });
    }
  }

  void restaurarItem(int id) async {
    await banco.restaurarItem(id);
    await carregarItensExcluidos();
    carregarItensAtivos();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Item restaurado com sucesso!')),
    );
  }

  void excluirPermanentemente(int id) async {
    await banco.excluirPermanentemente(id);
    await carregarItensExcluidos();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Item excluído permanentemente!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lixeira', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red.shade800,
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
      ),
      backgroundColor: const Color.fromRGBO(37, 37, 37, 1.0),
      body: itensExcluidos.isEmpty
          ? const Center(
        child: Text(
          'Nenhum item na lixeira.',
          style: TextStyle(color: Colors.white60),
        ),
      )
          : ListView.builder(
        itemCount: itensExcluidos.length,
        itemBuilder: (context, index) {
          final item = itensExcluidos[index];
          return Dismissible(
            key: Key(item['id'].toString()),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red.shade700,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.delete_forever, color: Colors.white),
            ),
            confirmDismiss: (direction) async {
              return await showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Excluir definitivamente?'),
                  content: Text('Deseja excluir "${item['nome']}" permanentemente?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text('Excluir', style: TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
              );
            },
            onDismissed: (_) => excluirPermanentemente(item['id']),
            child: ListTile(
              title: Text(
                item['nome'],
                style: const TextStyle(color: Colors.white),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.restore, color: Colors.white),
                onPressed: () => restaurarItem(item['id']),
                tooltip: 'Restaurar item',
              ),
            ),
          );
        },
      ),
    );
  }
}
