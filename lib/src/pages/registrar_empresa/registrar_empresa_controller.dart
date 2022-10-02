import 'package:evaproject/src/models/empresa/empresa_model.dart';
import 'package:evaproject/src/models/usuario_empresa/usuario_empresa_model.dart';
import 'package:evaproject/src/services/usuario_empresa_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegistrarEmpresaController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController rncCtr = TextEditingController();
  final FocusNode rncNode = FocusNode();
  final TextEditingController nombreComercialCtr = TextEditingController();
  final FocusNode nombreComercialNode = FocusNode();
  final TextEditingController passCtr = TextEditingController();
  final FocusNode passNode = FocusNode();
  final TextEditingController direccionCtr = TextEditingController();
  final FocusNode direccionNode = FocusNode();
  final TextEditingController telefonoCtr = TextEditingController();
  final FocusNode telefonoNode = FocusNode();
  final TextEditingController emailCtr = TextEditingController();
  final FocusNode emailNode = FocusNode();
  final TextEditingController webCtr = TextEditingController();
  final FocusNode webNode = FocusNode();
  final TextEditingController nombreContactoCtr = TextEditingController();
  final FocusNode nombreContactoNode = FocusNode();
  final TextEditingController emailContactoCtr = TextEditingController();
  final FocusNode emailContactoNode = FocusNode();

  @override
  void onClose() {
    rncCtr.dispose();
    rncNode.dispose();
    nombreComercialCtr.dispose();
    nombreComercialNode.dispose();
    passCtr.dispose();
    passNode.dispose();
    direccionCtr.dispose();
    direccionNode.dispose();
    telefonoCtr.dispose();
    telefonoNode.dispose();
    emailCtr.dispose();
    emailNode.dispose();
    webCtr.dispose();
    webNode.dispose();
    nombreContactoCtr.dispose();
    nombreContactoNode.dispose();
    emailContactoCtr.dispose();
    emailContactoNode.dispose();
    super.onClose();
  }

  Future<void> onSubmit() async {
    if (formKey.currentState!.validate()) {
      final UsuarioEmpresaModel usuarioEmpresaModel = UsuarioEmpresaModel(
        idUsuario: rncCtr.text,
        password: passCtr.text,
      );
      final EmpresaModel empresaModel = EmpresaModel(
        rncId: rncCtr.text,
        nombreComercial: nombreComercialCtr.text,
        direccion: direccionCtr.text,
        telefono: telefonoCtr.text,
        email: emailCtr.text,
        web: webCtr.text,
        nombreContacto: nombreContactoCtr.text,
        emailContacto: emailContactoCtr.text,
      );
      final UsuarioEmpresaService usuarioEmpresaService = UsuarioEmpresaService();
      final bool result = await usuarioEmpresaService.insertEmpresa(empresaModel: empresaModel, usuarioEmpresaModel: usuarioEmpresaModel);
      print(result);
      if(result) {
        Get.back();
      }
    }
  }
}
