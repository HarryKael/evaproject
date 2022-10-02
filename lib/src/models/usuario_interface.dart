import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UsuarioModel {
  String password;
  UsuarioModel({
    required this.password,
  });

  UsuarioModel copyWith({
    String? password,
  }) {
    return UsuarioModel(
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'password': password,
    };
  }

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel(
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UsuarioModel.fromJson(String source) => UsuarioModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UsuarioModel(password: $password)';

  @override
  bool operator ==(covariant UsuarioModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.password == password;
  }

  @override
  int get hashCode => password.hashCode;
}
