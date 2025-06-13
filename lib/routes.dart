import 'package:flutter/material.dart';

class Routes {
  //home
  static const String initial = '/home';


  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initial:
        return MaterialPageRoute(builder: (_) => const SuaTelaInicial());
      
      default:
        return null;
    }
  }
}
