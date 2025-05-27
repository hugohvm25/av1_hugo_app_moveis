import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Armazenamento {
  // Retorna o caminho completo de um arquivo pelo nome
  Future<String> _getCaminhoArquivo(String nomeArquivo) async {
    final dir = await getApplicationDocumentsDirectory();
    return '${dir.path}/$nomeArquivo';
  }

  // Salva uma lista de strings em arquivo JSON
  Future<void> salvarLista(List<String> lista, String nomeArquivo) async {
    final caminho = await _getCaminhoArquivo(nomeArquivo);
    final arquivo = File(caminho);
    final conteudo = json.encode(lista);
    await arquivo.writeAsString(conteudo);
  }

  // Lê uma lista de strings de um arquivo JSON
  Future<List<String>> lerLista(String nomeArquivo) async {
    final caminho = await _getCaminhoArquivo(nomeArquivo);
    final arquivo = File(caminho);

    if (await arquivo.exists()) {
      final conteudo = await arquivo.readAsString();
      return List<String>.from(json.decode(conteudo));
    } else {
      return [];
    }
  }
}
