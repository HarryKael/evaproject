import 'package:evaproject/src/consts/chars.dart';
import 'package:evaproject/src/consts/consts.dart';
import 'package:evaproject/src/pages/reportes/reportes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportesPage extends StatelessWidget {
  const ReportesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(reportesString),),
      body: GetBuilder<ReportesController>(
        init: ReportesController(),
        builder: (registroController) {
          final size = MediaQuery.of(context).size;
          return RefreshIndicator(
            onRefresh: () async {
              registroController.init();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: edgeInsetsSafeArea(
                SizedBox(height: size.height, width: size.width, child: SingleChildScrollView(
                  child: Column(children: [
                    ListTile(
                      title: const Text(cantidadDeOfertasDeEmpleosPublicadasString),
                      trailing: Text(registroController.cantidadOfertas.toString()),
                    ),
                    ListTile(
                      title: const Text(egresadosContratadosString),
                      trailing: Text(registroController.egresadosContratados.toString()),
                    ),
                const    ListTile(
                      title:  Text(egresadosPorStatusString),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Text(desempleadosString),
                            Text(registroController.egresadosDesempleados.toString()),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(empleadosString),
                            Text(registroController.egresadosEmpleados.toString()),
                          ],
                        ),
                      ],
                    )
                  ],),
                ),),
              ),
            ),
          );
        }
      ),
    );
  }
}