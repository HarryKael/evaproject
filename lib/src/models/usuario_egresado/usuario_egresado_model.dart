import 'dart:convert';

import 'package:evaproject/src/models/egresado/egresado_model.dart';
import 'package:evaproject/src/models/usuario_interface.dart';
import 'package:floor/floor.dart';

@Entity(
  foreignKeys: [
  ForeignKey(childColumns: ['idUsuario'], parentColumns: ['cedulaId'], entity: EgresadoModel),
  ],
)
class UsuarioEgresadoModel extends UsuarioModel {
  // ignore: overridden_fields
  @PrimaryKey()
  @ColumnInfo(name: 'idUsuario')
  final String idUsuario;
  UsuarioEgresadoModel(
      {required this.idUsuario,
      required super.password});

  factory UsuarioEgresadoModel.fromMap(Map<String, dynamic> map) {
    return UsuarioEgresadoModel(
      idUsuario: map['idUsuario'] as String,
      password: map['password'] as String,
    );
  }
  factory UsuarioEgresadoModel.fromJson(String source) =>
      UsuarioEgresadoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
