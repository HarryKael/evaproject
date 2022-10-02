import 'package:evaproject/src/services/egresado_service.dart';
import 'package:evaproject/src/services/oferta_service.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class ReportesController extends GetxController {
  final OfertaService ofertaService = OfertaService();
  final EgresadoService egresadoService = EgresadoService();
  int cantidadOfertas = 0;
  int egresadosContratados = 0;
  int egresadosEmpleados = 0;
  int egresadosDesempleados = 0;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  Future<void> init() async {
    cantidadOfertas = await ofertaService.getCantOfertasPublicadas();
    egresadosContratados = await egresadoService.getEgresadosNoDisponibles();
    egresadosDesempleados = await egresadoService.getEgresadosDisponibles();
    egresadosEmpleados = await egresadoService.getEgresadosNoDisponibles();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      update();
    });
  }
}
