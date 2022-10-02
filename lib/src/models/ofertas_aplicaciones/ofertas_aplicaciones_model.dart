// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:floor/floor.dart';

import 'package:evaproject/src/models/aplicacion/aplicacion_model.dart';
import 'package:evaproject/src/models/oferta/oferta_model.dart';

@Entity(
  tableName: 'ofertas_aplicaciones',
  foreignKeys: [
    ForeignKey(
      childColumns: ['idOferta'],
      parentColumns: ['idOferta'],
      entity: OfertaModel,
    ),
    ForeignKey(
      childColumns: ['idAplicacion'],
      parentColumns: ['idAplicacion'],
      entity: AplicacionModel,
    ),
  ],
)
class OfertasAplicacionesModel {
  @ColumnInfo(name: 'idOferta')
  final String idOferta;
  @PrimaryKey(autoGenerate: false)
  @ColumnInfo(name: 'idAplicacion')
  final String idAplicacion;
  OfertasAplicacionesModel({
    required this.idOferta,
    required this.idAplicacion,
  });

  OfertasAplicacionesModel copyWith({
    String? idOferta,
    String? idAplicacion,
  }) {
    return OfertasAplicacionesModel(
      idOferta: idOferta ?? this.idOferta,
      idAplicacion: idAplicacion ?? this.idAplicacion,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idOferta': idOferta,
      'idAplicacion': idAplicacion,
    };
  }

  factory OfertasAplicacionesModel.fromMap(Map<String, dynamic> map) {
    return OfertasAplicacionesModel(
      idOferta: map['idOferta'] as String,
      idAplicacion: map['idAplicacion'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OfertasAplicacionesModel.fromJson(String source) => OfertasAplicacionesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'OfertasAplicacionesModel(idOferta: $idOferta, idAplicacion: $idAplicacion)';

  @override
  bool operator ==(covariant OfertasAplicacionesModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.idOferta == idOferta &&
      other.idAplicacion == idAplicacion;
  }

  @override
  int get hashCode => idOferta.hashCode ^ idAplicacion.hashCode;
}
