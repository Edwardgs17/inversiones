import 'package:flutter/material.dart';

bool isNumeric( String s){

  if(s.isEmpty) return false;

  final n= num.tryParse(s);

  return ( n == null) ? false : true; 
}

 void mostrarAlerta(BuildContext context, String mensaje){

   showDialog(

     context: context,
     builder: (context){

   return AlertDialog(

        title: Container(child: Text('Error!!'),

      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color> [
            Colors.white,
            Colors.white,
          ],
        ),
      ),
        ),
        
        content: Text('Informacion Incorrecta!!'),



        actions: <Widget>[

          FlatButton(

              child: Text('Regresar'),
              onPressed: () => Navigator.of(context).pop(),
          
          
          ),
        
      
           ],
        );
     }
   );
}