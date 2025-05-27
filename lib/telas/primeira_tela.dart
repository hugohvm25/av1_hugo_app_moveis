// // import 'package:flutter/material.dart';
// //
// // class PrimeiraTela extends StatefulWidget {
// //   const PrimeiraTela({super.key});
// //
// //   @override
// //   State<PrimeiraTela> createState() => _PrimeiraTelaState();
// // }
// //
// // class _PrimeiraTelaState extends State<PrimeiraTela> {
// //   List<String> itens = [];
// //
// //   void adicionarItem() async {
// //     final novoItem = await Navigator.pushNamed(context, '/segunda');
// //     if (novoItem != null) {
// //       setState(() {
// //         itens.add(novoItem as String);
// //       }
// //       );
// //     }
// //   }
// //
// //   void editarItem(int index) async {
// //     final novoItem = await Navigator.pushNamed(
// //       context,
// //       '/segunda',
// //       arguments: itens[index],
// //     );
// //     if (novoItem != null) {
// //       setState(() {
// //         itens[index] = novoItem as String;
// //       }
// //       );
// //     }
// //   }
// //
// //   void removerItem(int index) {
// //     setState(() {
// //       itens.removeAt(index);
// //     }
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Lista de Itens', style: TextStyle(color: Colors.white)),
// //         backgroundColor: Colors.indigo,
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.arrow_circle_right_outlined, color: Colors.white),
// //             onPressed: () => Navigator.pushNamed(context, '/terceira'),
// //           )
// //         ],
// //       ),
// //       body: ListView.builder(
// //         itemCount: itens.length,
// //         itemBuilder: (context, index) => ListTile(
// //           title: Text(itens[index]),
// //           trailing: Row(
// //             mainAxisSize: MainAxisSize.min,
// //             children: [
// //               IconButton(
// //                 icon: const Icon(Icons.edit, color: Colors.orange),
// //                 onPressed: () => editarItem(index),
// //               ),
// //               IconButton(
// //                 icon: const Icon(Icons.delete, color: Colors.red),
// //                 onPressed: () => removerItem(index),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //       floatingActionButton: SizedBox(
// //         width: 350,
// //         height: 50,
// //         child: FloatingActionButton(
// //           onPressed: adicionarItem,
// //           child: const Icon(Icons.add, size: 40),
// //         ),
// //       ),
// //       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
// //     );
// //   }
//
//
// // import 'package:flutter/material.dart';
// //
// // class PrimeiraTela extends StatefulWidget {
// //   const PrimeiraTela({super.key});
// //
// //   @override
// //   State<PrimeiraTela> createState() => _PrimeiraTelaState();
// // }
// //
// // class _PrimeiraTelaState extends State<PrimeiraTela> {
// //   List<String> itens = []; //armazena os itens na tela inicial
// //   List<String> itensExcluidos = []; //armazena os itens excluidos
// //
// //   void adicionarItem() async {
// //     final novoItem = await Navigator.pushNamed(context, '/segunda');
// //     if (novoItem != null) {
// //       setState(() {
// //         itens.add(novoItem as String);
// //       });
// //     }
// //   }
// //
// //   void editarItem(int index) async {
// //     final novoItem = await Navigator.pushNamed(
// //       context,
// //       '/segunda', //vai para segunda tela para editar o item selecionado
// //       arguments: itens[index],
// //     );
// //     if (novoItem != null) {
// //       setState(() {
// //         itens[index] = novoItem as String; //atualizada o item anterior e salva
// //       });
// //     }
// //   }
// //
// //   void removerItem(int index) {
// //     setState(() {
// //       itensExcluidos.add(itens[index]); // armazena o item removido
// //       itens.removeAt(index);            // remove da lista principal
// //     });
// //   }
// //
// //   void restaurarItem(String item) {
// //     setState(() {
// //       itens.add(item);                 // adiciona de volta na lista principal
// //       itensExcluidos.remove(item);      // remove da lista de excluídos
// //     });
// //   }
// //
// //   void Lixeira() {
// //     Navigator.pushNamed(
// //       context,
// //       '/terceira',
// //       arguments: {
// //         'itensExcluidos': itensExcluidos,
// //         'restaurarItem': restaurarItem,
// //       },
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Lista de Itens', style: TextStyle(color: Colors.white)),
// //         backgroundColor: Colors.indigo,
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.delete, color: Colors.white),
// //             onPressed: Lixeira,
// //           )
// //         ],
// //       ),
// //
// //       backgroundColor: Color.fromRGBO(37, 37, 37, 1.0),
// //
// //       body: ListView.builder(
// //         itemCount: itens.length,
// //         itemBuilder: (context, index) => ListTile(
// //           title: Text(
// //               itens[index],
// //               style: TextStyle(
// //               color: Colors.white, // Cor do texto digitado
// //               fontSize: 18,        // Tamanho do texto (opcional)
// //             ),
// //           ),
// //           trailing: Row(
// //             mainAxisSize: MainAxisSize.min,
// //             children: [
// //               IconButton(
// //                 icon: const Icon(Icons.edit, color: Colors.orange),
// //                 onPressed: () => editarItem(index),
// //               ),
// //               IconButton(
// //                 icon: const Icon(Icons.delete, color: Colors.red),
// //                 onPressed: () => removerItem(index),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //
// //       floatingActionButton: SizedBox(
// //         width: 350,
// //         height: 50,
// //         child: FloatingActionButton(
// //           onPressed: adicionarItem,
// //           child: const Icon(Icons.add, size: 40),
// //         ),
// //       ),
// //
// //       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
// //     );
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'armazenamento.dart';
//
//
// class PrimeiraTela extends StatefulWidget {
//   const PrimeiraTela({super.key});
//
//   @override
//   State<PrimeiraTela> createState() => _PrimeiraTelaState();
// }
//
// class _PrimeiraTelaState extends State<PrimeiraTela> {
//   final Armazenamento _armazenamento = Armazenamento();
//
//   List<String> itens = [];
//   List<String> itensExcluidos = [];
//
//   @override
//   void initState() {
//     super.initState();
//     carregarListas();
//   }
//
//   void carregarListas() async {
//     final itensCarregados = await _armazenamento.lerLista('itens.json');
//     final excluidosCarregados = await _armazenamento.lerLista('excluidos.json');
//
//     setState(() {
//       itens = itensCarregados ?? [];
//       itensExcluidos = excluidosCarregados ?? [];
//     });
//   }
//
//   void adicionarItem() async {
//     final novoItem = await Navigator.pushNamed(context, '/segunda');
//     if (novoItem != null) {
//       setState(() {
//         itens.add(novoItem as String);
//       });
//       await _armazenamento.salvarLista(itens, 'itens.json');
//     }
//   }
//
//   void editarItem(int index) async {
//     final novoItem = await Navigator.pushNamed(
//       context,
//       '/segunda', //vai para segunda tela para editar o item selecionado
//       arguments: itens[index],
//     );
//     if (novoItem != null) {
//       setState(() {
//         itens[index] = novoItem as String;
//       });
//       await _armazenamento.salvarLista(itens, 'itens.json');
//     }
//   }
//
//   void removerItem(int index) async {
//     setState(() {
//       itensExcluidos.add(itens[index]);
//       itens.removeAt(index);
//     });
//     await _armazenamento.salvarLista(itens, 'itens.json');
//     await _armazenamento.salvarLista(itensExcluidos, 'excluidos.json');
//   }
//
//   void restaurarItem(String item) async {
//     setState(() {
//       itens.add(item);
//       itensExcluidos.remove(item);
//     });
//     await _armazenamento.salvarLista(itens, 'itens.json');
//     await _armazenamento.salvarLista(itensExcluidos, 'excluidos.json');
//   }
//
//   void Lixeira() {
//     Navigator.pushNamed(
//       context,
//       '/terceira',
//       arguments: {
//         'itensExcluidos': itensExcluidos,
//         'restaurarItem': restaurarItem,
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Lista de Itens', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.indigo,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.delete, color: Colors.white),
//             onPressed: Lixeira,
//           )
//         ],
//       ),
//
//       backgroundColor: Color.fromRGBO(37, 37, 37, 1.0),
//
//       body: ListView.builder(
//         itemCount: itens.length,
//         itemBuilder: (context, index) => ListTile(
//           title: Text(
//             itens[index],
//             style: TextStyle(
//               color: Colors.white, // Cor do texto digitado
//               fontSize: 18,        // Tamanho do texto (opcional)
//             ),
//           ),
//           trailing: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               IconButton(
//                 icon: const Icon(Icons.edit, color: Colors.orange),
//                 onPressed: () => editarItem(index),
//               ),
//               IconButton(
//                 icon: const Icon(Icons.delete, color: Colors.red),
//                 onPressed: () => removerItem(index),
//               ),
//             ],
//           ),
//         ),
//       ),
//
//       floatingActionButton: SizedBox(
//         width: 350,
//         height: 50,
//         child: FloatingActionButton(
//           onPressed: adicionarItem,
//           child: const Icon(Icons.add, size: 40),
//         ),
//       ),
//
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'banco_dados.dart';

