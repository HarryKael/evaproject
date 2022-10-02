import 'package:evaproject/src/consts/chars.dart';
import 'package:evaproject/src/consts/components.dart';
import 'package:evaproject/src/consts/consts.dart';
import 'package:evaproject/src/pages/ofertas/ofertas_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfertasPage extends StatelessWidget {
  const OfertasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OfertasController>(
        init: OfertasController(),
        builder: (ofertasController) {
          final size = MediaQuery.of(context).size;
          return Scaffold(
            appBar: AppBar(title: const Text(ofertasString)),
            body: edgeInsetsSafeArea(
              RefreshIndicator(
                onRefresh: () async {
                  await ofertasController.init();
                },
                child: SizedBox(
                  height: size.height,
                  width: size.width,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        if (ofertasController.listOfertas.isEmpty)
                          SizedBox(
                  height: size.height,
                            child: const Center(
                              child: Text(noHayOfertasString),
                            ),
                          ),
                        if (ofertasController.listOfertas.isNotEmpty)
                          ...ofertasController.listOfertas
                              .map(
                                (e) => Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: CardOferta(oferta: e, version: 1),
                                ),
                              )
                              .toList(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
