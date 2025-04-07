import 'package:flutter/material.dart';
import '../telas/primeira_tela.dart';
import '../telas/segunda_tela.dart';

class AppRoutes {
  static const String primeiraTela = '/';
  static const String segundaTela = '/segunda';

  static Map<String, WidgetBuilder> routes = {
    primeiraTela: (context) => const PrimeiraTela(),
    segundaTela: (context) => const SegundaTela(),
  };
}
