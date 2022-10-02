import 'package:evaproject/src/pages/ofertas/ofertas_controller.dart';
import 'package:get/get.dart';

class OfertasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OfertasController());
  }
}