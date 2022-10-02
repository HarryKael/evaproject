import 'package:evaproject/src/consts/consts.dart';
import 'package:evaproject/src/models/aplicacion/aplicacion_dao.dart';
import 'package:evaproject/src/models/aplicacion/aplicacion_model.dart';
import 'package:evaproject/src/models/ofertas_aplicaciones/ofertas_aplicacion_dao.dart';
import 'package:evaproject/src/models/ofertas_aplicaciones/ofertas_aplicaciones_model.dart';

class AplicacionService {
  final AplicacionDao aplicacionDao = database.getAplicacionDao;
  final OfertasAplicacionesDao ofertasAplicacionesDao =
      database.getOfertasAplicacionesDao;

  Future<bool> aplicar(
      {required AplicacionModel aplicacionModel,
      required String idOferta}) async {
    try {
      await aplicacionDao.insertAplicacion(aplicacionModel);
      await ofertasAplicacionesDao.insertOfertasApliciones(
        OfertasAplicacionesModel(
          idOferta: idOferta,
          idAplicacion: aplicacionModel.idAplicacion,
        ),
      );
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> yaAplicado(
      {required String idOferta, required String cedulaId}) async {
    try {
      final List<OfertasAplicacionesModel> result = await ofertasAplicacionesDao
          .getOfertasAplicacionesModelByIdOferta(idOferta, cedulaId);
          print(result);
      if (result != null) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
