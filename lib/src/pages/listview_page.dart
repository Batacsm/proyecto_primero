import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  int _ultItem = 0;
  bool _isLoad = false;

  ScrollController _scrollController = ScrollController();

  List<int> _listaNum = [];

  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        //_agregar10();
        fetchData();

      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listas :('),
      ),
      body: Stack(
        children: [
          _mostrarListas(context),
          _crearLoading(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'BotonoPaAatras',
        onPressed: () { 
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
  
  Widget _mostrarListas(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _obtenerPag,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNum.length,
        itemBuilder: (BuildContext context, int index){
    
          final int numImagen = _listaNum[index];
    
          return FadeInImage(
            placeholder: const AssetImage('assets/corazon.gif'),
            image: NetworkImage('https://picsum.photos/500/300/?image=$numImagen'),
          );
        },
      ),
    );

  }
  
  void _agregar10() {
    for (var i = 0; i < 10; i++) {
        _ultItem++;
        _listaNum.add(_ultItem);
      }
    setState(() {
      
    });
  }
  
  Future fetchData() async{
    _isLoad = true;
    setState(() {
      
    });

    const Duration duration = Duration(seconds: 2);

    return Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP(){
    
    _isLoad = false;

    _scrollController.animateTo(
      _scrollController.position.pixels+100,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(seconds: 2),
    );

    _agregar10();

  }
  
  Widget _crearLoading() {
    
    if (_isLoad) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
            ],
          ),
          const SizedBox(height: 15.0,),
        ],
      );
    } else{
      return Container();
    }
    
  }
  
  Future _obtenerPag() async{

    const Duration fresDuration = Duration(seconds: 2);
    Timer(fresDuration, (){
      _listaNum.clear();
      _ultItem++;
      _agregar10();
      
    });

    return Future.delayed(fresDuration);
  }
}