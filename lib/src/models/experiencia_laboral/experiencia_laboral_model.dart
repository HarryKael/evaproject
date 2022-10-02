// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:floor/floor.dart';

@Entity()
class ExperienciaLaboralModel {
  @PrimaryKey(autoGenerate: true)
  @ColumnInfo(name: 'idExperienciaLaboral')
  final int idExperienciaLaboral;
  String empresa;
  String telefono;
  String posicionDeTrabajo;
  String desde;
  String hasta;
  ExperienciaLaboralModel({
    required this.idExperienciaLaboral,
    required this.empresa,
    required this.telefono,
    required this.posicionDeTrabajo,
    required this.desde,
    required this.hasta,
  });

  ExperienciaLaboralModel copyWith({
    int? idExperienciaLaboral,
    String? empresa,
    String? telefono,
    String? posicionDeTrabajo,
    String? desde,
    String? hasta,
  }) {
    return ExperienciaLaboralModel(
      idExperienciaLaboral: idExperienciaLaboral ?? this.idExperienciaLaboral,
      empresa: empresa ?? this.empresa,
      telefono: telefono ?? this.telefono,
      posicionDeTrabajo: posicionDeTrabajo ?? this.posicionDeTrabajo,
      desde: desde ?? this.desde,
      hasta: hasta ?? this.hasta,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idExperienciaLaboral': idExperienciaLaboral,
      'empresa': empresa,
      'telefono': telefono,
      'posicionDeTrabajo': posicionDeTrabajo,
      'desde': desde,
      'hasta': hasta,
    };
  }

  factory ExperienciaLaboralModel.fromMap(Map<String, dynamic> map) {
    return ExperienciaLaboralModel(
      idExperienciaLaboral: map['idExperienciaLaboral'] as int,
      empresa: map['empresa'] as String,
      telefono: map['telefono'] as String,
      posicionDeTrabajo: map['posicionDeTrabajo'] as String,
      desde: map['desde'] as String,
      hasta: map['hasta'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExperienciaLaboralModel.fromJson(String source) =>
      ExperienciaLaboralModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ExperienciaLaboralModel(idExperienciaLaboral: $idExperienciaLaboral, empresa: $empresa, telefono: $telefono, posicionDeTrabajo: $posicionDeTrabajo, desde: $desde, hasta: $hasta)';
  }

  @override
  bool operator ==(covariant ExperienciaLaboralModel other) {
    if (identical(this, other)) return true;

    return other.idExperienciaLaboral == idExperienciaLaboral &&
        other.empresa == empresa &&
        other.telefono == telefono &&
        other.posicionDeTrabajo == posicionDeTrabajo &&
        other.desde == desde &&
        other.hasta == hasta;
  }

  @override
  int get hashCode {
    return idExperienciaLaboral.hashCode ^
        empresa.hashCode ^
        telefono.hashCode ^
        posicionDeTrabajo.hashCode ^
        desde.hashCode ^
        hasta.hashCode;
  }
}
