import 'package:evaproject/src/models/aplicacion/aplicacion_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class AplicacionDao {
  @Insert()
  Future<void> insertAplicacion(AplicacionModel aplicationModel);
}