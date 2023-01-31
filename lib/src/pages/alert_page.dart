
import 'package:flutter/material.dart';

class Alerta extends StatefulWidget {
  const Alerta({super.key});

  @override
  State<Alerta> createState() => _AlertaState();
}

class _AlertaState extends State<Alerta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alerta :O'),
      ),
      body: _mostrarAlerta(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () { 
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back),
      ),
    );


  }
  
  Widget _mostrarAlerta(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25.5)),
            ),
            child: ElevatedButton(
              onPressed: (() {
                _bichuchearAlerta(context);
              }),
              child: const Text('Hola, soy un botón', style: TextStyle(color: Colors.black),),
              
            ),
          ),
          TextButton(
            onPressed: (() {
              _bichuchearAlerta(context);
            }),
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.cyan),
              //textStyle: MaterialStatePropertyAll(TextStyle(color: Colors.black)),
              shape: MaterialStatePropertyAll(StadiumBorder()),
            ),
            child: const Text('Hola, soy el botón 2', style: TextStyle(color: Colors.black),),

          ),
        ],
      ),
    );
  }
  
  void _bichuchearAlerta(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) { 
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: const Text('Soy un cuadro de alerta :D'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('Soy el texto de este cuadro, holi :D'),
              FlutterLogo(size: 100,),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Este sí'),
            ),
            TextButton(
              onPressed: (() {
                Navigator.of(context).pop();
              }),
              child: const Text('Este no'),
            ),
          ],
        );
      },
    );
  }
}