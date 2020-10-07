import 'package:flutter/material.dart';
import 'package:miloficios_app/providers/user_provider.dart';
import 'package:miloficios_app/utils/http_helper.dart';
import 'package:provider/provider.dart';

class EditarPerfil extends StatefulWidget {
  EditarPerfil({Key key}) : super(key: key);

  @override
  _EditarPerfilState createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfil> {
  TextEditingController controllerCorreo = TextEditingController();
  TextEditingController controllerNombre = TextEditingController();
  TextEditingController controllerApellido = TextEditingController();
  TextEditingController controllerDni = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
      ),
      body: Column(
        children: [
          TextField(
            controller: controllerNombre,
            decoration: InputDecoration(hintText: "Nombre"),
          ),
          TextField(
            controller: controllerApellido,
            decoration: InputDecoration(hintText: "Apellidos"),
          ),
          TextField(
            controller: controllerCorreo,
            decoration: InputDecoration(hintText: "Correo"),
          ),
          TextField(
            controller: controllerDni,
            decoration: InputDecoration(hintText: "DNI"),
          ),
          RaisedButton(
              child: Text("Actualizar"),
              onPressed: () async {
                await HttpHelper().actualizarUsuario(
                    controllerNombre.text,
                    controllerApellido.text,
                    controllerDni.text,
                    controllerCorreo.text,
                    Provider.of<UserProvider>(context, listen: false).token);

                    Provider.of<UserProvider>(context, listen: false)
                        .saveUserProfile(
                           email: controllerCorreo.text,
                            first_name:controllerNombre.text,
                            last_name:controllerApellido.text,
                            dni:controllerDni.text);
              })
        ],
      ),
    );
  }
}
