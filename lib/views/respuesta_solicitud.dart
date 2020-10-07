import 'package:flutter/material.dart';
import 'package:miloficios_app/models/respuestasolicitud.dart';
import 'package:miloficios_app/providers/user_provider.dart';
import 'package:miloficios_app/utils/http_helper.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class RespuestaSolicitud extends StatefulWidget {
  RespuestaSolicitud({Key key}) : super(key: key);

  @override
  _RespuestaSolicitudState createState() => _RespuestaSolicitudState();
}

class _RespuestaSolicitudState extends State<RespuestaSolicitud> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: HttpHelper().consultarRespuestaSolicitud(Provider.of<UserProvider>(context,listen:false).token),
        builder: (context,snapshot){
          if(snapshot.hasData){
            List<RespuestaSolicitudModel> respuestas=snapshot.data;
            return ListView.builder(
              itemCount: respuestas.length,
              itemBuilder: (context,index) => ListTile(
                onTap: (){
                  launch("telf"+respuestas[index].numeroContacto);
                },
                title: Text(respuestas[index].descripcion),
                subtitle: Text(respuestas[index].numeroContacto),
                trailing: Text(respuestas[index].precio.toString()),
              )
              );
          }
          else if(snapshot.hasError){
            return Text(snapshot.error.toString());
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      ),
    );
  }
}