import 'package:flutter/material.dart';
import 'package:miloficios_app/providers/user_provider.dart';
import 'package:miloficios_app/utils/http_helper.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController controllerUsuario = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerCorreo = TextEditingController();
  TextEditingController controllerNombre = TextEditingController();
  TextEditingController controllerApellido = TextEditingController();
  TextEditingController controllerDni = TextEditingController();
  String error = "";
  bool inAsyncCall = false;

  void registrarUsuario() async {
    setState(() {
      inAsyncCall = true;
    });
    bool exito = await HttpHelper().registrarUsuario(
        controllerUsuario.text,
        controllerPassword.text,
        controllerCorreo.text,
        controllerNombre.text,
        controllerApellido.text,
        controllerDni.text);
    if (exito) {
      String token = await HttpHelper()
          .iniciarSesion(controllerUsuario.text, controllerPassword.text);
      if (token.length > 0) {
        Navigator.pop(context);
        Provider.of<UserProvider>(context, listen: false).saveUserData(token);
      } else {
        setState(() {
          error = "Credenciales incorrectas";
        });
      }
    }
    setState(() {
      inAsyncCall = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: inAsyncCall,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://st2.depositphotos.com/1752173/12158/v/950/depositphotos_121587406-stock-illustration-seamless-pattern-construction-tools-vector.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Registro",
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextField(
                            controller: controllerUsuario,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.account_circle),
                              hintText: "Usuario",
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    BorderSide(color: Colors.yellow, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextField(
                            controller: controllerPassword,
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              hintText: "Password",
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    BorderSide(color: Colors.yellow, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextField(
                            controller: controllerCorreo,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.mail),
                              hintText: "Correo",
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    BorderSide(color: Colors.yellow, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextField(
                            controller: controllerNombre,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.account_circle),
                              hintText: "Nombre",
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    BorderSide(color: Colors.yellow, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextField(
                            controller: controllerApellido,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.account_circle),
                              hintText: "Apellido",
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    BorderSide(color: Colors.yellow, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextField(
                            controller: controllerDni,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.account_circle),
                              hintText: "DNI",
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    BorderSide(color: Colors.yellow, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Center(
                            child: Text(error),
                          ),
                          RaisedButton(
                            color: Colors.blue,
                            onPressed: () {
                              registrarUsuario();
                            },
                            child: Text(
                              "Registrarse",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
