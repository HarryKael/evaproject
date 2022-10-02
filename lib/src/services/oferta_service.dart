import 'package:evaproject/src/consts/consts.dart';
import 'package:evaproject/src/models/empresa_ofertas/empresa_ofertas_dao.dart';
import 'package:evaproject/src/models/empresa_ofertas/empresa_ofertas_model.dart';
import 'package:evaproject/src/models/oferta/oferta_dao.dart';
import 'package:evaproject/src/models/oferta/oferta_model.dart';

class OfertaService {
  final EmpresaOfertasDao empresaOfertasDao = database.getEmpresaOfertasDao;
  final OfertaDao ofertaDao = database.getOfertaDao;

  Future<List<OfertaModel>> getMyOferts({required String rncId}) async {
    final result = await empresaOfertasDao.getEmpresaOfertas(rncId);
    List<OfertaModel> listOfertas = [];
    if(result.isNotEmpty) {
      for (EmpresaOfertasModel empresaOfertasModel in result) {
        final resultOferta = await ofertaDao.getOferta(empresaOfertasModel.idOferta);
        if(resultOferta != null) {
          listOfertas.add(resultOferta);
        }
      }
      return listOfertas;
    }
    return [];
  }

  Future<bool> aceptarEgresado(String idOferta) async {
    try {
      await ofertaDao.aceptarEgresado(idOferta);
      return true;
    } catch(e) {
      print(e);
      return false;
    }
  }

  Future<List<OfertaModel>> getAllOferts() async {
    final list = await ofertaDao.getAllOferts();
    return list;
  }

  Future<int> getCantOfertasPublicadas() async {
    final List<OfertaModel> list = await ofertaDao.getAllOferts();
    return list.length;
  }

  Future<bool> insertOferta(
      {required OfertaModel ofertaModel, required String rncId}) async {
    try {
      await ofertaDao.insertOferta(
        ofertaModel.idOferta,
        ofertaModel.posicion,
        ofertaModel.fechaPub,
        ofertaModel.abre,
        ofertaModel.cierra,
        ofertaModel.beneficios,
        ofertaModel.salario,
        ofertaModel.ubicacion,
        ofertaModel.abierto,
        ofertaModel.versionPublicacion,
      );
      await empresaOfertasDao.insertOferta(rncId, ofertaModel.idOferta);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
    return false;
  }
}
