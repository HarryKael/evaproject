
import 'package:evaproject/src/models/usuario_egresado/usuario_egresado_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class UsuarioEgresadoDao {
  @Query('SELECT * FROM UsuarioEgresadoModel')
  Future<List<UsuarioEgresadoModel>> getAllUsuariosEgresados();

  @Query('SELECT * FROM UsuarioEgresadoModel WHERE idUsuario = :idUsuario AND password = :password')
  Future<UsuarioEgresadoModel?> getUsuarioEgresado(String idUsuario, String password);

  @Insert()
  Future<void> insertUsuarioEgresado(UsuarioEgresadoModel userEgresado);
}