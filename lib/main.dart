import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:proyecto_primero/src/pages/alert_page.dart';
import 'package:proyecto_primero/src/routes/routes.dart';
//import 'package:proyecto_primero/src/pages/principito_temp.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override Widget build(BuildContext context) {
        return MaterialApp(
                    debugShowCheckedModeBanner : false,
                    localizationsDelegates: const [
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                    ],
                    supportedLocales: const [
                      Locale('en', 'US'),
                      Locale('es', 'ES'),
                    ],
                    title : 'Componentes',
                    //home : Principio(),
                    initialRoute: '/',
                    routes: getRoutes(),
                    onGenerateRoute: (settings) {
                      return MaterialPageRoute(
                        builder: (BuildContext context) => const Alerta(), 
                      
                      );
                    },
                    
                );
            }
        }