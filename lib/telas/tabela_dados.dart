import 'package:flutter/material.dart';
import 'banco_dados.dart';

class TabelaDados extends StatelessWidget {
  final BancoDados banco;

  const TabelaDados({super.key, required this.banco});

  Future<List<Map<String, dynamic>>> buscarDados() async {
    final db = await banco.database;
    return db.query('itens'); // Aqui você pode adaptar para outra tabela
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registros da Tabela', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.indigo,
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
      ),
      backgroundColor: const Color.fromRGBO(37, 37, 37, 1.0),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: buscarDados(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Nenhum dado encontrado.', style: TextStyle(color: Colors.white)),
            );
          }

          final dados = snapshot.data!;
          final colunas = dados.first.keys.toList();

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: colunas.map((col) => DataColumn(label: Text(col, style: const TextStyle(color: Colors.white)))).toList(),
              rows: dados.map((linha) {
                return DataRow(
                  cells: colunas.map((col) {
                    return DataCell(Text('${linha[col]}', style: const TextStyle(color: Colors.white)));
                  }).toList(),
                );
              }).toList(),
              headingRowColor: MaterialStateProperty.all(Colors.indigo),
              dataRowColor: MaterialStateProperty.all(const Color.fromRGBO(55, 55, 55, 1.0)),
            ),
          );
        },
      ),
    );
  }
}
