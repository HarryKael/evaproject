import 'package:evaproject/src/consts/chars.dart';
import 'package:evaproject/src/consts/consts.dart';
import 'package:evaproject/src/models/egresado/egresado_model.dart';
import 'package:evaproject/src/models/usuario_egresado/usuario_egresado_model.dart';
import 'package:evaproject/src/routes/app_routes.dart';
import 'package:evaproject/src/services/usuario_egresado_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AgregarEgresadoInfotepController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController contrasenaCtr = TextEditingController();
  final TextEditingController cedulaCtr = TextEditingController();
  final TextEditingController nombreCtr = TextEditingController();
  final TextEditingController estaturaCtr = TextEditingController();
  final TextEditingController edadCtr = TextEditingController();
  final List<String> listEstadoCivil = [solteroString, casadoString];
  late String estadoCivilValue = listEstadoCivil.first;
  final List<String> listSex = [masculinoString, femeninoString];
  String sexValue = masculinoString;
  final TextEditingController correoCtr = TextEditingController();
  RxBool licenciaDeConducir = false.obs;
  final List<String> listNivelEducativo = [
    bachillerString,
    tecnicoString,
    universitarioString
  ];
  String nivelEducativoValue = bachillerString;
  final RxBool vehiculoPropio = false.obs;
  final TextEditingController telefonoCelularCtr = TextEditingController();
  final TextEditingController telefonoResidenciaCtr = TextEditingController();
  final TextEditingController otroCtr = TextEditingController();
  final FocusNode contrasenaNode = FocusNode();
  final FocusNode cedulaNode = FocusNode();
  final FocusNode nombreNode = FocusNode();
  final FocusNode estaturaNode = FocusNode();
  final FocusNode edadNode = FocusNode();
  final FocusNode correoNode = FocusNode();
  final FocusNode telefonoCelularNode = FocusNode();
  final FocusNode telefonoResidenciaNode = FocusNode();
  final FocusNode otroNode = FocusNode();
  String? fechaNacimiento;
  RxString curriculo = ''.obs;

  @override
  void onClose() {
    contrasenaCtr.dispose();
    cedulaCtr.dispose();
    nombreCtr.dispose();
    estaturaCtr.dispose();
    edadCtr.dispose();
    correoCtr.dispose();
    telefonoCelularCtr.dispose();
    telefonoResidenciaCtr.dispose();
    contrasenaNode.dispose();
    cedulaNode.dispose();
    nombreNode.dispose();
    estaturaNode.dispose();
    edadNode.dispose();
    correoNode.dispose();
    telefonoCelularNode.dispose();
    telefonoResidenciaNode.dispose();
    otroNode.dispose();
    super.onClose();
  }

  void onChangeLicencia(bool value) {
    licenciaDeConducir.value = value;
    update();
  }

  void onChangeVehiculoPropio(bool value) {
    vehiculoPropio.value = value;
    update();
  }

  void onChangeEstadoCivil(String value) {
    estadoCivilValue = value;
    update();
  }

  void onChangeSex(String value) {
    sexValue = value;
    update();
  }

  void onChangeNivelEducativo(String value) {
    nivelEducativoValue = value;
    update();
  }

  void onChangedFecha(String value) {
    fechaNacimiento = value;
    update();
  }

  void onSubmit() async {
    if (formKey.currentState!.validate() && fechaNacimiento != null) {
      final UsuarioEgresadoModel usuarioEgresadoModel = UsuarioEgresadoModel(
        idUsuario: cedulaCtr.text,
        password: contrasenaCtr.text,
      );
      final EgresadoModel egresadoModel = EgresadoModel(
        cedulaId: cedulaCtr.text,
        nombreYApellido: nombreCtr.text,
        estatura: double.tryParse(estaturaCtr.text),
        edad: int.tryParse(edadCtr.text) ?? 00,
        estadoCivil: estadoCivilValue,
        sexo: sexValue,
        correo: correoCtr.text,
        nivelEducativo: nivelEducativoValue,
        licenciaDeConducir: licenciaDeConducir.value,
        vehiculoPropio: vehiculoPropio.value,
        fechaNacimiento: fechaNacimiento!,
        telefonoCelular: telefonoCelularCtr.text,
        telefonoResidencia: telefonoResidenciaCtr.text.isEmpty
            ? null
            : telefonoResidenciaCtr.text,
        otro: otroCtr.text.isEmpty ? null : otroCtr.text,
        disponibilidad: true,
      );
      final UsuarioEgresadoService usuarioEgresadoService = UsuarioEgresadoService();
      final result = await usuarioEgresadoService.insertUserEgresado(userEgresado: usuarioEgresadoModel, egresadoModel: egresadoModel);
      if(result){
        Get.showSnackbar(const GetSnackBar(title: appName, message: seHaEnviadoElCorreoAutomaticamenteString));
        Get.offAllNamed(AppRoutes.infotep);
      }
    }
  }
}
