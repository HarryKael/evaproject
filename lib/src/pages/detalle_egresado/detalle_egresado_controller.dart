import 'package:evaproject/src/consts/chars.dart';
import 'package:evaproject/src/consts/consts.dart';
import 'package:evaproject/src/routes/app_routes.dart';
import 'package:evaproject/src/services/egresado_service.dart';
import 'package:evaproject/src/services/oferta_service.dart';
import 'package:get/get.dart';

class DetalleEgresadoController extends GetxController {
  final EgresadoService egresadoService = EgresadoService();
  final OfertaService ofertaService = OfertaService();
  bool aceptado = false;

  Future<void> aceptar({required String idOferta, required String cedulaId}) async {
    final result = await egresadoService.aceptarEgresado(cedulaId);
    if(result) {
      final result2 = await ofertaService.aceptarEgresado(idOferta);
      if(result2) {
        Get.offAllNamed(AppRoutes.empresa);
        Get.showSnackbar(const GetSnackBar(title: appName, message: haSidoAceptadoCorrectamenteString,));
      }
    }

  }
}