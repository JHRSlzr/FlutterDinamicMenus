import 'package:COMPONENTES/src/pages/descripcion.dart';
import 'package:COMPONENTES/src/providers/menu_provider2.dart';
import 'package:COMPONENTES/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Menu')
        ),
      body: _lista(),
    );
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
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_down, color: Colors.blueAccent),
        onTap: () {
          final route = MaterialPageRoute(builder: (context) => Descripcion());
          Navigator.push(context, route);
        },
      );
      opciones..add(widgetTemp)..add(Divider());
    });
    return opciones;
  }
}
