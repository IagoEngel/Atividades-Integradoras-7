import 'package:cloud_firestore/cloud_firestore.dart';

class User{

  final String uid;

  String nome;
  String email;
  String uf;
  String cidade;
  String escolaridade;
  bool pesquisador;

  User({this.uid});
}