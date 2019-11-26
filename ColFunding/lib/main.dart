import 'package:flutter/material.dart';

import 'package:Inversiones/src/bloc/provider.dart';

import 'package:Inversiones/src/pages/home_page.dart';
import 'package:Inversiones/src/pages/login_page.dart';
import 'package:Inversiones/src/pages/proyecto_home.dart';
import 'package:Inversiones/src/pages/Registro_page.dart';
import 'package:Inversiones/src/preferencias/preferencias_usuario.dart';

 
void main() async {

  final prefes = PreferenciasUsuario();
  await prefes.initPrefs();


  runApp(MyApp());

 }
 
class MyApp extends StatelessWidget {
    final prefes = PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {

        final prefes = PreferenciasUsuario();

    print(prefes.token);
    
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'login',
        routes: {
          'login'    : ( BuildContext context ) => LoginPage(),
          'home'     : ( BuildContext context ) => HomePage(),
          'proyecto' : ( BuildContext context ) => ProyectoPage(),
          'registro' : ( BuildContext context ) => RegistroPage(),        },
        theme: ThemeData(
          primaryColor: Colors.blueAccent,
        ),
      ),
    );
      
  }
}