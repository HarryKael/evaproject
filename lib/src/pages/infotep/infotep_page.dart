// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:evaproject/src/consts/chars.dart';
import 'package:evaproject/src/consts/components.dart';
import 'package:evaproject/src/consts/consts.dart';
import 'package:evaproject/src/pages/infotep/infotep_controller.dart';
import 'package:evaproject/src/routes/app_routes.dart';
import 'package:get/get.dart';

const List<String> _listPopup = [
  invitarString,
  agregarString,
  publicarString,
  reportesString,
  cerrarSesionString,
];

class InfotepPage extends StatelessWidget {
  const InfotepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InfotepController>(
        init: InfotepController(),
        builder: (infotepController) {
          final size = MediaQuery.of(context).size;
          return Scaffold(
            appBar: AppBar(
              title: const Text(infotepString),
              actions: [
                PopupMenuButton<String>(
                  onSelected: (value) {
                    switch (value) {
                      case agregarString:
                        Get.toNamed(AppRoutes.agregarEgresadoInfotep);
                        break;
                      case publicarString:
                        Get.toNamed(AppRoutes.publicarOferta,
                            arguments: VersionDePublicacion.infotep.name);
                        break;
                      case reportesString:
                        goToReportes();
                        break;
                      case cerrarSesionString:
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
            body: SafeArea(
              child: DefaultTabController(
                length: 2,
                child: SizedBox(
                  height: size.height,
                  width: size.width,
                  child: Column(
                    children: [
                      Expanded(
                        child: TabBarView(
                          children: [
                            ParteEgresados(
                                infotepController: infotepController),
                            ParteOfertas(infotepController: infotepController),
                          ],
                        ),
                      ),
                      const TabBar(
                        tabs: [
                          Text(
                            egresadosString,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            ofertasString,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class ParteEgresados extends StatelessWidget {
  const ParteEgresados({
    Key? key,
    required this.infotepController,
  }) : super(key: key);
  final InfotepController infotepController;

  @override
  Widget build(BuildContext context) {
    return edgeInsetsSafeArea(
      RefreshIndicator(
        onRefresh: () async {
          infotepController.init();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(children: [
            const SizedBox(height: 10),
            const Text(egresadosString),
            const SizedBox(height: 10),
            if (infotepController.listEgresados.isNotEmpty)
              ...infotepController.listEgresados
                  .map((e) => CardEgresado(
                        egresado: e,
                        version: 1,
                      ))
                  .toList(),
            if (infotepController.listEgresados.isEmpty)
              const Center(
                child: Text(noHayEgresadoString),
              )
          ]),
        ),
      ),
    );
  }
}

class ParteOfertas extends StatelessWidget {
  const ParteOfertas({
    Key? key,
    required this.infotepController,
  }) : super(key: key);
  final InfotepController infotepController;

  @override
  Widget build(BuildContext context) {
    return edgeInsetsSafeArea(
      RefreshIndicator(
        onRefresh: () async {
          infotepController.init();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(ofertasString),
                TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.publicarOferta,
                          arguments: VersionDePublicacion.infotep.name);
                    },
                    child: const Text(nuevaString)),
              ],
            ),
            const SizedBox(height: 10),
            if (infotepController.listOfertas.isNotEmpty)
              ...infotepController.listOfertas
                  .map((e) => CardOferta(
                        oferta: e,
                        version: 1,
                      ))
                  .toList(),
            if (infotepController.listOfertas.isEmpty)
              const Center(
                child: Text(noHayOfertasString),
              )
          ]),
        ),
      ),
    );
  }
}
