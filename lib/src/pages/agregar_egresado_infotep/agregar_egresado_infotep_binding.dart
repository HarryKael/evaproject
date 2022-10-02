import 'package:evaproject/src/pages/agregar_egresado_infotep/agregar_egresado_infotep_controller.dart';
import 'package:get/get.dart';

class AgregarEgresadoInfotepBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AgregarEgresadoInfotepController());
  }
}