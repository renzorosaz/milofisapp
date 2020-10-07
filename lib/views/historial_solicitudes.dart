import 'package:flutter/material.dart';
import 'package:miloficios_app/models/solicitud.dart';
import 'package:miloficios_app/providers/user_provider.dart';
import 'package:miloficios_app/utils/http_helper.dart';
import 'package:miloficios_app/views/respuesta_solicitud.dart';
import 'package:provider/provider.dart';

class HistorialSolicitudes extends StatefulWidget {
  HistorialSolicitudes({Key key}) : super(key: key);

  @override
  _HistorialSolicitudesState createState() => _HistorialSolicitudesState();
}

class _HistorialSolicitudesState extends State<HistorialSolicitudes> {
  @override
  Widget build(BuildContext context) {
    HttpHelper().consultarSolicitudes(
        Provider.of<UserProvider>(context, listen: false).token);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text("HIstorial Solicitudes"),
            bottom: TabBar(tabs: [
              Tab(
                icon: Icon(Icons.inbox),
                text: "Recibidas",
              ),
              Tab(
                icon: Icon(Icons.inbox),
                text: "Pendientes",
              ),
              Tab(
                icon: Icon(Icons.inbox),
                text: "Cerradas",
              )
            ]),
          ),
          body: FutureBuilder(
              future: HttpHelper().consultarSolicitudes(
                  Provider.of<UserProvider>(context, listen: false).token),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Solicitud> solicitudesRecibidas = snapshot.data.where((item)=>item.estado ==1).toList();
                  List<Solicitud> solicitudesPendientes = snapshot.data.where((item)=>item.estado ==2).toList();
                  List<Solicitud> solicitudesCerradas = snapshot.data.where((item)=>item.estado ==3).toList();
                  return TabBarView(children: [
                    ListView.builder(
                      itemCount: solicitudesRecibidas.length,
                      itemBuilder: (context, index) =>
                          ListTile(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder:(context)=> RespuestaSolicitud()));
                            },
                            title: Text(solicitudesRecibidas[index].descripcion)
                          ),
                    ),
                    ListView.builder(
                      itemCount: solicitudesPendientes.length,
                      itemBuilder: (context, index) =>
                          ListTile(title: Text(solicitudesPendientes[index].descripcion)),
                    ),
                    ListView.builder(
                      itemCount: solicitudesCerradas.length,
                      itemBuilder: (context, index) =>
                          ListTile(title: Text(solicitudesCerradas[index].descripcion)),
                    ),
                  ]);
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              })),
    );
  }
}
