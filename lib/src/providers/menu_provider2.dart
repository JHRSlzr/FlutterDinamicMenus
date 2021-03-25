import 'package:flutter/services.dart' show rootBundle;
import "dart:convert";

class _MenuProvider2 {
  //UNA VARIABLE PERMITA UNA SERIE DE OPCIONES DINÁMICAS
  List<dynamic> opciones = [];

  _MenuProvider2() {
    cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('data/menu_opts2.json');

    Map dataMap = json.decode(resp);
    opciones = dataMap['rutas'];

    return opciones;
  }
}

final menuProvider = new _MenuProvider2();
