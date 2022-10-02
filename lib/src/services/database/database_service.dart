import 'dart:async';
import 'package:evaproject/src/models/aplicacion/aplicacion_model.dart';
import 'package:evaproject/src/models/aplicacion/aplicacion_dao.dart';
import 'package:evaproject/src/models/egresado/egresado_dao.dart';
import 'package:evaproject/src/models/egresado_experiencias_labs/egresado_experiencias_labs_dao.dart';
import 'package:evaproject/src/models/egresado_experiencias_labs/egresado_experiencias_labs_model.dart';
import 'package:evaproject/src/models/egresado_formaciones_academicas/egresado_formaciones_academicas_dao.dart';
import 'package:evaproject/src/models/egresado_formaciones_academicas/egresado_formaciones_academicas_model.dart';
import 'package:evaproject/src/models/egresado_referencias/egresado_referencias_dao.dart';
import 'package:evaproject/src/models/egresado_referencias/egresado_referencias_model.dart';
import 'package:evaproject/src/models/empresa/empresa_dao.dart';
import 'package:evaproject/src/models/empresa_ofertas/empresa_ofertas_dao.dart';
import 'package:evaproject/src/models/experiencia_laboral/experiencia_laboral_dao.dart';
import 'package:evaproject/src/models/formacion_academica/formacion_academica_dao.dart';
import 'package:evaproject/src/models/oferta/oferta_dao.dart';
import 'package:evaproject/src/models/ofertas_aplicaciones/ofertas_aplicacion_dao.dart';
import 'package:evaproject/src/models/referencia/referencia_dao.dart';
import 'package:evaproject/src/models/egresado/egresado_model.dart';
import 'package:evaproject/src/models/empresa/empresa_model.dart';
import 'package:evaproject/src/models/empresa_ofertas/empresa_ofertas_model.dart';
import 'package:evaproject/src/models/experiencia_laboral/experiencia_laboral_model.dart';
import 'package:evaproject/src/models/formacion_academica/formacion_academica_model.dart';
import 'package:evaproject/src/models/oferta/oferta_model.dart';
import 'package:evaproject/src/models/ofertas_aplicaciones/ofertas_aplicaciones_model.dart';
import 'package:evaproject/src/models/referencia/referencia_model.dart';
import 'package:evaproject/src/models/usuario_egresado/usuario_egresado_dao.dart';
import 'package:evaproject/src/models/usuario_egresado/usuario_egresado_model.dart';
import 'package:evaproject/src/models/usuario_empresa/usuario_empresa_dao.dart';
import 'package:evaproject/src/models/usuario_empresa/usuario_empresa_model.dart';
import 'package:floor/floor.dart';
// ignore: depend_on_referenced_packages
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database_service.g.dart'; // the generated code will be there

@Database(version: 1, entities: [
  AplicacionModel,
  EgresadoModel,
  EmpresaModel,
  EmpresaOfertasModel,
  ExperienciaLaboralModel,
  FormacionAcademicaModel,
  OfertaModel,
  OfertasAplicacionesModel,
  ReferenciaModel,
  UsuarioEgresadoModel,
  UsuarioEmpresaModel,
  EgresadoReferenciasModel,
  EgresadoFormacionesAcademicasModel,
  EgresadoExperienciasLabsModel,
  ])
abstract class AppDatabase extends FloorDatabase {
  AplicacionDao get getAplicacionDao;
  EgresadoDao get getEgresadoDao;
  EmpresaDao get getEmpresaDao;
  EmpresaOfertasDao get getEmpresaOfertasDao;
  ExperienciaLaboralDao get getExperienciaLaboralDao;
  FormacionAcademicaDao get getFormacionAcademicaDao;
  OfertaDao get getOfertaDao;
  OfertasAplicacionesDao get getOfertasAplicacionesDao;
  ReferenciaDao get getReferenciaDao;
  UsuarioEgresadoDao get getUsuarioEgresadoDao;
  UsuarioEmpresaDao get getUsuarioEmpresaDao;
  EgresadoReferenciasDao get getEgresadoReferenciasDao;
  EgresadoFormacionesAcademicasDao get getEgresadoFormacionesAcademicasDao;
  EgresadoExperienciasLabsDao get getEgresadoExperienciasLabsDao;
}
