import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valueSlider = 100.0;
  bool _chek = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider y chekscosos :D'),
      ),
      body: _mostrarPantalla(),
    );
  }
  
  Widget _mostrarPantalla() {
    return Container(
      padding: const EdgeInsets.only(top: 50.0),
      decoration: BoxDecoration(
        color: Colors.grey[20],
      ),
      child: Column(
        children: [
          _crearSlider(),
          _crearCheck(),
          const Divider(),
          _crearSich(),
          Expanded(
            child: _crearImagen(),
          ),
        ],
      ),
    );
  }
  
  Widget _crearSlider() {
    return Slider(
      activeColor: const Color.fromARGB(255, 202, 226, 175),
      label: 'Cambiar tamaño',
      value: _valueSlider,
      min: 10.0,
      max: 400.0,
      onChanged: (_chek)? null : (nuevitoSlider) {
        
        setState(() {
          _valueSlider = nuevitoSlider;
        });
      },
    );
  }
  
  Widget _crearImagen() {
    return FadeInImage(
      placeholder: const AssetImage('assets/corazon.gif'),
      image: const AssetImage('assets/Bulbasaur.png'),
      width: _valueSlider,
      fit: BoxFit.contain,
    );
  }
  
  Widget _crearCheck() {
    return CheckboxListTile(
      title: const Text('Bloquear imagen'),
      value: _chek,
      onChanged: (nuevochek){
        setState(() {
          _chek = nuevochek!;
        });
      },
    );
  }
  
  Widget _crearSich() {
    return SwitchListTile(
      title: const Text('Bloquear imagen pero con Switch'),
      value: _chek,
      onChanged: (nuevochek){
        setState(() {
          _chek = nuevochek;
        });
      },
    );
  }
}