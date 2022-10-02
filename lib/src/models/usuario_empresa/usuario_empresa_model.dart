import 'dart:convert';

import 'package:evaproject/src/models/empresa/empresa_model.dart';
import 'package:evaproject/src/models/usuario_interface.dart';
import 'package:floor/floor.dart';

@Entity(
  foreignKeys: [
  ForeignKey(childColumns: ['idUsuario'], parentColumns: ['rncId'], entity: EmpresaModel),
  ],
)
class UsuarioEmpresaModel extends UsuarioModel {
  // ignore: overridden_fields
  @PrimaryKey()
  @ColumnInfo(name: 'idUsuario')
  final String idUsuario;
  UsuarioEmpresaModel(
      {required this.idUsuario,
      required super.password});

  factory UsuarioEmpresaModel.fromMap(Map<String, dynamic> map) {
    return UsuarioEmpresaModel(
      idUsuario: map['idUsuario'] as String,
      password: map['password'] as String,
    );
  }
  factory UsuarioEmpresaModel.fromJson(String source) =>
      UsuarioEmpresaModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
