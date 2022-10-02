import 'package:evaproject/src/models/formacion_academica/formacion_academica_model.dart';
import 'package:floor/floor.dart';
import 'package:evaproject/src/models/egresado/egresado_model.dart';

@Entity(tableName: 'EgresadoReferenciasModel',
  foreignKeys: [
    ForeignKey(
      childColumns: ['cedulaId'],
      parentColumns: ['cedulaId'],
      entity: EgresadoModel,
    ),
    ForeignKey(
      childColumns: ['idFormacion'],
      parentColumns: ['idFormacion'],
      entity: FormacionAcademicaModel,
    ),
  ],)
class EgresadoFormacionesAcademicasModel {
  @ColumnInfo(name: 'cedulaId')
  final String cedulaId;
  @PrimaryKey(autoGenerate: false)
  @ColumnInfo(name: 'idFormacion')
  final String idFormacion;
  EgresadoFormacionesAcademicasModel({
    required this.cedulaId,
    required this.idFormacion,
  });
}
