import 'package:cloud_firestore/cloud_firestore.dart';

class Projeto {
  final String titulo;
  final String autor;
  final String linkArtigo;
  final String dataInicio;
  final String previsaoTermino;
  final int custo;
  final String telefone;
  final String email;
  final String descricao;
  DocumentReference reference;

  Projeto(
      {this.titulo,
      this.autor,
      this.linkArtigo,
      this.dataInicio,
      this.previsaoTermino,
      this.custo,
      this.telefone,
      this.email,
      this.descricao});

  factory Projeto.fromSnapshot(DocumentSnapshot snapshot){
    Projeto novoProjeto = Projeto.fromJson(snapshot.data);
    novoProjeto.reference = snapshot.reference;
    return novoProjeto;
  }

  factory Projeto.fromJson(Map<dynamic, dynamic> json) => _ProjetoFromJson(json);

  Map<String, dynamic> toJson() => _ProjetoToJson(this);
}

Projeto _ProjetoFromJson(Map<dynamic, dynamic> json) {
  return Projeto(
    titulo: json['titulo'] as String,
    autor: json['autor'] as String,
    linkArtigo: json['linkArtigo'] as String,
    dataInicio: json['dataInicio'] as String,
    previsaoTermino: json['previsaoTermino'] as String,
    custo: json['custo'] as int,
    telefone: json['telefone'] as String,
    email: json['email'] as String,
    descricao: json['descricao'] as String,
    
  );
}

Map<String, dynamic> _ProjetoToJson(Projeto instance) => <String, dynamic>{
      'titulo': instance.titulo,
      'autor': instance.autor,
      'linkArtigo': instance.linkArtigo,
      'dataInicio': instance.dataInicio,
      'previsaoTermino': instance.previsaoTermino,
      'custo': instance.custo,
      'telefone': instance.telefone,
      'email': instance.email,
      'descricao': instance.descricao,
    };