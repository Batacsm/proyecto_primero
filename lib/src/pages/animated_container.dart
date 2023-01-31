import 'dart:math';

import 'package:flutter/material.dart';

class Animated extends StatefulWidget {
  const Animated({super.key});

  @override
  State<Animated> createState() => _AnimatedState();
}

class _AnimatedState extends State<Animated> {

  double _width = 50.0;
  double _height = 50.0;
  Color _colorcito = Colors.black;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contenedor Cambidor :OO'),
      ),
      body: _mostrarContainer(context),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'regresa1',
            onPressed: () { 
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back),
          ),
          const SizedBox(width: 10,),
          FloatingActionButton(
            heroTag: 'cambio1',
            onPressed: () {
              _cambiarForma();
            },
            child: const Icon(Icons.change_circle_outlined),
          ),
        ],
      ),
    );
    
  }
  
  Widget _mostrarContainer(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        curve: Curves.fastOutSlowIn,
        duration: const Duration(seconds: 1),
        width: _width,
        height: _height,
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          color: _colorcito,
        ),
      ),
    );
  }
  
  void _cambiarForma() {

    final random = Random();

    setState(() {
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _borderRadius = BorderRadius.circular( random.nextInt(300).toDouble());
      _colorcito = Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
    });

  }
}