import 'package:evaproject/src/models/egresado/egresado_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class EgresadoDao {
  @Query('SELECT * FROM egresado')
  Future<List<EgresadoModel>> getEgresados();
  
  @Query('UPDATE egresado SET disponibilidad = false WHERE cedulaId = :id')
  Future<void> aceptarEgresado(String id);

  @Query("UPDATE egresado SET curriculo = :path WHERE cedulaId = :id")
  Future<void> updateCurriculo(String path, String id);

  // @Query("SELECT COUNT(*) FROM egresado WHERE disponibilidad = 0")
  @Query("SELECT * FROM egresado WHERE disponibilidad = 0")
  Future<List<EgresadoModel>> getEgresadosNoDisponibles();
  
  // @Query("SELECT COUNT(*) FROM egresado WHERE disponibilidad = 1")
  @Query("SELECT * FROM egresado WHERE disponibilidad = 1")
  Future<List<EgresadoModel>> getEgresadosDisponibles();

  @Query('SELECT * FROM egresado WHERE cedulaId = :id')
  Future<EgresadoModel?> getEgresado(String id);

  @Query('SELECT * FROM egresado as egre INNER JOIN aplicacion AS ap ON ap.cedulaId = egre.cedulaId INNER JOIN ofertas_aplicaciones as of ON of.idOferta = :idOferta WHERE of.idAplicacion = ap.idAplicacion')
  Future<List<EgresadoModel>> getAplicantes(String idOferta);

  @Insert()
  Future<void> insertEgresado(EgresadoModel egresadoModel);
}