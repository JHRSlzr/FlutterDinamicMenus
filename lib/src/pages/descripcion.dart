import 'package:flutter/material.dart';
import 'package:COMPONENTES/src/providers/menu_provider2.dart';

class Descripcion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('DESCRIPCION GENERAL')
        ),
        body: _lista(),
      );
  }
}

 Widget _lista() {
    // FUTURE BUILDER
    return FutureBuilder(
        future: menuProvider.cargarData(),
        initialData: [],
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return ListView(
            children: _listaItems(snapshot.data, context),
          );
        });
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = Text(opt["descripcion"]
      );
      opciones..add(widgetTemp)..add(Divider());
    });
    return opciones;
  }

