import 'package:evaproject/src/models/oferta/oferta_model.dart';
import 'package:floor/floor.dart';




@dao
abstract class OfertaDao {
  @Query("INSERT INTO OfertaModel ('idOferta', 'posicion', 'fechaPub', 'abre', 'cierra', 'beneficios', 'salario', 'ubicacion', 'abierto', 'versionPublicacion') VALUES (:idOferta, :posicion, :fechaPub, :abre, :cierra, :beneficios, :salario, :ubicacion, :abierto, :versionPublicacion)")
  Future<void> insertOferta(String idOferta, String posicion, String fechaPub, String abre, String cierra, String beneficios, double salario, String ubicacion, bool abierto, String versionPublicacion);
  
    @Query('UPDATE OfertaModel SET abierto = false WHERE idOferta = :id')
  Future<void> aceptarEgresado(String id);

  @Query('SELECT * FROM OfertaModel WHERE idOferta = :id')
  Future<OfertaModel?> getOferta(String id);

  @Query('SELECT * FROM OfertaModel')
  Future<List<OfertaModel>> getAllOferts();
}