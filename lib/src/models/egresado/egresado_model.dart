// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:floor/floor.dart';

class Envio {
  EgresadoModel egresadoModel;
  String idOferta;
  Envio({
    required this.egresadoModel,
    required this.idOferta,
  });
}

// import 'package:evaproject/src/models/experiencia_laboral/experiencia_laboral_model.dart';
// import 'package:evaproject/src/models/formacion_academica/formacion_academica_model.dart';
// import 'package:evaproject/src/models/referencia/referencia_model.dart';

@Entity(
  tableName: 'egresado',
  // foreignKeys: [
  //   ForeignKey(
  //     childColumns: ['idFormacion'],
  //     parentColumns: ['idFormacion'],
  //     entity: FormacionAcademicaModel,
  //   ),
  //   ForeignKey(
  //     childColumns: ['idExperienciaLaboral'],
  //     parentColumns: ['idExperienciaLaboral'],
  //     entity: ExperienciaLaboralModel,
  //   ),
  //   ForeignKey(
  //     childColumns: ['idReferencia'],
  //     parentColumns: ['idReferencia'],
  //     entity: ReferenciaModel,
  //   ),
  // ],
)
class EgresadoModel {
  @PrimaryKey(autoGenerate: false)
  @ColumnInfo(name: 'cedulaId')
  final String cedulaId;
  String nombreYApellido;
  double? estatura;
  int edad;
  String estadoCivil;
  String sexo;
  String correo;
  String nivelEducativo;
  bool licenciaDeConducir;
  bool vehiculoPropio;
  String? telefonoCelular;
  String? telefonoResidencia;
  String? otro;
  String fechaNacimiento;
  String? curriculo;
  // @ColumnInfo(name: 'idFormacion')
  // int? idFormacion;
  // @ColumnInfo(name: 'idExperienciaLaboral')
  // int? idExperienciaLaboral;
  // @ColumnInfo(name: 'idReferencia')
  // int? idReferencia;
  bool disponibilidad;
  EgresadoModel({
    required this.cedulaId,
    required this.nombreYApellido,
    required this.estatura,
    required this.edad,
    required this.estadoCivil,
    required this.sexo,
    required this.correo,
    required this.nivelEducativo,
    required this.licenciaDeConducir,
    required this.vehiculoPropio,
    this.telefonoCelular,
    this.telefonoResidencia,
    this.otro,
    required this.fechaNacimiento,
    this.curriculo,
    required this.disponibilidad,
  });

  EgresadoModel copyWith({
    String? cedulaId,
    String? nombreYApellido,
    double? estatura,
    int? edad,
    String? estadoCivil,
    String? sexo,
    String? correo,
    String? nivelEducativo,
    bool? licenciaDeConducir,
    bool? vehiculoPropio,
    String? telefonoCelular,
    String? telefonoResidencia,
    String? otro,
    String? fechaNacimiento,
    String? curriculo,
    bool? disponibilidad,
  }) {
    return EgresadoModel(
      cedulaId: cedulaId ?? this.cedulaId,
      nombreYApellido: nombreYApellido ?? this.nombreYApellido,
      estatura: estatura ?? this.estatura,
      edad: edad ?? this.edad,
      estadoCivil: estadoCivil ?? this.estadoCivil,
      sexo: sexo ?? this.sexo,
      correo: correo ?? this.correo,
      nivelEducativo: nivelEducativo ?? this.nivelEducativo,
      licenciaDeConducir: licenciaDeConducir ?? this.licenciaDeConducir,
      vehiculoPropio: vehiculoPropio ?? this.vehiculoPropio,
      telefonoCelular: telefonoCelular ?? this.telefonoCelular,
      telefonoResidencia: telefonoResidencia ?? this.telefonoResidencia,
      otro: otro ?? this.otro,
      fechaNacimiento: fechaNacimiento ?? this.fechaNacimiento,
      curriculo: curriculo ?? this.curriculo,
      disponibilidad: disponibilidad ?? this.disponibilidad,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cedulaId': cedulaId,
      'nombreYApellido': nombreYApellido,
      'estatura': estatura,
      'edad': edad,
      'estadoCivil': estadoCivil,
      'sexo': sexo,
      'correo': correo,
      'nivelEducativo': nivelEducativo,
      'licenciaDeConducir': licenciaDeConducir,
      'vehiculoPropio': vehiculoPropio,
      'telefonoCelular': telefonoCelular,
      'telefonoResidencia': telefonoResidencia,
      'otro': otro,
      'fechaNacimiento': fechaNacimiento,
      'curriculo': curriculo,
      'disponibilidad': disponibilidad,
    };
  }

