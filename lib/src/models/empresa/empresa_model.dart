// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:floor/floor.dart';

@Entity()
class EmpresaModel {
  @PrimaryKey(autoGenerate: false)
  @ColumnInfo(name: 'rncId')
  final String rncId;
  String nombreComercial;
  String direccion;
  String telefono;
  String email;
  String web;
  String nombreContacto;
  String emailContacto;
  EmpresaModel({
    required this.rncId,
    required this.nombreComercial,
    required this.direccion,
    required this.telefono,
    required this.email,
    required this.web,
    required this.nombreContacto,
    required this.emailContacto,
  });

  EmpresaModel copyWith({
    String? rncId,
    String? nombreComercial,
    String? direccion,
    String? telefono,
    String? email,
    String? web,
    String? nombreContacto,
    String? emailContacto,
  }) {
    return EmpresaModel(
      rncId: rncId ?? this.rncId,
      nombreComercial: nombreComercial ?? this.nombreComercial,
      direccion: direccion ?? this.direccion,
      telefono: telefono ?? this.telefono,
      email: email ?? this.email,
      web: web ?? this.web,
      nombreContacto: nombreContacto ?? this.nombreContacto,
      emailContacto: emailContacto ?? this.emailContacto,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rncId': rncId,
      'nombreComercial': nombreComercial,
      'direccion': direccion,
      'telefono': telefono,
      'email': email,
      'web': web,
      'nombreContacto': nombreContacto,
      'emailContacto': emailContacto,
    };
  }

  factory EmpresaModel.fromMap(Map<String, dynamic> map) {
    return EmpresaModel(
      rncId: map['rncId'] as String,
      nombreComercial: map['nombreComercial'] as String,
      direccion: map['direccion'] as String,
      telefono: map['telefono'] as String,
      email: map['email'] as String,
      web: map['web'] as String,
      nombreContacto: map['nombreContacto'] as String,
      emailContacto: map['emailContacto'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EmpresaModel.fromJson(String source) => EmpresaModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EmpresaModel(rncId: $rncId, nombreComercial: $nombreComercial, direccion: $direccion, telefono: $telefono, email: $email, web: $web, nombreContacto: $nombreContacto, emailContacto: $emailContacto)';
  }

  @override
  bool operator ==(covariant EmpresaModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.rncId == rncId &&
      other.nombreComercial == nombreComercial &&
      other.direccion == direccion &&
      other.telefono == telefono &&
      other.email == email &&
      other.web == web &&
      other.nombreContacto == nombreContacto &&
      other.emailContacto == emailContacto;
  }

  @override
  int get hashCode {
    return rncId.hashCode ^
      nombreComercial.hashCode ^
      direccion.hashCode ^
      telefono.hashCode ^
      email.hashCode ^
      web.hashCode ^
      nombreContacto.hashCode ^
      emailContacto.hashCode;
  }
}
