import 'package:evaproject/src/consts/consts.dart';
import 'package:evaproject/src/models/egresado/egresado_dao.dart';
import 'package:evaproject/src/models/egresado/egresado_model.dart';
import 'package:evaproject/src/models/usuario_egresado/usuario_egresado_dao.dart';
import 'package:evaproject/src/models/usuario_egresado/usuario_egresado_model.dart';

class UsuarioEgresadoService {
  final EgresadoDao egresadoDao = database.getEgresadoDao;
  final UsuarioEgresadoDao usuarioEgresadoDao = database.getUsuarioEgresadoDao;

  Future<List<EgresadoModel>> getEgresados() async {
    return egresadoDao.getEgresados();
  }

  Future<bool> insertUserEgresado({
    required UsuarioEgresadoModel userEgresado,
    required EgresadoModel egresadoModel,
  }) async {
    do {
      try {
        await egresadoDao.insertEgresado(egresadoModel);
        await usuarioEgresadoDao.insertUsuarioEgresado(userEgresado);
        return true;
      } catch(e) {
        print(e);
        return false;
      }
    } while (false);
  }
}
