// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evaproject/src/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:evaproject/src/consts/chars.dart';
import 'package:evaproject/src/models/egresado/egresado_model.dart';
import 'package:evaproject/src/models/oferta/oferta_model.dart';
import 'package:evaproject/src/routes/app_routes.dart';



class CardEgresado extends StatelessWidget {
  CardEgresado({
    Key? key,
    required this.egresado,
    required this.version,
    this.idOferta,
  }) : super(key: key);
  final EgresadoModel egresado;
  final int version;
  String? idOferta;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: version == 1 ? () {
        Get.toNamed(AppRoutes.detalleEgresado, arguments: egresado);
      } : version == 3 ? (){
        Get.toNamed(AppRoutes.detalleEgresado, arguments: Envio(egresadoModel: egresado, idOferta: idOferta!));
      } : version == 4 ? (){
        Get.showSnackbar(const GetSnackBar(title: appName, message: laOfertaEstaCerradaAAplicacionesString,));
      } : null,
      child: Card(
        elevation: 15,
        child: Column(
          children: [
            ListTile(title: Text(egresado.nombreYApellido)),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Text('${egresado.edad.toString()} $anosString'),
              Text(egresado.sexo),
    
            ],),
            ListTile(title: Text(egresado.correo)),
            ListTile(title: Text(egresado.disponibilidad ? disponibleString : noDisponibleString),),
            const Divider(),
          ],
        ),
      ),
    );
  }
}

class CardOferta extends StatelessWidget {
  const CardOferta({
    Key? key,
    required this.oferta,
    required this.version,
  }) : super(key: key);
  final OfertaModel oferta;
  final int version;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(version == 1) {
          Get.toNamed(AppRoutes.detalleOferta, arguments: oferta);
        }
      },
      child: Card(
        elevation: 5,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  child: ListTile(
                    title: Text(oferta.posicion),
                  ),
                ),
                Positioned(top: 10, right: 10, child: Text(
                    oferta.fechaPub,
                    style: const TextStyle(fontSize: 10),
                  ),),
              ],
            ),
            ListTile(
              title: Text(oferta.abre),
            ),
            ListTile(
              title: Text(oferta.cierra),
            ),
            ListTile(
              title: Text(oferta.beneficios),
            ),
            ListTile(
              title: Text(
                NumberFormat.simpleCurrency().format(oferta.salario),
              ),
            ),
            ListTile(
              title: Text(oferta.ubicacion),
            ),
            ListTile(
              title: Text(oferta.abierto ? abiertoAAplicacionesString : cerradoAAplicacionesString),
            ),
          ],
        ),
      ),
    );
  }
} 
