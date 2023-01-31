
import 'package:flutter/material.dart';

class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards >:('),
      ),
      body: _mostrarCards(),
      floatingActionButton: FloatingActionButton(
        heroTag: 'BotonPaVolver',
        onPressed: () { 
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back),
      ),
    );


  }
  
  Widget _mostrarCards() {

    return ListView(
      padding: const EdgeInsets.all(20.0),
      children: [
        _cardTipo1(),
        const SizedBox(),
        _cardTipo2(),
      ],
    );
  }
  
  Widget _cardTipo1() {

    return Card(
      elevation: 10.2,
      child: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text('Holaaaaaaaaaaaaaaaaaaaaaaaaaaa'),
            subtitle: Text('Adióoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooos'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  
                },
                child: const Text('Esta es una opción'),
              ),
              TextButton(
                onPressed: () {
                  
                },
                child: const Text('Esta es la otra'),
              ),
            ],
          )
        ],
      ),
    );
  }
  
  Widget _cardTipo2() {

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      elevation: 10.1,
      child: Column(
        children: [
          const FadeInImage(
            image: AssetImage('assets/windowsxp.jpg'),
            placeholder: AssetImage('assets/corazon.gif'),
            fadeInDuration: Duration(seconds: 1),
            height: 400,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: const Text('Bonito Wallpaper full HD 1080 4K crakeado 1 solo link MEGA'),
          ),
        ],
      ),
    );
  }
}