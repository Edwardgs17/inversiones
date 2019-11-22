import 'dart:convert';


ProyectoModel proyectoFromJson(String str) => ProyectoModel.fromJson(json.decode(str));

String proyectoToJson(ProyectoModel data) => json.encode(data.toJson());

class ProyectoModel {
    String id;
    String nombre;
    var valor;
    var disponible;
    String fotoUrl;

    ProyectoModel({
        this.id,
        this.nombre='',
        this.valor= 0.0,
        this.disponible=true,
        this.fotoUrl,
    });

    factory ProyectoModel.fromJson(Map<String, dynamic> json) => ProyectoModel(

        id          : json["id"],
        nombre      : json["nombre"],
        valor       : json["valor"],
        disponible  : json["disponible"],
        fotoUrl     : json["fotoUrl"],
    );

    Map<String, dynamic> toJson() => {

        //"id"              : id,
        "nombre"          : nombre,
        "valor"           : valor,
        "disponible"      : disponible,
        "fotoUrl"         : fotoUrl,

    };
}