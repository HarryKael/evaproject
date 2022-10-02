import 'package:evaproject/src/consts/consts.dart';
import 'package:evaproject/src/models/aplicacion/aplicacion_model.dart';
import 'package:evaproject/src/models/egresado/egresado_model.dart';
import 'package:evaproject/src/models/empresa/empresa_model.dart';
import 'package:evaproject/src/pages/login/login_controller.dart';
import 'package:evaproject/src/services/aplicacion_service.dart';
import 'package:evaproject/src/services/egresado_service.dart';
import 'package:evaproject/src/services/empresa_service.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class DetalleOfertaController extends GetxController {
  EmpresaModel? empresaOfertante;
  final EmpresaService empresaService = EmpresaService();
  final AplicacionService aplicacionService = AplicacionService();
  final EgresadoService egresadoService = EgresadoService();
  List<EgresadoModel> listAplicantes = [];
  bool aplicado = false;

  @override
  void onInit() {
    init(idOferta: Get.arguments.idOferta);
    super.onInit();
  }

  Future<void> init({required String idOferta}) async {
    aplicado = false;
    update();
    if (LoginController.to.userEgresado != null) {
      empresaOfertante =
          await empresaService.getEmpresaByOferta(idOferta: idOferta);
      aplicado = await aplicacionService.yaAplicado(
          idOferta: idOferta,
          cedulaId: LoginController.to.userEgresado!.egresadoModel.cedulaId);
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        update();
      });
    } else {
      if (LoginController.to.userEmpresa != null) {
        listAplicantes =
            await egresadoService.getAplicantes(idOferta: idOferta);
        SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
          update();
        });
      } else {
        SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
          huboUnETQISN();
        });
      }
    }
  }

  Future<void> aplicar({required String idOferta}) async {
    final AplicacionModel aplicacionModel = AplicacionModel(
      idAplicacion: DateTime.now().toString(),
      cedulaId: LoginController.to.userEgresado!.egresadoModel.cedulaId,
      fechaAplicion: DateTime.now().toString(),
    );
    final result = await aplicacionService.aplicar(
        aplicacionModel: aplicacionModel, idOferta: idOferta);
    if (result) {
      aplicado = true;
      update();
    }
  }
}
