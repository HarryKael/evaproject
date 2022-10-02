
import 'package:evaproject/src/models/usuario_empresa/usuario_empresa_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class UsuarioEmpresaDao {
  @Query('SELECT * FROM UsuarioEmpresaModel')
  Future<List<UsuarioEmpresaModel>> getAllUsuariosEmpresa();

  @Query('SELECT * FROM UsuarioEmpresaModel WHERE idUsuario = :idUsuario AND password = :password')
  Future<UsuarioEmpresaModel?> getUsuarioEmpresa(String idUsuario, String password);

  @Insert()
  Future<void> insertUsuarioEmpresa(UsuarioEmpresaModel userEgresado);
}