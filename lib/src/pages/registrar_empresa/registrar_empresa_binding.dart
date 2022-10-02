import 'package:evaproject/src/pages/registrar_empresa/registrar_empresa_controller.dart';
import 'package:get/get.dart';

class RegistrarEmpresaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegistrarEmpresaController());
  }
}