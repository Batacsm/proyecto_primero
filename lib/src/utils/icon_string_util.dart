import 'package:flutter/material.dart';

final _icons = <String, IconData>{

  "add_alert"     : Icons.add_alert,
  "accessibility" : Icons.accessibility,
  "folder_open"   : Icons.folder_open,
  "change_circle" : Icons.change_circle,
  "input"         : Icons.input,
  "iconito"       : Icons.check_box,
  "listaicono"    : Icons.list,

};

Icon getIcon(String nombreIcono){
  return Icon(_icons[nombreIcono], color: Colors.blue,);
}