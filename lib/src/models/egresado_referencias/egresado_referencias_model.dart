
import 'package:floor/floor.dart';
import 'package:evaproject/src/models/egresado/egresado_model.dart';
import 'package:evaproject/src/models/referencia/referencia_model.dart';

@Entity(tableName: 'EgresadoReferenciasModel',
  foreignKeys: [
    ForeignKey(
      childColumns: ['cedulaId'],
      parentColumns: ['cedulaId'],
      entity: EgresadoModel,
    ),
    ForeignKey(
      childColumns: ['idReferencia'],
      parentColumns: ['idReferencia'],
      entity: ReferenciaModel,
    ),
  ],)
class EgresadoReferenciasModel {
  @ColumnInfo(name: 'cedulaId')
  final String cedulaId;
  @PrimaryKey(autoGenerate: false)
  @ColumnInfo(name: 'idReferencia')
  final String idReferencia;
  EgresadoReferenciasModel({
    required this.cedulaId,
    required this.idReferencia,
  });
}


