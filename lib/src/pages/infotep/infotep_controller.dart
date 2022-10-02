import 'package:evaproject/src/models/egresado/egresado_model.dart';
import 'package:evaproject/src/models/oferta/oferta_model.dart';
import 'package:evaproject/src/services/oferta_service.dart';
import 'package:evaproject/src/services/usuario_egresado_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class InfotepController extends GetxController {
  List<EgresadoModel> listEgresados = [];
  List<OfertaModel> listOfertas = [];
  final UsuarioEgresadoService usuarioEgresadoService = UsuarioEgresadoService();
  final OfertaService ofertaService = OfertaService();

  Future<void> init() async {
    listEgresados = await usuarioEgresadoService.getEgresados();
    listOfertas = await ofertaService.getAllOferts();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      update();
    });
  }

  @override
  void onInit() async {
    init();
    super.onInit();
  }
}