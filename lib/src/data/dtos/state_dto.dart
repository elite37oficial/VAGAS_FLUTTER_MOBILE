import 'dart:convert';

import '../../domain/entities/states_entity.dart';

class StateDto extends StateEntity {
  String sigla;
  String nome;
  List<String> cidades;

  StateDto({
    required this.sigla,
    required this.nome,
    required this.cidades,
  }) : super(
          abbreviation: sigla,
          name: nome,
          city: cidades,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sigla': sigla,
      'nome': nome,
      'cidades': cidades,
    };
  }

  static StateDto fromMap(Map<String, dynamic> map) {
    return StateDto(
      sigla: map['sigla'],
      nome: map['nome'],
      cidades: List<String>.from(map['cidades']),
    );
  }

  String toJson() {
    return json.encode(toMap());
  }

  static StateDto fromJson(String jsonString) {
    Map<String, dynamic> map = json.decode(jsonString);
    return StateDto.fromMap(map);
  }
}
