import 'package:evaproject/src/consts/consts.dart';
import 'package:evaproject/src/models/oferta/oferta_model.dart';
import 'package:evaproject/src/pages/login/login_controller.dart';
import 'package:evaproject/src/services/oferta_service.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class EmpresaController extends GetxController {
  List<OfertaModel> listOfertas = [];
  final OfertaService ofertaService = OfertaService();

  @override
  void onClose() {
    init();
    super.onClose();
  }

  Future<void> init() async {
    if (LoginController.to.userEmpresa != null) {
      listOfertas = await ofertaService.getMyOferts(
          rncId: LoginController.to.userEmpresa!.empresaModel.rncId);
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        update();
      });
    } else {
      huboUnETQISN();
    }
  }
}
