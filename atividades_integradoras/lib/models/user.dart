import 'package:cloud_firestore/cloud_firestore.dart';

class User{
  final String nome;
  final String email;
  final String uf;
  final String cidade;
  final String escolaridade;
  final String instituicao;
  final bool pesquisador;
  final String uid;

  DocumentReference reference;

  User({
    this.nome,
    this.email,
    this.uf,
    this.cidade,
    this.escolaridade,
    this.instituicao,
    this.pesquisador,
    this.uid
  });

  factory User.fromSnapshot(DocumentSnapshot snapshot){
    User novoUser = User.fromJson(snapshot.data);
    novoUser.reference = snapshot.reference;
    return novoUser;
  }

  factory User.fromJson(Map<dynamic, dynamic> json) => _UserFromJson(json);

  Map<String, dynamic> toJson() => _UserToJson(this);
}

User _UserFromJson(Map<dynamic, dynamic> json) {
  return User(
    nome: json['nome'] as String,
    email: json['email'] as String,
    uf: json['uf'] as String,
    cidade: json['cidade'] as String,
    escolaridade: json['escolaridade'] as String,
    instituicao: json['instituicao'] as String,
    pesquisador: json['pesquisador'] as bool,
    uid: json['uid'] as String,
    
  );
}

Map<String, dynamic> _UserToJson(User instance) => <String, dynamic>{
  'nome': instance.nome,
  'email': instance.email,
  'cidade': instance.cidade,
  'escolaridade': instance.escolaridade,
  'instituicao': instance.instituicao,
  'uf': instance.uf,
  'pesquisador': instance.pesquisador,
  'uid': instance.uid,
};