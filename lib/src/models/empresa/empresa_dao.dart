import 'package:evaproject/src/models/empresa/empresa_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class EmpresaDao {
  @Query('SELECT * FROM EmpresaModel')
  Future<List<EmpresaModel>> getEgresados();

  @Query('SELECT * FROM EmpresaModel WHERE rncId = :id')
  Future<EmpresaModel?> getEmpresa(String id);

  @Insert()
  Future<void> insertEmpresa(EmpresaModel empresaModel);
}