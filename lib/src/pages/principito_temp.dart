import 'package:flutter/material.dart';

final List<String> _numeros = [
    'cero',
    'uno',
    'dos',
    'tres',
    'cuatro',
    'cinco',
    'seis',
    'siete',
    'ocho',
    'nueve'
];

class PrincipioTemp extends StatelessWidget {

    const PrincipioTemp({super.key});

    @override Widget build(BuildContext context) {
        return Scaffold(
                appBar : AppBar(title : const Text('Principito pero es temporal')),
                body : ListView(children : _crearNumeros()),
            );
        }

        List<Widget> _crearNumeros() {

            List<Widget> lista = <Widget> [];

            for (String num in _numeros) {

                final Widget mostrarTemp = ListTile(title : Text(num),);

                lista.add(mostrarTemp);
                lista.add(const Divider());
                // También sirve con "..add" para decirle que regrese a la lista del add para
                // que agrege la otra cosa

            }

            return lista;
        }
    }