import 'package:evaproject/src/models/oferta/oferta_model.dart';
import 'package:evaproject/src/services/oferta_service.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class OfertasController extends GetxController {
  List<OfertaModel> listOfertas = [];
  final OfertaService ofertaService = OfertaService();

  Future<void> init() async {
    listOfertas = await ofertaService.getAllOferts();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {update();});
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
  
}