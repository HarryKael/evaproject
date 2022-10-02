import 'package:evaproject/src/pages/publicar_oferta/publicar_oferta_controller.dart';
import 'package:get/get.dart';

class PublicarOfertaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PublicarOfertaController());
  }
}