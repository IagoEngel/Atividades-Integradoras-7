import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:atividades_integradoras/models/projeto.dart';

class ProjetoRepository{
  
  CollectionReference collection = Firestore.instance.collection('projeto');
  
  Stream<QuerySnapshot> getStream(){
    return collection.snapshots();
  }

  Future<DocumentReference> addProjeto(Projeto projeto){
    return collection.add(projeto.toJson());
  }

  updateProjeto(Projeto projeto) async {
    await collection.document(projeto.reference.documentID).updateData(projeto.toJson());
  }

}