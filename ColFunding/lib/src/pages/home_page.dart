import 'package:Inversiones/src/pages/MenuLateral.dart';
import 'package:flutter/material.dart';
import 'package:Inversiones/src/bloc/provider.dart';
import 'package:Inversiones/src/models/proyecto_models.dart';

import 'package:Inversiones/src/providiers/proyectos_providier.dart';

class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    final proyectosProvidier = new ProyectosProvidier();

  @override
  Widget build(BuildContext   context) {

    final bloc = Provider.of(context);

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text('ColFunding'),
        centerTitle: true,
        
        ),

        drawer: MenuLateral(),
      body: _crearListado(),

      floatingActionButton: _crearBoton(context),

      );
  }

  Widget _crearListado(){

    return FutureBuilder(
      future: proyectosProvidier.cargarProyecto(),
      builder: (BuildContext context, AsyncSnapshot<List<ProyectoModel>> snapshot) {

        if(snapshot.hasData){

            final productos=snapshot.data;

            return ListView.builder(
              itemCount:productos.length ,
              itemBuilder: (context, i) => _crearItem(context, productos[i]),


            );

            }else{

              return Center(child: CircularProgressIndicator());

             }
          },
    );
  }

    Widget _crearItem(BuildContext context, ProyectoModel proyecto ) {

    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: ( direccion ){
        proyectosProvidier.borrarProyecto(proyecto.id);
      },
      child: Card(
        child: Column(
          children: <Widget>[

            ( proyecto.fotoUrl == null ) 
              ? Image(image: AssetImage('assets/no-image.png'))
              : FadeInImage(
                image: NetworkImage( proyecto.fotoUrl ),
                placeholder: AssetImage('assets/time-money.gif'),
                height: 300.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            
            ListTile(
              title: Text('${ proyecto.nombre } - ${ proyecto.valor }'),
              subtitle: Text( proyecto.id ),
              onTap: () => Navigator.pushNamed(context, 'proyecto', arguments: proyecto ),
            ),

          ],
        ),
      )
    );
  }

 _crearBoton(BuildContext context){

      return FloatingActionButton(child: Icon(Icons.add),
      backgroundColor: Colors.blue[800],
        onPressed: () { 
          Navigator.pushNamed(context, 'proyecto');

          setState(() {
            
          });
        }
      );
    }
}