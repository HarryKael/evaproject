// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evaproject/src/consts/components.dart';
import 'package:evaproject/src/pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:evaproject/src/consts/chars.dart';
import 'package:evaproject/src/consts/consts.dart';
import 'package:evaproject/src/pages/empresa/empresa_controller.dart';
import 'package:evaproject/src/routes/app_routes.dart';

const List<String> _listPopup = [
  publicarString,
  eliminarOfertasString,
  reportesString,
  cerrarSesionString,
];

class EmpresaPage extends StatelessWidget {
  const EmpresaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(empresaString),
        actions: [
          PopupMenuButton<String>(
              onSelected: (value) {
                switch (value) {
                  case publicarString:
                    Get.toNamed(AppRoutes.publicarOferta, arguments: VersionDePublicacion.empresa.name);
                    break;
                  case eliminarOfertasString:
                    break;
                  case reportesString:
                    goToReportes();
                    break;
                  case cerrarSesionString:
                    LoginController.to.userEmpresa = null;
                    Get.offAllNamed(AppRoutes.login);
                    break;
                }
              },
              itemBuilder: (context) => _listPopup
                  .map((e) => PopupMenuItem<String>(
                        value: e,
                        child: Text(e),
                      ))
                  .toList()),
        ],
      ),
      body: GetBuilder<EmpresaController>(
          init: EmpresaController(),
          builder: (empresaController) {
            final size = MediaQuery.of(context).size;
            return RefreshIndicator(
              onRefresh: () async {
                empresaController.init();
              },
              child: edgeInsetsSafeArea(
                SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      const ListTile(
                        title: Text(misOfertasString),
                      ),
                      if (empresaController.listOfertas.isNotEmpty)
                        ...empresaController.listOfertas
                            .map((e) => CardOferta(oferta: e, version: 1,))
                            .toList(),
                      if (empresaController.listOfertas.isEmpty)
                        SizedBox(
                          height: size.height - 250,
                          width: size.width,
                          child: const Center(
                              child: Text(noTienesOfertasPublicadasString)),
                        )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