  factory EgresadoModel.fromMap(Map<String, dynamic> map) {
    return EgresadoModel(
      cedulaId: map['cedulaId'] as String,
      nombreYApellido: map['nombreYApellido'] as String,
      estatura: map['estatura'] != null ? map['estatura'] as double : null,
      edad: map['edad'] as int,
      estadoCivil: map['estadoCivil'] as String,
      sexo: map['sexo'] as String,
      correo: map['correo'] as String,
      nivelEducativo: map['nivelEducativo'] as String,
      licenciaDeConducir: map['licenciaDeConducir'] as bool,
      vehiculoPropio: map['vehiculoPropio'] as bool,
      telefonoCelular: map['telefonoCelular'] != null ? map['telefonoCelular'] as String : null,
      telefonoResidencia: map['telefonoResidencia'] != null ? map['telefonoResidencia'] as String : null,
      otro: map['otro'] != null ? map['otro'] as String : null,
      fechaNacimiento: map['fechaNacimiento'] as String,
      curriculo: map['curriculo'] != null ? map['curriculo'] as String : null,
      disponibilidad: map['disponibilidad'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory EgresadoModel.fromJson(String source) =>
      EgresadoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EgresadoModel(cedulaId: $cedulaId, nombreYApellido: $nombreYApellido, estatura: $estatura, edad: $edad, estadoCivil: $estadoCivil, sexo: $sexo, correo: $correo, nivelEducativo: $nivelEducativo, licenciaDeConducir: $licenciaDeConducir, vehiculoPropio: $vehiculoPropio, telefonoCelular: $telefonoCelular, telefonoResidencia: $telefonoResidencia, otro: $otro, fechaNacimiento: $fechaNacimiento, curriculo: $curriculo, disponibilidad: $disponibilidad)';
  }

  @override
  bool operator ==(covariant EgresadoModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.cedulaId == cedulaId &&
      other.nombreYApellido == nombreYApellido &&
      other.estatura == estatura &&
      other.edad == edad &&
      other.estadoCivil == estadoCivil &&
      other.sexo == sexo &&
      other.correo == correo &&
      other.nivelEducativo == nivelEducativo &&
      other.licenciaDeConducir == licenciaDeConducir &&
      other.vehiculoPropio == vehiculoPropio &&
      other.telefonoCelular == telefonoCelular &&
      other.telefonoResidencia == telefonoResidencia &&
      other.otro == otro &&
      other.fechaNacimiento == fechaNacimiento &&
      other.curriculo == curriculo &&
      other.disponibilidad == disponibilidad;
  }

  @override
  int get hashCode {
    return cedulaId.hashCode ^
      nombreYApellido.hashCode ^
      estatura.hashCode ^
      edad.hashCode ^
      estadoCivil.hashCode ^
      sexo.hashCode ^
      correo.hashCode ^
      nivelEducativo.hashCode ^
      licenciaDeConducir.hashCode ^
      vehiculoPropio.hashCode ^
      telefonoCelular.hashCode ^
      telefonoResidencia.hashCode ^
      otro.hashCode ^
      fechaNacimiento.hashCode ^
      curriculo.hashCode ^
      disponibilidad.hashCode;
  }
}
