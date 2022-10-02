import 'package:evaproject/src/pages/empresa/empresa_controller.dart';
import 'package:get/get.dart';

class EmpresaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmpresaController());
  }
}