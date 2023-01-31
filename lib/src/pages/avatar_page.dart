

import 'package:flutter/material.dart';

class Avatar extends StatefulWidget {
  const Avatar({super.key});

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/descarga.jpg'),
            radius: 20,
          ),
          const SizedBox(width: 5,),
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundColor: Colors.blue[50],
              child: const Text('SG'),
            ),
          ),
        ],
        title: const Text('Avatar :D'),
      ),
      body: _mostrarAvatar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () { 
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back),
      ),
    );


  }
  
  Widget _mostrarAvatar() {

    return const Center(
      child: FadeInImage(
        placeholder: AssetImage('assets/corazon.gif'),
        image: AssetImage('assets/selena.jpg'),
        fadeInDuration: Duration(seconds: 1),
      ),
    );
  }
}