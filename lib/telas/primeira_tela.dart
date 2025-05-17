// import 'package:flutter/material.dart';
//
// class PrimeiraTela extends StatefulWidget {
//   const PrimeiraTela({super.key});
//
//   @override
//   State<PrimeiraTela> createState() => _PrimeiraTelaState();
// }
//
// class _PrimeiraTelaState extends State<PrimeiraTela> {
//   List<String> itens = [];
//
//   void adicionarItem() async {
//     final novoItem = await Navigator.pushNamed(context, '/segunda');
//     if (novoItem != null) {
//       setState(() {
//         itens.add(novoItem as String);
//       }
//       );
//     }
//   }
//
//   void editarItem(int index) async {
//     final novoItem = await Navigator.pushNamed(
//       context,
//       '/segunda',
//       arguments: itens[index],
//     );
//     if (novoItem != null) {
//       setState(() {
//         itens[index] = novoItem as String;
//       }
//       );
//     }
//   }
//
//   void removerItem(int index) {
//     setState(() {
//       itens.removeAt(index);
//     }
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
//             icon: const Icon(Icons.arrow_circle_right_outlined, color: Colors.white),
//             onPressed: () => Navigator.pushNamed(context, '/terceira'),
//           )
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: itens.length,
//         itemBuilder: (context, index) => ListTile(
//           title: Text(itens[index]),
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
//       floatingActionButton: SizedBox(
//         width: 350,
//         height: 50,
//         child: FloatingActionButton(
//           onPressed: adicionarItem,
//           child: const Icon(Icons.add, size: 40),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }


// import 'package:flutter/material.dart';
//
// class PrimeiraTela extends StatefulWidget {
//   const PrimeiraTela({super.key});
//
//   @override
//   State<PrimeiraTela> createState() => _PrimeiraTelaState();
// }
//
// class _PrimeiraTelaState extends State<PrimeiraTela> {
//   List<String> itens = []; //armazena os itens na tela inicial
//   List<String> itensExcluidos = []; //armazena os itens excluidos
//
//   void adicionarItem() async {
//     final novoItem = await Navigator.pushNamed(context, '/segunda');
//     if (novoItem != null) {
//       setState(() {
//         itens.add(novoItem as String);
//       });
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
//         itens[index] = novoItem as String; //atualizada o item anterior e salva
//       });
//     }
//   }
//
//   void removerItem(int index) {
//     setState(() {
//       itensExcluidos.add(itens[index]); // armazena o item removido
//       itens.removeAt(index);            // remove da lista principal
//     });
//   }
//
//   void restaurarItem(String item) {
//     setState(() {
//       itens.add(item);                 // adiciona de volta na lista principal
//       itensExcluidos.remove(item);      // remove da lista de excluídos
//     });
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
//               itens[index],
//               style: TextStyle(
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
import 'armazenamento.dart';


class PrimeiraTela extends StatefulWidget {
  const PrimeiraTela({super.key});

  @override
  State<PrimeiraTela> createState() => _PrimeiraTelaState();
}

class _PrimeiraTelaState extends State<PrimeiraTela> {
  final Armazenamento _armazenamento = Armazenamento();

  List<String> itens = [];
  List<String> itensExcluidos = [];

  @override
  void initState() {
    super.initState();
    carregarListas();
  }

  void carregarListas() async {
    final itensCarregados = await _armazenamento.lerLista('itens.json');
    final excluidosCarregados = await _armazenamento.lerLista('excluidos.json');

    setState(() {
      itens = itensCarregados ?? [];
      itensExcluidos = excluidosCarregados ?? [];
    });
  }

  void adicionarItem() async {
    final novoItem = await Navigator.pushNamed(context, '/segunda');
    if (novoItem != null) {
      setState(() {
        itens.add(novoItem as String);
      });
      await _armazenamento.salvarLista(itens, 'itens.json');
    }
  }

  void editarItem(int index) async {
    final novoItem = await Navigator.pushNamed(
      context,
      '/segunda', //vai para segunda tela para editar o item selecionado
      arguments: itens[index],
    );
    if (novoItem != null) {
      setState(() {
        itens[index] = novoItem as String;
      });
      await _armazenamento.salvarLista(itens, 'itens.json');
    }
  }

  void removerItem(int index) async {
    setState(() {
      itensExcluidos.add(itens[index]);
      itens.removeAt(index);
    });
    await _armazenamento.salvarLista(itens, 'itens.json');
    await _armazenamento.salvarLista(itensExcluidos, 'excluidos.json');
  }

  void restaurarItem(String item) async {
    setState(() {
      itens.add(item);
      itensExcluidos.remove(item);
    });
    await _armazenamento.salvarLista(itens, 'itens.json');
    await _armazenamento.salvarLista(itensExcluidos, 'excluidos.json');
  }

  void Lixeira() {
    Navigator.pushNamed(
      context,
      '/terceira',
      arguments: {
        'itensExcluidos': itensExcluidos,
        'restaurarItem': restaurarItem,
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
            onPressed: Lixeira,
          )
        ],
      ),

      backgroundColor: Color.fromRGBO(37, 37, 37, 1.0),

      body: ListView.builder(
        itemCount: itens.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            itens[index],
            style: TextStyle(
              color: Colors.white, // Cor do texto digitado
              fontSize: 18,        // Tamanho do texto (opcional)
            ),
          ),
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

      floatingActionButton: SizedBox(
        width: 350,
        height: 50,
        child: FloatingActionButton(
          onPressed: adicionarItem,
          child: const Icon(Icons.add, size: 40),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}