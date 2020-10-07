// To parse this JSON data, do
//
//     final respuestaSolicitudModel = respuestaSolicitudModelFromJson(jsonString);

import 'dart:convert';

RespuestaSolicitudModel respuestaSolicitudModelFromJson(String str) => RespuestaSolicitudModel.fromJson(json.decode(str));

String respuestaSolicitudModelToJson(RespuestaSolicitudModel data) => json.encode(data.toJson());

class RespuestaSolicitudModel {
    RespuestaSolicitudModel({
        this.solicitud,
        this.descripcion,
        this.precio,
        this.numeroContacto,
    });

    int solicitud;
    String descripcion;
    double precio;
    String numeroContacto;

    factory RespuestaSolicitudModel.fromJson(Map<String, dynamic> json) => RespuestaSolicitudModel(
        solicitud: json["solicitud"],
        descripcion: json["descripcion"],
        precio: json["precio"],
        numeroContacto: json["numero_contacto"],
    );

    Map<String, dynamic> toJson() => {
        "solicitud": solicitud,
        "descripcion": descripcion,
        "precio": precio,
        "numero_contacto": numeroContacto,
    };
}
