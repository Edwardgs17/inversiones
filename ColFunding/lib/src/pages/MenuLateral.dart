import 'package:flutter/material.dart';


class MenuLateral extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Drawer(
       child: ListView(
         children: <Widget>[
          ListTile(
          title: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(child: Text('Bienvenido a Colfunding', style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20.0,  color: Colors.blue[800]))),

          ),


          subtitle: FlatButton(

            child: Padding(
              padding: const EdgeInsets.only(top:60),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.person),

                   Text('Iniciar Sesión'),
                    ],
                  ),
                ],
              ),
            ),
            onPressed: ()=> Navigator.pushReplacementNamed(context, 'login'),

          ),
     ),
      
          Divider(),


         Padding(
           padding: const EdgeInsets.only(),
           child: FlatButton(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.person_add),

                     Text('Registrate'),
                      ],
                    ),
                  ],
                ),
              ),
              onPressed: ()=> Navigator.pushReplacementNamed(context, 'registro'),
            ),
            

          ),
         ],
       ),
      )
      );
        
      }
    }
