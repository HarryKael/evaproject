import 'package:evaproject/src/consts/consts.dart';
import 'package:evaproject/src/models/egresado/egresado_dao.dart';
import 'package:evaproject/src/models/egresado/egresado_model.dart';
import 'package:evaproject/src/models/empresa/empresa_dao.dart';
import 'package:evaproject/src/models/empresa/empresa_model.dart';
import 'package:evaproject/src/models/usuario_egresado/usuario_egresado_dao.dart';
import 'package:evaproject/src/models/usuario_egresado/usuario_egresado_model.dart';
import 'package:evaproject/src/models/usuario_empresa/usuario_empresa_dao.dart';
import 'package:evaproject/src/models/usuario_empresa/usuario_empresa_model.dart';

class LoginService {
  final UsuarioEgresadoDao usuarioEgresadoDao = database.getUsuarioEgresadoDao;
  final EgresadoDao egresadoDao = database.getEgresadoDao;
  final UsuarioEmpresaDao usuarioEmpresaDao = database.getUsuarioEmpresaDao;
  final EmpresaDao empresaDao = database.getEmpresaDao;

  Future<void> ifInfotepExist() async {
    
  }

  Future<UserEgresado?> ifEgresadoExist(
      {required String user, required String pass}) async {
    try {
      final UsuarioEgresadoModel? usuarioEgresadoModel =
          await usuarioEgresadoDao.getUsuarioEgresado(user, pass);
      if (usuarioEgresadoModel != null) {
        final EgresadoModel? egresadoModel =
            await egresadoDao.getEgresado(user);
        if (egresadoModel != null) {
          return UserEgresado(
              egresadoModel: egresadoModel,
              usuarioEgresadoModel: usuarioEgresadoModel);
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<UserEmpresa?> ifEmpresaExist(
      {required String user, required String pass}) async {
    try {
      final UsuarioEmpresaModel? usuarioEmpresaModel =
          await usuarioEmpresaDao.getUsuarioEmpresa(user, pass);
      if (usuarioEmpresaModel != null) {
        final EmpresaModel? empresaModel = await empresaDao.getEmpresa(user);
        if (empresaModel != null) {
          return UserEmpresa(
              empresaModel: empresaModel,
              usuarioEmpresaModel: usuarioEmpresaModel);
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
