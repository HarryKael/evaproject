// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:floor/floor.dart';

@Entity()
class FormacionAcademicaModel {
  @PrimaryKey(autoGenerate: true)
  @ColumnInfo(name: 'idFormacion')
  final int idFormacion;
  String nivelAlcanzado;
  String carreraOCurso;
  String centroOInstitucion;
  String desde;
  String hasta;
  FormacionAcademicaModel({
    required this.idFormacion,
    required this.nivelAlcanzado,
    required this.carreraOCurso,
    required this.centroOInstitucion,
    required this.desde,
    required this.hasta,
  });

  FormacionAcademicaModel copyWith({
    int? idFormacion,
    String? nivelAlcanzado,
    String? carreraOCurso,
    String? centroOInstitucion,
    String? desde,
    String? hasta,
  }) {
    return FormacionAcademicaModel(
      idFormacion: idFormacion ?? this.idFormacion,
      nivelAlcanzado: nivelAlcanzado ?? this.nivelAlcanzado,
      carreraOCurso: carreraOCurso ?? this.carreraOCurso,
      centroOInstitucion: centroOInstitucion ?? this.centroOInstitucion,
      desde: desde ?? this.desde,
      hasta: hasta ?? this.hasta,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idFormacion': idFormacion,
      'nivelAlcanzado': nivelAlcanzado,
      'carreraOCurso': carreraOCurso,
      'centroOInstitucion': centroOInstitucion,
      'desde': desde,
      'hasta': hasta,
    };
  }

  factory FormacionAcademicaModel.fromMap(Map<String, dynamic> map) {
    return FormacionAcademicaModel(
      idFormacion: map['idFormacion'] as int,
      nivelAlcanzado: map['nivelAlcanzado'] as String,
      carreraOCurso: map['carreraOCurso'] as String,
      centroOInstitucion: map['centroOInstitucion'] as String,
      desde: map['desde'] as String,
      hasta: map['hasta'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FormacionAcademicaModel.fromJson(String source) =>
      FormacionAcademicaModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FormacionAcademicaModel(idFormacion: $idFormacion, nivelAlcanzado: $nivelAlcanzado, carreraOCurso: $carreraOCurso, centroOInstitucion: $centroOInstitucion, desde: $desde, hasta: $hasta)';
  }

  @override
  bool operator ==(covariant FormacionAcademicaModel other) {
    if (identical(this, other)) return true;

    return other.idFormacion == idFormacion &&
        other.nivelAlcanzado == nivelAlcanzado &&
        other.carreraOCurso == carreraOCurso &&
        other.centroOInstitucion == centroOInstitucion &&
        other.desde == desde &&
        other.hasta == hasta;
  }

  @override
  int get hashCode {
    return idFormacion.hashCode ^
        nivelAlcanzado.hashCode ^
        carreraOCurso.hashCode ^
        centroOInstitucion.hashCode ^
        desde.hashCode ^
        hasta.hashCode;
  }
}
