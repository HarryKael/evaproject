import 'package:evaproject/src/pages/infotep/infotep_controller.dart';
import 'package:get/get.dart';

class InfotepBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InfotepController());
  }
}