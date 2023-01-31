

import 'package:flutter/material.dart';

class Inputs extends StatefulWidget {
  const Inputs({super.key});

  @override
  State<Inputs> createState() => _InputsState();
}

class _InputsState extends State<Inputs> {
  String _nombresito = '';
  String _correito = '';
  String _password = '';
  String _fecha = '';



  final TextEditingController _controFecha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs :/'),
      ),
      body: _mostrarInputs(),
      floatingActionButton: FloatingActionButton(
        heroTag: 'botonPaVolver',
        onPressed: () { 
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
  
  Widget _mostrarInputs() {
    return Center(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          _crearInput(),
          const Divider(
            height: 30.0,
          ),
          _crearCorreo(),
          const Divider(
            height: 30.0,
          ),
          _crearPassword(),
          const Divider(
            height: 30.0,
          ),
          _crearFecha(context),
          const Divider(
            height: 30.0,
          ),
          _crearPersona(),
        ],
      ),
    );
  }
  
  Widget _crearInput() {
    
    return TextField(
      // autofocus: true, Para que se abra el teclado automáticamente
      textCapitalization: TextCapitalization.sentences, //Solo sirve en teléfono
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text('Cantidad de caracteres: ${ _nombresito.length }'),
        helperText: 'Acá va el nombre completo',
        labelText: 'Nombre',
        hintText: 'Nombre de la persona',
        suffixIcon: const Icon(Icons.accessibility),
        icon: const Icon(Icons.account_circle),
        
      ),
      onChanged: (valor){
        setState(() {
          _nombresito = valor;
        });
      },

    );
  }
  
  Widget _crearPersona() {
    return ListTile(
      title: Text('¡HOLA, $_nombresito!'),
      subtitle: Text('Correo: $_correito'),
    );
  }
  
  Widget _crearCorreo() {
    return TextField(
      keyboardType: TextInputType.emailAddress, //solo para teléfono
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text('Cantidad de caracteres: ${ _correito.length }'),
        helperText: 'Acá va el correo electrónico',
        labelText: 'E-Mail',
        hintText: 'Correo de la persona',
        suffixIcon: const Icon(Icons.alternate_email),
        icon: const Icon(Icons.email),
        
      ),
      onChanged: (valor){
        setState(() {
          _correito = valor;
        });
      },

    );
  }
  
  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text('Cantidad de caracteres: ${ _password.length }'),
        helperText: 'Acá va la contraseña',
        labelText: 'Contraseña',
        hintText: 'Contraseña de la persona',
        suffixIcon: const Icon(Icons.lock_open),
        icon: const Icon(Icons.lock),
        
      ),
      onChanged: (valor){
        setState(() {
          _password= valor;
        });
      },

    );
  }
  
  Widget _crearFecha(BuildContext context) {
    return TextField(
      controller: _controFecha,
        enableInteractiveSelection: false,
        decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text('Cantidad de caracteres: ${ _password.length }'),
        helperText: 'Acá va la fecha (No sé de qué)',
        labelText: 'Fecha',
        hintText: 'Fecha de la persona',
        suffixIcon: const Icon(Icons.calendar_month),
        icon: const Icon(Icons.calendar_month_outlined),
        
      ),

      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _seleccionarFecha(context);
      },
      

    );
  }
  
  Future _seleccionarFecha(BuildContext context) async{

    DateTime? fechita = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime(2030),
      locale: const Locale('es', 'ES'),
    );

    if( fechita != null){
      setState(() {
        _fecha = fechita.toString();
        _controFecha.text = _fecha;
      });
    }
  }
  



}