// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:floor/floor.dart';

import 'package:evaproject/src/models/empresa/empresa_model.dart';
import 'package:evaproject/src/models/oferta/oferta_model.dart';

@Entity(tableName: 'empresa_ofertas',
  foreignKeys: [
    ForeignKey(
      childColumns: ['rncId'],
      parentColumns: ['rncId'],
      entity: EmpresaModel,
    ),
    ForeignKey(
      childColumns: ['idOferta'],
      parentColumns: ['idOferta'],
      entity: OfertaModel,
    ),
  ],)
class EmpresaOfertasModel {
  @ColumnInfo(name: 'rncId')
  final String rncId;
  @PrimaryKey(autoGenerate: false)
  @ColumnInfo(name: 'idOferta')
  final String idOferta;
  EmpresaOfertasModel({
    required this.rncId,
    required this.idOferta,
  });

  EmpresaOfertasModel copyWith({
    String? rncId,
    String? idOferta,
  }) {
    return EmpresaOfertasModel(
      rncId: rncId ?? this.rncId,
      idOferta: idOferta ?? this.idOferta,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rncId': rncId,
      'idOferta': idOferta,
    };
  }

  factory EmpresaOfertasModel.fromMap(Map<String, dynamic> map) {
    return EmpresaOfertasModel(
      rncId: map['rncId'] as String,
      idOferta: map['idOferta'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EmpresaOfertasModel.fromJson(String source) => EmpresaOfertasModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'EmpresaOfertasModel(rncId: $rncId, idOferta: $idOferta)';

  @override
  bool operator ==(covariant EmpresaOfertasModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.rncId == rncId &&
      other.idOferta == idOferta;
  }

  @override
  int get hashCode => rncId.hashCode ^ idOferta.hashCode;
}
