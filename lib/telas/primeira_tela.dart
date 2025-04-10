// import 'package:flutter/material.dart';
//
// class PrimeiraTela extends StatelessWidget {
//   @override
//
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Tela Principal')),
//       body: SafeArea( // protege a barra para não sobrepor a barra superior
//         child: Align(
//           alignment: Alignment.topCenter,
//           child: Padding(
//             padding: const EdgeInsets.only(top: 16.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   child: Text('Segunda Tela'),
//                   onPressed: () {
//                     Navigator.pushNamed(context, '/segunda');
//                   },
//                 ),
//                 SizedBox(width: 16), // Espaço entre os botões
//                 ElevatedButton(
//                   child: Text('Terceira Tela'),
//                   onPressed: () {
//                     Navigator.pushNamed(context, '/terceira');
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class PrimeiraTela extends StatelessWidget {
  final List<String> nomes = [
    'João',
    'Maria',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Nomes')),
      body: ListView.builder(
        itemCount: nomes.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.add_circle), // icones
            title: Text(nomes[index]),
          );
        },
      ),
    );
  }
}

