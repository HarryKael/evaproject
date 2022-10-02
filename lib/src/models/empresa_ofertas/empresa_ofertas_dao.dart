import 'package:evaproject/src/models/empresa_ofertas/empresa_ofertas_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class EmpresaOfertasDao {
  @Query("INSERT INTO empresa_ofertas ('rncId', 'idOferta') VALUES (:rncId, :idOferta)")
  Future<void> insertOferta(String rncId, String idOferta);

  @Query('SELECT * FROM empresa_ofertas WHERE rncId = :id')
  Future<List<EmpresaOfertasModel>> getEmpresaOfertas(String id);

  @Query('SELECT * FROM empresa_ofertas WHERE idOferta = :id')
  Future<EmpresaOfertasModel?> getEmpresaOfertasByOferta(String id);
  
}