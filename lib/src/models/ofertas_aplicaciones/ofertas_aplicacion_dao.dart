import 'package:evaproject/src/models/ofertas_aplicaciones/ofertas_aplicaciones_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class OfertasAplicacionesDao {
  @Insert()
  Future<void> insertOfertasApliciones(OfertasAplicacionesModel ofertasAplicacionesModel);

  @Query('SELECT * FROM ofertas_aplicaciones AS of INNER JOIN aplicacion as ap ON ap.idAplicacion = of.idAplicacion WHERE idOferta = :idOferta AND ap.cedulaId = :cedulaId')
  Future<List<OfertasAplicacionesModel>> getOfertasAplicacionesModelByIdOferta(String idOferta, String cedulaId);
}