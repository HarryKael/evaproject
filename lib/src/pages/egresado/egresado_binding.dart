import 'package:evaproject/src/pages/egresado/egresado_controller.dart';
import 'package:get/get.dart';

class EgresadoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EgresadoController());
  }
}