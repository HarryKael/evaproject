import 'package:evaproject/src/consts/consts.dart';
import 'package:evaproject/src/models/empresa/empresa_dao.dart';
import 'package:evaproject/src/models/empresa/empresa_model.dart';
import 'package:evaproject/src/models/usuario_empresa/usuario_empresa_dao.dart';
import 'package:evaproject/src/models/usuario_empresa/usuario_empresa_model.dart';

class UsuarioEmpresaService {
  final EmpresaDao empresaDao = database.getEmpresaDao;
  final UsuarioEmpresaDao usuarioEmpresaDao = database.getUsuarioEmpresaDao;

  Future<bool> insertEmpresa({required EmpresaModel empresaModel, required UsuarioEmpresaModel usuarioEmpresaModel}) async {
    try {
      await empresaDao.insertEmpresa(empresaModel);
      await usuarioEmpresaDao.insertUsuarioEmpresa(usuarioEmpresaModel);
      return true;
    } catch(e) {
      print(e);
      return false;
    }
  }
}