// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:floor/floor.dart';

@Entity()
class OfertaModel {
  @PrimaryKey(autoGenerate: false)
  @ColumnInfo(name: 'idOferta')
  final String idOferta;
  String posicion;
  String fechaPub;
  String abre;
  String cierra;
  String beneficios;
  double salario;
  String ubicacion;
  bool abierto;
  @ColumnInfo(name: 'versionPublicacion')
  String versionPublicacion;
  OfertaModel({
    required this.idOferta,
    required this.posicion,
    required this.fechaPub,
    required this.abre,
    required this.cierra,
    required this.beneficios,
    required this.salario,
    required this.ubicacion,
    required this.abierto,
    required this.versionPublicacion,
  });

  OfertaModel copyWith({
    String? idOferta,
    String? posicion,
    String? fechaPub,
    String? abre,
    String? cierra,
    String? beneficios,
    double? salario,
    String? ubicacion,
    bool? abierto,
    String? versionPublicacion,
  }) {
    return OfertaModel(
      idOferta: idOferta ?? this.idOferta,
      posicion: posicion ?? this.posicion,
      fechaPub: fechaPub ?? this.fechaPub,
      abre: abre ?? this.abre,
      cierra: cierra ?? this.cierra,
      beneficios: beneficios ?? this.beneficios,
      salario: salario ?? this.salario,
      ubicacion: ubicacion ?? this.ubicacion,
      abierto: abierto ?? this.abierto,
      versionPublicacion: versionPublicacion ?? this.versionPublicacion,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idOferta': idOferta,
      'posicion': posicion,
      'fechaPub': fechaPub,
      'abre': abre,
      'cierra': cierra,
      'beneficios': beneficios,
      'salario': salario,
      'ubicacion': ubicacion,
      'abierto': abierto,
      'versionPublicacion': versionPublicacion,
    };
  }

  factory OfertaModel.fromMap(Map<String, dynamic> map) {
    return OfertaModel(
      idOferta: map['idOferta'] as String,
      posicion: map['posicion'] as String,
      fechaPub: map['fechaPub'] as String,
      abre: map['abre'] as String,
      cierra: map['cierra'] as String,
      beneficios: map['beneficios'] as String,
      salario: map['salario'] as double,
      ubicacion: map['ubicacion'] as String,
      abierto: map['abierto'] as bool,
      versionPublicacion: map['versionPublicacion'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OfertaModel.fromJson(String source) =>
      OfertaModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OfertaModel(idOferta: $idOferta, posicion: $posicion, fechaPub: $fechaPub, abre: $abre, cierra: $cierra, beneficios: $beneficios, salario: $salario, ubicacion: $ubicacion, abierto: $abierto, versionPublicacion: $versionPublicacion)';
  }

  @override
  bool operator ==(covariant OfertaModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.idOferta == idOferta &&
      other.posicion == posicion &&
      other.fechaPub == fechaPub &&
      other.abre == abre &&
      other.cierra == cierra &&
      other.beneficios == beneficios &&
      other.salario == salario &&
      other.ubicacion == ubicacion &&
      other.abierto == abierto &&
      other.versionPublicacion == versionPublicacion;
  }

  @override
  int get hashCode {
    return idOferta.hashCode ^
      posicion.hashCode ^
      fechaPub.hashCode ^
      abre.hashCode ^
      cierra.hashCode ^
      beneficios.hashCode ^
      salario.hashCode ^
      ubicacion.hashCode ^
      abierto.hashCode ^
      versionPublicacion.hashCode;
  }
}
