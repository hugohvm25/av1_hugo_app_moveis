// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
//
// class BancoDados {
//   static Database? _database;
//
//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await iniciarBanco();
//     return _database!;
//   }
//
//   Future<Database> iniciarBanco() async {
//     final caminho = await getDatabasesPath();
//     final path = join(caminho, 'itens.db');
//
//     return openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, version) async {
//         await db.execute('''
//           CREATE TABLE itens (
//             id INTEGER PRIMARY KEY AUTOINCREMENT,
//             nome TEXT,
//             excluido INTEGER DEFAULT 0
//           )
//         ''');
//       },
//     );
//   }
//
//   Future<List<String>> lerItens({bool excluidos = false}) async {
//     final db = await database;
//     final resultado = await db.query('itens', where: 'excluido = ?', whereArgs: [excluidos ? 1 : 0]);
//     return resultado.map((e) => e['nome'] as String).toList();
//   }
//
//   Future<void> adicionarItem(String nome) async {
//     final db = await database;
//     await db.insert('itens', {'nome': nome});
//   }
//
//   Future<void> editarItem(int id, String novoNome) async {
//     final db = await database;
//     await db.update('itens', {'nome': novoNome}, where: 'id = ?', whereArgs: [id]);
//   }
//
//   Future<void> removerItem(int id) async {
//     final db = await database;
//     await db.update('itens', {'excluido': 1}, where: 'id = ?', whereArgs: [id]);
//   }
//
//   Future<void> restaurarItem(int id) async {
//     final db = await database;
//     await db.update('itens', {'excluido': 0}, where: 'id = ?', whereArgs: [id]);
//   }
//
//   Future<void> excluirPermanentemente(int id) async {
//     final db = await database;
//     await db.delete('itens', where: 'id = ?', whereArgs: [id]);
//   }
//
//   Future<void> excluirDefinitivo(int id) async {
//     final db = await database;
//     await db.delete(
//       'itens',
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//   }
// }



import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BancoDados {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await iniciarBanco();
    return _database!;
  }

  Future<Database> iniciarBanco() async {
    final caminho = await getDatabasesPath();
    final path = join(caminho, 'itens.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          '''
            CREATE TABLE itens (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              nome TEXT,
              excluido INTEGER DEFAULT 0
            )
          '''
        );
      },
    );
  }

  Future<List<String>> lerItens({bool excluidos = false}) async {
    final db = await database;
    final int valor = excluidos ? 1 : 0;
    final resultado = await db.rawQuery('SELECT nome FROM itens WHERE excluido = ?', [valor]);
    return resultado.map((e) => e['nome'] as String).toList();
  }

  Future<void> adicionarItem(String nome) async {
    final db = await database;
    await db.rawInsert('INSERT INTO itens (nome) VALUES (?)', [nome]);
  }

  Future<void> editarItem(int id, String novoNome) async {
    final db = await database;
    await db.rawUpdate('UPDATE itens SET nome = ? WHERE id = ?', [novoNome, id]);
  }

  Future<void> removerItem(int id) async {
    final db = await database;
    await db.rawUpdate('UPDATE itens SET excluido = 1 WHERE id = ?', [id]);
  }

  Future<void> restaurarItem(int id) async {
    final db = await database;
    await db.rawUpdate('UPDATE itens SET excluido = 0 WHERE id = ?', [id]);
  }

  Future<void> excluirPermanentemente(int id) async {
    final db = await database;
    await db.rawDelete('DELETE FROM itens WHERE id = ?', [id]);
  }
}

