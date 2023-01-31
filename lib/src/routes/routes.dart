
import 'package:flutter/material.dart';

import 'package:proyecto_primero/src/pages/card_page.dart';
import 'package:proyecto_primero/src/pages/input_page.dart';
import 'package:proyecto_primero/src/pages/listview_page.dart';
import 'package:proyecto_primero/src/pages/slider_page.dart';
import '../pages/alert_page.dart';
import '../pages/animated_container.dart';
import '../pages/avatar_page.dart';
import '../pages/principio.dart';

Map <String, WidgetBuilder> getRoutes () {
  return <String, WidgetBuilder> {
                      '/'       : (BuildContext context) => const Principio(),
                      'alert'   : (BuildContext context) => const Alerta(),
                      'avatar'  : (BuildContext context) => const Avatar(),
                      'card'    : (BuildContext context) => const Cards(),
                      'image'   : (BuildContext context) => const Animated(),
                      'inputs'  : (BuildContext context) => const Inputs(),
                      'sliders' : (BuildContext context) => const SliderPage(),
                      'listas'  : (BuildContext context) => const ListViewPage(),

                    };
}
