import 'package:evaproject/src/consts/chars.dart';
import 'package:evaproject/src/consts/consts.dart';
import 'package:evaproject/src/models/oferta/oferta_model.dart';
import 'package:evaproject/src/pages/login/login_controller.dart';
import 'package:evaproject/src/services/oferta_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PublicarOfertaController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController posicionCtr = TextEditingController();
  final FocusNode posicionNode = FocusNode();
  TimeOfDay? abre;
  TimeOfDay? cierra;
  final TextEditingController beneficiosCtr = TextEditingController();
  final FocusNode beneficiosNode = FocusNode();
  final TextEditingController salarioCtr = TextEditingController();
  final FocusNode salarioNode = FocusNode();
  final TextEditingController ubicacionCtr = TextEditingController();
  final FocusNode ubicacionNode = FocusNode();

  @override
  void onClose() {
    posicionCtr.dispose();
    posicionNode.dispose();
    beneficiosCtr.dispose();
    beneficiosNode.dispose();
    salarioCtr.dispose();
    salarioNode.dispose();
    ubicacionCtr.dispose();
    ubicacionNode.dispose();
    super.onClose();
  }

  void onChangeAbre(TimeOfDay value) {
    abre = value;
    update();
  }

  void onChangeCierra(TimeOfDay value) {
    cierra = value;
    update();
  }

  Future<void> onSubmit() async {
    if (formKey.currentState!.validate() && cierra != null && abre != null) {
      final OfertaModel ofertaModel = OfertaModel(
        idOferta: DateTime.now().toString(),
        posicion: posicionCtr.text,
        fechaPub: DateTime.now().toString(),
        abre:
            '${abre!.hour.toString()}:${abre!.minute.toString()} ${abre!.period.name}',
        cierra:
            '${cierra!.hour.toString()}:${cierra!.minute.toString()} ${cierra!.period.name}',
        beneficios: beneficiosCtr.text,
        salario: double.tryParse(salarioCtr.text) ?? 0,
        ubicacion: ubicacionCtr.text,
        abierto: true,
        versionPublicacion: Get.arguments,
      );
      final OfertaService ofertaService = OfertaService();
      if (Get.arguments == VersionDePublicacion.infotep.name) {
        final result = await ofertaService.insertOferta(
          ofertaModel: ofertaModel,
          rncId: 'infotep',
        );
        if (result) {
          Get.back();
          Get.showSnackbar(const GetSnackBar(
            title: appName,
            message: seHaPublicadoCorrectamenteString,
          ));
        }
      } else {
        if (LoginController.to.userEmpresa != null) {
          final result = await ofertaService.insertOferta(
            ofertaModel: ofertaModel,
            rncId: LoginController.to.userEmpresa!.empresaModel.rncId,
          );
          if (result) {
            Get.back();
            Get.showSnackbar(const GetSnackBar(
              title: appName,
              message: seHaPublicadoCorrectamenteString,
            ));
          }
        } else {
          huboUnETQISN();
        }
      }
    }
  }
}
