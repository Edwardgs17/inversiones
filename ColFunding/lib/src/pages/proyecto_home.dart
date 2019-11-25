import 'dart:io';

import 'package:flutter/material.dart';
import 'package:Inversiones/src/models/proyecto_models.dart';
import 'package:Inversiones/src/providiers/proyectos_providier.dart';
import 'package:Inversiones/src/utils/logica.dart' as logica;
import 'package:image_picker/image_picker.dart';

class ProyectoPage extends StatefulWidget {

  @override
  _ProyectoPageState createState() => _ProyectoPageState();
}

class _ProyectoPageState extends State<ProyectoPage> {


  final formKey     = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final proyectosProvider = new ProyectosProvidier();

  ProyectoModel proyecto = new ProyectoModel();
  bool _guardando = false;
  File foto;

  @override
  Widget build(BuildContext context) {

    final ProyectoModel prodData = ModalRoute.of(context).settings.arguments;
    if(prodData !=null ){
      proyecto = prodData;
    }

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text('ColFunding'),
        centerTitle: true,

            actions: <Widget>[
              IconButton( 
                icon: Icon(Icons.photo_size_select_actual),
                onPressed: _seleccionarFoto,

              ),

              IconButton( 
                icon: Icon(Icons.camera_alt),
                onPressed: _tomarFoto,
                ),
            ],
      ),
      body: SingleChildScrollView(
        child: Container(

          padding: EdgeInsets.all(15.0),

          child: Form(
              key: formKey,

            child: Column(
                children: <Widget>[
                 _mostrarFoto(),
                 _crearNombre(),
                 _crearPrecio(),
                 _crearDisponible(),
                 _crearBoton(),
                ],
            ),
          ),

          ),
        ),
      
    );
  }

      Widget  _crearNombre(){


          return TextFormField(

            initialValue: proyecto.nombre,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              
              labelText: 'Nombre del proyecto',
            ),

          onSaved: (value) => proyecto.nombre = value,
           validator: ( value ){

              if( value.length<3 ){

                  return 'Ingrese nombre del proyecto';
              }
              else{
                return null;
              }
            }
          );
          
         }

   Widget  _crearPrecio(){

          return TextFormField(

            initialValue: proyecto.valor.toString(),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(     
            labelText: 'Precio del proyecto',

            ),

            onSaved: (value) => proyecto.valor = double.parse(value),
            
            validator: ( value ){

                if( logica.isNumeric( value)){

                  return null;

                }
                else{

                  return 'Solo numeros';
                }
             }  
          );
   }
  Widget _crearDisponible() {

    return SwitchListTile(

        value: proyecto.disponible,
        title: Text('Disponible'),
        activeColor: Colors.blue[800],
        onChanged: (value) =>setState(() {
          
            proyecto.disponible= value;
        }),
     );  
    
    }
      Widget  _crearBoton(){

          return RaisedButton.icon(

            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            textColor: Colors.white,
            color: Colors.blue[800],
            label: Text('Guardar'),
            icon: Icon(Icons.save),
            onPressed: ( _guardando ) ? null : _submit,
            
                 
          ); 
      }

      void _submit() async{

        if( !formKey.currentState.validate( ) ) return;

        formKey.currentState.save();

        setState(() {_guardando = true; });

    if ( foto != null ) {
      proyecto.fotoUrl = await proyectosProvider.subirImagen(foto);
    }

    if ( proyecto.id == null ) {
      proyectosProvider.crearProyecto(proyecto);
    } else {
      proyectosProvider.editarProyecto(proyecto);
    }


    // setState(() {_guardando = false; });
    mostrarSnackbar('Registro guardado');

    Navigator.pop(context);

  }


  void mostrarSnackbar(String mensaje) {

    final snackbar = SnackBar(
      content: Text( mensaje ),
      duration: Duration( milliseconds: 1500),
    );
  }


  Widget _mostrarFoto() {

    if ( proyecto.fotoUrl != null ) {
      
      return FadeInImage(
        image: NetworkImage( proyecto.fotoUrl ),
        placeholder: AssetImage('assets/time-money.gif'),
        height: 300.0,
        fit: BoxFit.contain,
      );

    } else {

      return Image(

        image: AssetImage( foto?.path ?? 'assets/no-image.png'),
        height: 300.0,
        fit: BoxFit.cover,

      );

    }

  }


  _seleccionarFoto() async {

     foto = await ImagePicker.pickImage(
      source: ImageSource.gallery
    );

    if ( foto != null ) {
      proyecto.fotoUrl = null;
    }

    setState(() {});

  }
  
  
  _tomarFoto() async {


    foto = await ImagePicker.pickImage(
      source: ImageSource.camera
    );

    if ( foto != null ) {
      proyecto.fotoUrl = null;
    }

    setState(() {});

  }
    

  }



