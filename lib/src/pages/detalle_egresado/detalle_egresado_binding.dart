import 'package:evaproject/src/pages/detalle_egresado/detalle_egresado_controller.dart';
import 'package:get/get.dart';

class DetalleEgresadoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetalleEgresadoController());
  }
}