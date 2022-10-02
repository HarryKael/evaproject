import 'package:evaproject/src/pages/detalle_oferta/detalle_oferta_controller.dart';
import 'package:get/get.dart';

class DetalleOfertaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetalleOfertaController());
  }
}