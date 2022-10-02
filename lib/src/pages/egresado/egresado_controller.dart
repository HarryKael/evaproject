import 'package:evaproject/src/consts/chars.dart';
import 'package:evaproject/src/consts/consts.dart';
import 'package:evaproject/src/models/experiencia_laboral/experiencia_laboral_model.dart';
import 'package:evaproject/src/models/formacion_academica/formacion_academica_model.dart';
import 'package:evaproject/src/models/referencia/referencia_model.dart';
import 'package:evaproject/src/pages/login/login_controller.dart';
import 'package:evaproject/src/services/egresado_service.dart';
import 'package:get/get.dart';

class EgresadoController extends GetxController {
  final EgresadoService egresadoService = EgresadoService();
  final List<FormacionAcademicaModel> listFormaciones = [];
  final List<ExperienciaLaboralModel> listExperiencias = [];
  final List<ReferenciaModel> listReferencias = [];

  Future<void> updateCurriculo({required String path}) async {
    final result = await egresadoService.updateCurriculo(
        path: path, id: LoginController.to.userEgresado!.egresadoModel.cedulaId);
    if (result) {
      LoginController.to.userEgresado!.egresadoModel.curriculo = path;
      update();
    } else {
      Get.showSnackbar(const GetSnackBar(
        title: appName,
        message: haOcurridoUnErrorIntenteloNuevamenteString,
      ));
    }
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }

  Future<void> init() async {

  }
}
