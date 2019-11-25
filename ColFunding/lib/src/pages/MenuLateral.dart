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

          subtitle: Center(

            child: Container(
  
                child: Padding(

                  padding: const EdgeInsets.only(top: 30),


                        child: Column(
                          children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Row(
                                    
                         children: <Widget>[
                                      Icon(Icons.person),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                               child: Text("Iniciar Sesión", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),

                                        ),
                                      ),
                                     ],
                                  ),
                                ),
                                

                                      Divider(),

                            Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 0),
                                    child: Row(
                                      
                                      children: <Widget>[
                                        Icon(Icons.person_add),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Text("Registrate", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),

                                      ), 
                                    ),
                              ],
                            ),
                                  ),
                            ),
                        ],
                      ),
                    ],
                   ),
                 ),


           ),
          ),
          ),
         ],
       ),
      )
      );
        
      }
    }
