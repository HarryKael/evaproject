// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:floor/floor.dart';

import 'package:evaproject/src/models/egresado/egresado_model.dart';

@Entity(tableName: 'aplicacion', foreignKeys: [ForeignKey(childColumns: ['cedulaId'], parentColumns: ['cedulaId'], entity: EgresadoModel),  ])
class AplicacionModel {
  @PrimaryKey(autoGenerate: false)
  @ColumnInfo(name: 'idAplicacion')
  final String idAplicacion;
  @ColumnInfo(name: 'cedulaId')
  final String cedulaId;
  final String fechaAplicion;
  AplicacionModel({
    required this.idAplicacion,
    required this.cedulaId,
    required this.fechaAplicion,
  });

  AplicacionModel copyWith({
    String? idAplicacion,
    String? cedulaId,
    String? fechaAplicion,
  }) {
    return AplicacionModel(
      idAplicacion: idAplicacion ?? this.idAplicacion,
      cedulaId: cedulaId ?? this.cedulaId,
      fechaAplicion: fechaAplicion ?? this.fechaAplicion,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idAplicacion': idAplicacion,
      'cedulaId': cedulaId,
      'fechaAplicion': fechaAplicion,
    };
  }

  factory AplicacionModel.fromMap(Map<String, dynamic> map) {
    return AplicacionModel(
      idAplicacion: map['idAplicacion'] as String,
      cedulaId: map['cedulaId'] as String,
      fechaAplicion: map['fechaAplicion'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AplicacionModel.fromJson(String source) => AplicacionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AplicacionModel(idAplicacion: $idAplicacion, cedulaId: $cedulaId, fechaAplicion: $fechaAplicion)';

  @override
  bool operator ==(covariant AplicacionModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.idAplicacion == idAplicacion &&
      other.cedulaId == cedulaId &&
      other.fechaAplicion == fechaAplicion;
  }

  @override
  int get hashCode => idAplicacion.hashCode ^ cedulaId.hashCode ^ fechaAplicion.hashCode;
}
