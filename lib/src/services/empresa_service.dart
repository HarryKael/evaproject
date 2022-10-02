import 'package:evaproject/src/consts/consts.dart';
import 'package:evaproject/src/models/empresa/empresa_dao.dart';
import 'package:evaproject/src/models/empresa/empresa_model.dart';
import 'package:evaproject/src/models/empresa_ofertas/empresa_ofertas_dao.dart';

class EmpresaService {
  final EmpresaDao empresaDao = database.getEmpresaDao;
  final EmpresaOfertasDao empresaOfertasDao = database.getEmpresaOfertasDao;

  Future<EmpresaModel?> getEmpresaByOferta({required String idOferta}) async {
    try {
      final result =
          await empresaOfertasDao.getEmpresaOfertasByOferta(idOferta);
      if (result != null) {
        final resultEmpresa = await empresaDao.getEmpresa(result.rncId);
        if (resultEmpresa != null) {
          return resultEmpresa;
        }
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
