import 'package:evaproject/src/consts/chars.dart';
import 'package:evaproject/src/consts/consts.dart';
import 'package:evaproject/src/routes/app_routes.dart';
import 'package:evaproject/src/services/login_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  String typeLogin = loginAdminString;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final LoginService loginService = LoginService();

  static LoginController get to => Get.find<LoginController>();

  UserEmpresa? _userEmpresa;

  UserEmpresa? get userEmpresa => _userEmpresa;

  set userEmpresa(UserEmpresa? userEmpresa) {
    _userEmpresa = userEmpresa;
    update();
  }
    
  UserEgresado? _userEgresado;

  UserEgresado? get userEgresado => _userEgresado;

  set userEgresado(UserEgresado? userEgresado) {
    _userEgresado = userEgresado;
    update();
  }

  void usuarioIncorrecot() {
     Get.showSnackbar(const GetSnackBar(title: appName, message: usuarioOContrasenaIncorrectoString,));
  }

  void submit() async {
    if (formKey.currentState!.validate()) {
      switch (typeLogin) {
        case loginAdminString:
          if (userController.text == usuarioInfotep.idUsuario && passController.text == usuarioInfotep.password) {
            userController.clear();
            passController.clear();
            Get.offAllNamed(AppRoutes.infotep);
          } else {
           usuarioIncorrecot();
          }
          break;
        case loginEgresadoString:
          final result = await loginService.ifEgresadoExist(
              user: userController.text, pass: passController.text);
          if(result != null) {
            userEgresado = result;
            update();
            userController.clear();
            passController.clear();
            Get.offAllNamed(AppRoutes.egresado);
          } else {
           usuarioIncorrecot();
          }
          break;
        case loginEmpresaString:
          final result = await loginService.ifEmpresaExist(
              user: userController.text, pass: passController.text);
          if(result != null) {
            userEmpresa = result;
            update();
            userController.clear();
            passController.clear();
            Get.offAllNamed(AppRoutes.empresa);
          } else {
           usuarioIncorrecot();
          }
          break;
      }
    }
  }

  void changeTypeLogin(String v) {
    typeLogin = v;
    update();
  }
}
