import 'package:evaproject/src/pages/reportes/reportes_controller.dart';
import 'package:get/get.dart';

class ReportesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReportesController());
  }
}