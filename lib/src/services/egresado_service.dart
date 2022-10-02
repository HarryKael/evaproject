import 'package:evaproject/src/consts/consts.dart';
import 'package:evaproject/src/models/egresado/egresado_dao.dart';
import 'package:evaproject/src/models/egresado/egresado_model.dart';

class EgresadoService {
  final EgresadoDao egresadoDao = database.getEgresadoDao;

  Future<bool> aceptarEgresado(String cedulaId) async {
    try {
    await   egresadoDao.aceptarEgresado(cedulaId);
      return true;
    } catch(e) {
      print(e);
      return false;
    }
  }

  Future<int> getEgresadosNoDisponibles() async {
    final List<dynamic> d = await  egresadoDao.getEgresadosNoDisponibles();
    return d.length;
  }

    Future<int> getEgresadosDisponibles() async {
    final List<dynamic> d = await  egresadoDao.getEgresadosDisponibles();
    return d.length ;
  }

  Future<List<EgresadoModel>> getAplicantes({required String idOferta}) async {
    return egresadoDao.getAplicantes(idOferta);
  }
  
  Future<bool> updateCurriculo({required String path, required String id}) async {
    try {
      egresadoDao.updateCurriculo(path, id);
      return true;
    } catch(e) {
      print(e);
      return false;
    }
  }
}