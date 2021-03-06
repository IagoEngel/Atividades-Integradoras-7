import 'package:atividades_integradoras/models/projeto.dart';
import 'package:atividades_integradoras/telas/detalhesprojeto.dart';
import 'package:atividades_integradoras/telas/filtrarpesquisa.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListaProjetos extends StatefulWidget {
  @override
  _ListaProjetosState createState() => _ListaProjetosState();
}

class _ListaProjetosState extends State<ListaProjetos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(124, 70, 192, 1.0),
        title: Row(
          children: <Widget>[
            Text('Lista de Projetos'),
            Expanded(child: SizedBox()),
            Icon(Icons.search),
          ],
        ),
        leading: new DrawerHeader(child: null),
      ),
      body: Container(
        color: Color.fromRGBO(240, 240, 245, 1.0),
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Estrutura(context),
      ),
    );
  }
}

Widget Estrutura(var context) {
  return Column(
    children: <Widget>[
      //TAGS
      Container(
        alignment: Alignment.topLeft,
        child: RaisedButton(
          color: Colors.white,
          textColor: Color.fromRGBO(124, 70, 192, 1.0),
          child: Text('Educação', style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            side: BorderSide(
              color: Color.fromRGBO(124, 70, 192, 1.0),
              width: 2.0,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=>FiltrarPesquisa()),
            );
          },
        ),
      ),
      
      _buildCards(context),
    ],
  );
}

Widget _buildCards(BuildContext context){
  return StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance.collection('projeto').snapshots(),
    builder: (context, snapshot){
      if(!snapshot.hasData) return LinearProgressIndicator();

      return _buildListCards(context, snapshot.data.documents);
    },
  );
}

Widget _buildListCards(BuildContext context, List<DocumentSnapshot> snapshot){
  return Column(
    children: snapshot.map((e) => cards(context, e)).toList(),
  );
}

Widget cards(BuildContext context, DocumentSnapshot data) {
  final registro = Projeto.fromSnapshot(data);

  return Container(
    alignment: Alignment.topCenter,
    child: Container(
      child: Card(
        shadowColor: Colors.black,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          side:
              BorderSide(width: 3.0, color: Color.fromRGBO(124, 70, 192, 1.0)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              '${registro.titulo}',
              style: TextStyle(
                  color: Color.fromRGBO(124, 70, 192, 1.0), fontSize: 26),
            ),
            //DESCRIÇÃO
            ListTile(
              title: Text(
                '${registro.descricao}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            //CUSTO
            ListTile(
              title: Text(
                'CUSTO: ',
                style: TextStyle(
                    color: Color.fromRGBO(124, 70, 192, 1.0), fontSize: 20),
              ),
              trailing: Text(
                'R\$ ${registro.custo},00',
                style: TextStyle(
                    color: Color.fromRGBO(124, 70, 192, 1.0), fontSize: 20),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              padding: EdgeInsets.only(left: 15, right: 15),
              child: RaisedButton(
                color: Color.fromRGBO(124, 70, 192, 1.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: ListTile(
                  title: Text(
                    'Ver detalhes do projeto',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  trailing: Icon(Icons.remove_red_eye, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetalhesProjeto(registro)));
                },
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    ),
  );
}