// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:floor/floor.dart';

@Entity()
class ReferenciaModel {
  @PrimaryKey(autoGenerate: true)
  @ColumnInfo(name: 'idReferencia')
  final int idReferencia;
  String nombreApellido;
  String numero;
  ReferenciaModel({
    required this.idReferencia,
    required this.nombreApellido,
    required this.numero,
  });

  ReferenciaModel copyWith({
    int? idReferencia,
    String? nombreApellido,
    String? numero,
  }) {
    return ReferenciaModel(
      idReferencia: idReferencia ?? this.idReferencia,
      nombreApellido: nombreApellido ?? this.nombreApellido,
      numero: numero ?? this.numero,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idReferencia': idReferencia,
      'nombreApellido': nombreApellido,
      'numero': numero,
    };
  }

  factory ReferenciaModel.fromMap(Map<String, dynamic> map) {
    return ReferenciaModel(
      idReferencia: map['idReferencia'] as int,
      nombreApellido: map['nombreApellido'] as String,
      numero: map['numero'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReferenciaModel.fromJson(String source) => ReferenciaModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ReferenciaModel(idReferencia: $idReferencia, nombreApellido: $nombreApellido, numero: $numero)';

  @override
  bool operator ==(covariant ReferenciaModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.idReferencia == idReferencia &&
      other.nombreApellido == nombreApellido &&
      other.numero == numero;
  }

  @override
  int get hashCode => idReferencia.hashCode ^ nombreApellido.hashCode ^ numero.hashCode;
}
