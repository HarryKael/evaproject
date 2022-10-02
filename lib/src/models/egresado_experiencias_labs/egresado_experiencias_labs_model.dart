
import 'package:evaproject/src/models/experiencia_laboral/experiencia_laboral_model.dart';
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
      childColumns: ['idExperienciaLaboral'],
      parentColumns: ['idExperienciaLaboral'],
      entity: ExperienciaLaboralModel,
    ),
  ],)
class EgresadoExperienciasLabsModel {
  @ColumnInfo(name: 'cedulaId')
  final String cedulaId;
  @PrimaryKey(autoGenerate: false)
  @ColumnInfo(name: 'idExperienciaLaboral')
  final String idExperienciaLaboral;
  EgresadoExperienciasLabsModel({
    required this.cedulaId,
    required this.idExperienciaLaboral,
  });
}