class PrimeiraTela extends StatefulWidget {
  const PrimeiraTela({super.key});

  @override
  State<PrimeiraTela> createState() => _PrimeiraTelaState();
}

class _PrimeiraTelaState extends State<PrimeiraTela> {
  final BancoDados _banco = BancoDados(); // Instância do banco
  List<Map<String, dynamic>> itens = [];

  @override
  void initState() {
    super.initState();
    carregarItens(); // Carrega os itens do banco ao iniciar
  }

  // Carrega itens não excluídos do banco de dados
  void carregarItens() async {
    final dados = await _banco.database;
    final resultado = await dados.query('itens', where: 'excluido = ?', whereArgs: [0]);
    setState(() {
      itens = resultado;
    });
  }

  // Adiciona novo item usando rota para segunda tela
  void adicionarItem() async {
    final novoItem = await Navigator.pushNamed(context, '/segunda');
    if (novoItem != null && novoItem is String) {
      await _banco.adicionarItem(novoItem);
      carregarItens();
    }
  }

  // Edita item existente
  void editarItem(int id, String nomeAtual) async {
    final novoNome = await Navigator.pushNamed(context, '/segunda', arguments: nomeAtual);
    if (novoNome != null && novoNome is String) {
      await _banco.editarItem(id, novoNome);
      carregarItens();
    }
  }

  // Remove (marca como excluído) o item
  void removerItem(int id) async {
    await _banco.removerItem(id);
    carregarItens();
  }

  // Navega para a lixeira, passando o banco e a função de recarregar
  void irParaLixeira() {
    Navigator.pushNamed(
      context,
      '/terceira',
      arguments: {
        'banco': _banco,
        'carregarItens': carregarItens,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Itens', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.white),
            onPressed: irParaLixeira,
          )
        ],
      ),

      backgroundColor: const Color.fromRGBO(37, 37, 37, 1.0),

      body: ListView.builder(
        itemCount: itens.length,
        itemBuilder: (context, index) {
          final item = itens[index];
          return ListTile(
            title: Text(
              item['nome'],
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.orange),
                  onPressed: () => editarItem(item['id'], item['nome']),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => removerItem(item['id']),
                ),
              ],
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: adicionarItem,
        icon: const Icon(Icons.add, size: 40),
        label: const Text('Adicionar'),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
