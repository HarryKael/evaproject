import 'package:evaproject/src/consts/chars.dart';
import 'package:evaproject/src/consts/components.dart';
import 'package:evaproject/src/consts/consts.dart';
import 'package:evaproject/src/pages/egresado/egresado_controller.dart';
import 'package:evaproject/src/pages/login/login_controller.dart';
import 'package:evaproject/src/routes/app_routes.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';

const List<String> _listPopup = [
  editarString,
  ofertasString,
  reportesString,
  cerrarSesionString,
];

class EgresadoPage extends StatelessWidget {
  const EgresadoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(egresadoString),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              switch (value) {
                case editarString:
                  break;
                case ofertasString:
                  Get.toNamed(AppRoutes.ofertas);
                  break;
                case reportesString:
                  goToReportes();
                  break;
                case cerrarSesionString:
                  LoginController.to.userEgresado = null;
                  Get.offAllNamed(AppRoutes.login);
                  break;
              }
            },
            itemBuilder: (context) => _listPopup
                .map<PopupMenuItem<String>>(
                  (e) => PopupMenuItem<String>(
                    value: e,
                    child: Text(e),
                  ),
                )
                .toList(),
          ),
        ],
      ),
      body: GetBuilder<EgresadoController>(
          init: EgresadoController(),
          builder: (egresadoController) {
            return edgeInsetsSafeArea(
              LoginController.to.userEgresado != null
                  ? Column(
                      children: [
                        ListTile(
                          onTap: () async {
                            if (LoginController.to.userEgresado!.egresadoModel.curriculo == null) {
                              // agregar curriculo
                              final FilePickerResult? result =
                                  await FilePicker.platform.pickFiles(
                                      type: FileType.custom,
                                      allowedExtensions: ['pdf'],
                                      allowMultiple: false);
                              if (result != null) {
                                egresadoController.updateCurriculo(
                                    path: result.paths.first!);
                              }
                            } else {
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
                                    filePath:
                                        LoginController.to.userEgresado!.egresadoModel.curriculo,
                                  ))));
                            }
                          },
                          title: Text(
                            LoginController.to.userEgresado!.egresadoModel.curriculo == null
                                ? agregarCurriculoString
                                : verCurriculoString,
                                style: const TextStyle(color: Colors.blue),
                          ),
                        ),
                        CardEgresado(
                            egresado: LoginController.to.userEgresado!.egresadoModel, version: 2),
                        // ListTile(
                        //   title: ,
                        // ),
                      ],
                    )
                  : 
                  // TODO: Empresa
                  LoginController.to.userEmpresa != null ? Column(
                      children: [
                        ListTile(
                          onTap: () async {
                            if (LoginController.to.userEgresado!.egresadoModel.curriculo == null) {
                              // agregar curriculo
                              final FilePickerResult? result =
                                  await FilePicker.platform.pickFiles(
                                      type: FileType.custom,
                                      allowedExtensions: ['pdf'],
                                      allowMultiple: false);
                              if (result != null) {
                                egresadoController.updateCurriculo(
                                    path: result.paths.first!);
                              }
                            } else {
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
                                    filePath:
                                        LoginController.to.userEgresado!.egresadoModel.curriculo,
                                  ))));
                            }
                          },
                          title: Text(
                            LoginController.to.userEgresado!.egresadoModel.curriculo == null
                                ? agregarCurriculoString
                                : verCurriculoString,
                                style: const TextStyle(color: Colors.blue),
                          ),
                        ),
                        CardEgresado(
                            egresado: LoginController.to.userEgresado!.egresadoModel, version: 2),
                        // ListTile(
                        //   title: ,
                        // ),
                      ],
                    ) :
                    const Center(
                      child: Text(
                          huboUnErrorTieneQueIniciarSesionNuevamenteString),
                    ),
            );
          }),
    );
  }
}
