import 'package:flutter/material.dart';

import 'package:Inversiones/src/bloc/provider.dart';

import 'package:Inversiones/src/pages/home_page.dart';
import 'package:Inversiones/src/pages/login_page.dart';
import 'package:Inversiones/src/pages/proyecto_home.dart';

 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'login',
        routes: {
          'login'    : ( BuildContext context ) => LoginPage(),
          'home'     : ( BuildContext context ) => HomePage(),
          'proyecto' : ( BuildContext context ) => ProyectoPage(),
        },
        theme: ThemeData(
          primaryColor: Colors.blueAccent,
        ),
      ),
    );
      
  }
}