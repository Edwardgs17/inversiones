import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';
import 'package:Inversiones/src/models/proyecto_models.dart';
import 'package:Inversiones/src/preferencias/preferencias_usuario.dart';


class ProyectosProvidier{


  final String _http = 'https://inversiones-bec58.firebaseio.com';
  final _prefs = PreferenciasUsuario();


  Future<bool> crearProyecto( ProyectoModel proyecto ) async{


    final url= '$_http/proyectos.json?auth=${_prefs.token}';

     final resp = await http.post(url, body: proyectoToJson( proyecto ));

     final decodeData= json.decode(resp.body);

     print(decodeData);

     return true;
  }

    Future<List<ProyectoModel>> cargarProyecto() async{


    final url= '$_http/proyectos.json?auth=${_prefs.token}';
    final res= await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(res.body);
    final List<ProyectoModel> proyectos = new List();


    if ( decodedData == null ) return [];

    decodedData.forEach( ( id, prod ){

      final prodTemp = ProyectoModel.fromJson(prod);
      prodTemp.id = id;

      proyectos.add( prodTemp );

    });

    // print( productos[0].id );
    return proyectos;

  }

    Future<bool> editarProyecto( ProyectoModel proyecto ) async {
    
    final url = '$_http/proyectos/${ proyecto.id }.json?auth=${_prefs.token}';

    final resp = await http.put( url, body: proyectoToJson(proyecto) );

    final decodedData = json.decode(resp.body);

    print( decodedData );

    return true;

  }
  Future<int> borrarProyecto( String id ) async { 

    final url  = '$_http/proyectos/$id.json?auth=${_prefs.token}';
    final resp = await http.delete(url);

    print( resp.body );

    return 1;
  }


  Future<String> subirImagen( File imagen ) async {

    final url = Uri.parse('https://api.cloudinary.com/v1_1/dc0tufkzf/image/upload?upload_preset=cwye3brj');
    final mimeType = mime(imagen.path).split('/'); //image/jpeg

    final imageUploadRequest = http.MultipartRequest(
      'POST',
      url
    );

    final file = await http.MultipartFile.fromPath(
      'file', 
      imagen.path,
      contentType: MediaType( mimeType[0], mimeType[1] )
    );

    imageUploadRequest.files.add(file);


    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if ( resp.statusCode != 200 && resp.statusCode != 201 ) {
      print('Algo salio mal');
      print( resp.body );
      return null;
    }

    final respData = json.decode(resp.body);
    print( respData);

    return respData['secure_url'];


  }

}