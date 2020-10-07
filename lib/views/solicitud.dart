import 'package:flutter/material.dart';
import 'package:miloficios_app/models/categoria.dart';
import 'package:miloficios_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../utils/http_helper.dart';

class CrearSolicitud extends StatefulWidget {
  Categoria categoria;

  CrearSolicitud(this.categoria);
  @override
  _CrearSolicitudState createState() => _CrearSolicitudState(categoria);
}

class _CrearSolicitudState extends State<CrearSolicitud> {

  Categoria categoria;
  
  _CrearSolicitudState(this.categoria);

  TextEditingController _controllerDescripcion=TextEditingController();
  TextEditingController _controllerPrecio=TextEditingController();

  void registrarSolicitud() async{
    HttpHelper().registrarSolicitud(_controllerDescripcion.text, _controllerPrecio.text, categoria.id.toString(),Provider.of<UserProvider>(context, listen: false).token);
    Navigator.pop(context,"solicitud enviada");
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Solicitud enviada"+categoria.nombre),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("Descripción:"),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 8,
                controller: _controllerDescripcion,
                decoration: InputDecoration(
                    hintText: "Indicanos que servicio necesitas"),
              ),
              SizedBox(
                height: 8,
              ),
              Text("Precio referencial:"),
              TextField(
                controller: _controllerPrecio,
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(prefix: Text("S/"), hintText: "000"),
              ),
              SizedBox(
                height: 8,
              ),
              Text("Foto referencial:"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.camera_alt,
                    size: 100,
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                registrarSolicitud();
                },
                child: Text("Enviar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
