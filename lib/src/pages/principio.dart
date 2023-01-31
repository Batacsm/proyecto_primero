import 'package:flutter/material.dart';
import 'package:proyecto_primero/src/providers/menu_provider.dart';
import 'package:proyecto_primero/src/utils/icon_string_util.dart';

class Principio extends StatefulWidget {
  const Principio({super.key});

  @override
  State<Principio> createState() => _PrincipioState();
}

class _PrincipioState extends State<Principio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Este es el home en serio', textAlign: TextAlign.center),
      ),
      body: _lista(),
    );
  }
  
  Widget _lista() {
    //print(menuProvider.opciones);
    //menuProvider.cargarData().then((opciones) {
    //print('_lista');
    //print(opciones);
    //},);
    //return ListView(
    //children: _listaDetalles(),
    //);

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: const [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {

        return ListView(
          children: _listaDetalles(snapshot.data, context),
        );
      },
      
    );
  }
  
  List<Widget> _listaDetalles( List<dynamic>? data, BuildContext context) {

    final List<Widget> opciones = [];

    data?.forEach((opt) { 
      final widgeTemp = ListTile(

        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.cyan,),
        
        onTap: () {
          //final route = MaterialPageRoute(
            //builder: (context) => Alerta()
          //);
          //Navigator.push(context, route);
          Navigator.pushNamed(context, opt['ruta']);
        },

      );

      opciones..add(widgeTemp)
      ..add(const Divider());

    });
    return opciones;
  }
}