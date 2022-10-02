// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evaproject/src/pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:evaproject/src/consts/chars.dart';
import 'package:evaproject/src/consts/components.dart';
import 'package:evaproject/src/consts/consts.dart';
import 'package:evaproject/src/models/empresa/empresa_model.dart';
import 'package:evaproject/src/pages/detalle_oferta/detalle_oferta_controller.dart';

class DetalleOfertaPage extends StatelessWidget {
  const DetalleOfertaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(detalleOfertaString),
      ),
      body: GetBuilder<DetalleOfertaController>(
          init: DetalleOfertaController(),
          builder: (detalleOfertaController) {
            final size = MediaQuery.of(context).size;
            return edgeInsetsSafeArea(
              RefreshIndicator(
                onRefresh: () async {
                  detalleOfertaController.init(
                      idOferta: Get.arguments.idOferta);
                },
                child: SizedBox(
                  height: size.height,
                  width: size.width,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        CardOferta(oferta: Get.arguments, version: 2),
                        if (detalleOfertaController.empresaOfertante != null)
                          const ListTile(
                            title: Text(empresaOfertanteString),
                          ),
                        if (detalleOfertaController.empresaOfertante != null)
                          CardEmpresaOfertante(
                              empresaOfertante:
                                  detalleOfertaController.empresaOfertante!),
                        if (LoginController.to.userEgresado != null &&
                            Get.arguments.abierto &&
                            detalleOfertaController.aplicado)
                          OutlinedButton(
                            onPressed: () {
                              detalleOfertaController.aplicar(
                                  idOferta: Get.arguments.idOferta);
                            },
                            child: const Text(aplicarString),
                          ),
                        if (LoginController.to.userEmpresa != null)
                          const ListTile(
                            title: Text(aplicantesString),
                          ),
                        if (LoginController.to.userEmpresa != null &&
                            detalleOfertaController.listAplicantes.isNotEmpty)
                          ...detalleOfertaController.listAplicantes
                              .map((e) => CardEgresado(
                                    egresado: e,
                                    version: Get.arguments.abierto ? 3 : 4,
                                    idOferta: Get.arguments.idOferta,
                                  ))
                              .toList(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class CardEmpresaOfertante extends StatelessWidget {
  const CardEmpresaOfertante({
    Key? key,
    required this.empresaOfertante,
  }) : super(key: key);
  final EmpresaModel empresaOfertante;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      child: Column(
        children: [
          ListTile(
            title: Text(empresaOfertante.nombreComercial),
          ),
          ListTile(
            title: Text(empresaOfertante.direccion),
          ),
          ListTile(
            title: Text(empresaOfertante.telefono),
          ),
          ListTile(
            title: Text(empresaOfertante.web),
          ),
          ListTile(
            title: Text(empresaOfertante.email),
          ),
          ListTile(
            title: Text(empresaOfertante.nombreContacto),
          ),
          ListTile(
            title: Text(empresaOfertante.emailContacto),
          ),
        ],
      ),
    );
  }
}
