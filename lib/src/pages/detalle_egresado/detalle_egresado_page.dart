import 'package:evaproject/src/consts/chars.dart';
import 'package:evaproject/src/consts/components.dart';
import 'package:evaproject/src/consts/consts.dart';
import 'package:evaproject/src/models/egresado/egresado_model.dart';
import 'package:evaproject/src/pages/detalle_egresado/detalle_egresado_controller.dart';
import 'package:evaproject/src/pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';

class DetalleEgresadoPage extends StatelessWidget {
  const DetalleEgresadoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final EgresadoModel egresadoModel = LoginController.to.userEmpresa != null
        ? Get.arguments.egresadoModel
        : Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text(detalleEgresadoString),
      ),
      body: edgeInsetsSafeArea(SingleChildScrollView(
        child: GetBuilder<DetalleEgresadoController>(
            init: DetalleEgresadoController(),
            builder: (controller) {
              return Column(
                children: [
                  ListTile(
                    onTap: egresadoModel.curriculo == null
                        ? null
                        : () {
                            // ver curriculo
                            Get.dialog(Scaffold(
                                appBar: AppBar(
                                  leading: IconButton(
                                    icon: const Icon(
                                      Icons.arrow_back,
                                    ),
                                    onPressed: () {
                                      Get.back();
                                    },
                                  ),
                                  title: const Text(pdfString),
                                ),
                                body: SafeArea(
                                    child: PDFView(
                                  filePath: egresadoModel.curriculo,
                                ))));
                          },
                    title: Text(egresadoModel.curriculo == null
                        ? noTieneCurriculoString
                        : verCurriculoString),
                  ),
                  CardEgresado(egresado: egresadoModel, version: 2),
                  if (LoginController.to.userEmpresa != null)
                    ListTile(
                      title: const Text(aceptarString),
                      onTap: () {
                        controller.aceptar(
                            idOferta: Get.arguments.idOferta,
                            cedulaId: egresadoModel.cedulaId);
                      },
                    ),
                ],
              );
            }),
      )),
    );
  }
}
