// To parse this JSON data, do
//
//     final solicitud = solicitudFromJson(jsonString);

import 'dart:convert';

Solicitud solicitudFromJson(String str) => Solicitud.fromJson(json.decode(str));

String solicitudToJson(Solicitud data) => json.encode(data.toJson());

class Solicitud {
    Solicitud({
        this.subCategoria,
        this.descripcion,
        this.precio,
        this.cliente,
        this.estado,
    });

    int subCategoria;
    String descripcion;
    double precio;
    int cliente;
    int estado;

    factory Solicitud.fromJson(Map<String, dynamic> json) => Solicitud(
        subCategoria: json["subCategoria"],
        descripcion: json["descripcion"],
        precio: json["precio"],
        cliente: json["cliente"],
        estado:json["estado"],
    );

    Map<String, dynamic> toJson() => {
        "subCategoria": subCategoria,
        "descripcion": descripcion,
        "precio": precio,
        "cliente": cliente,
        "estado" :estado,
    };
}
