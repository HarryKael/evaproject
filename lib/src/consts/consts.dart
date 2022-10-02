// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evaproject/src/consts/chars.dart';
import 'package:evaproject/src/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:evaproject/src/models/egresado/egresado_model.dart';
import 'package:evaproject/src/models/empresa/empresa_model.dart';
import 'package:evaproject/src/models/usuario_egresado/usuario_egresado_model.dart';
import 'package:evaproject/src/models/usuario_empresa/usuario_empresa_model.dart';
import 'package:evaproject/src/services/database/database_service.dart';
import 'package:get/get.dart';

enum VersionDePublicacion {infotep, empresa}

const String appName = 'INFOTEP';
late AppDatabase database;

class UserEgresado {
  EgresadoModel egresadoModel;
  UsuarioEgresadoModel usuarioEgresadoModel;
  UserEgresado({
    required this.egresadoModel,
    required this.usuarioEgresadoModel,
  });
}

class UserEmpresa {
  EmpresaModel empresaModel;
  UsuarioEmpresaModel usuarioEmpresaModel;
  UserEmpresa({
    required this.empresaModel,
    required this.usuarioEmpresaModel,
  });
}

Future<void> initConst() async {
  database = await $FloorAppDatabase.databaseBuilder('database').build();
}

final UsuarioEmpresaModel usuarioInfotep =
    UsuarioEmpresaModel(idUsuario: 'infotep', password: 'password');

Widget edgeInsetsSafeArea(Widget child) {
  return SafeArea(
      minimum: const EdgeInsets.symmetric(horizontal: 15), child: child);
}

Future<void> huboUnETQISN() async {
  Get.showSnackbar(const GetSnackBar(
    title: appName,
    message: huboUnErrorTieneQueIniciarSesionNuevamenteString,
  ));
}

void goToReportes() {
  Get.toNamed(AppRoutes.reportes);
}