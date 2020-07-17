import 'package:atividades_integradoras/models/projeto.dart';
import 'package:atividades_integradoras/repository/dataprojeto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Pesquisador extends StatefulWidget {
  @override
  _PesquisadorState createState() => _PesquisadorState();
}

class _PesquisadorState extends State<Pesquisador> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(124, 70, 192, 1.0),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Container(
            child: CadastarProjeto(),
          ),
        ),
      ),
    );
  }
}

Widget CadastarProjeto() {
  final ProjetoRepository repository = ProjetoRepository();
  TextEditingController _titulo = new TextEditingController();
  TextEditingController _autor = new TextEditingController();
  TextEditingController _linkArtigo = new TextEditingController();
  TextEditingController _custo = new TextEditingController();
  TextEditingController _telefone = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _dataInicio = new TextEditingController();
  TextEditingController _previsaoTermino = new TextEditingController();
  TextEditingController _descricao = new TextEditingController();


  return Padding(
    padding: const EdgeInsets.only(top: 40),
    child: Column(
      children: <Widget>[
        SizedBox(
          height: 70,
        ),
        Center(
          child: Text(
            'Cadastrar novo projeto',
            style: TextStyle(color: Colors.white, fontSize: 27),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          color: Colors.transparent,
          child: new Container(
            decoration: new BoxDecoration(
              color: Color.fromRGBO(240, 240, 245, 1.0),
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(70),
                topRight: const Radius.circular(70),
              ),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 60),
                _camposAtributos(_titulo, Icons.mode_edit, "Titulo"),
                _camposAtributos(_autor, Icons.person, "Autor"),
                _camposAtributos(_linkArtigo, Icons.link, "Link para artigo"),
                _camposAtributos(
                    _dataInicio, Icons.calendar_today, "Data de inicio"),
                _camposAtributos(
                    _previsaoTermino, Icons.calendar_today, "Previsão de término"),
                _camposAtributos(_custo, Icons.monetization_on, "Custo"),
                _camposAtributos(_telefone, Icons.phone, "Telefone"),
                _camposAtributos(_email, Icons.email, "E-mail"),
                _descricaoProjeto(_descricao),
                //BOTAO CADASTRAR
                Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 12.0,
                    bottom: 12.0,
                  ),
                  child: SizedBox(
                    height: 78,
                    width: double.infinity,
                    child: RaisedButton(
                      color: Color.fromRGBO(124, 70, 192, 1.0),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.save,color: Colors.white),
                          SizedBox(width: 30),
                          Text('Cadastrar', style: TextStyle(fontSize: 26, color: Colors.white)),
                          SizedBox(width: 30),
                        ],
                      ),
                      onPressed: () {
                        Projeto projeto = Projeto(
                          titulo: _titulo.text,
                          autor: _autor.text,
                          linkArtigo: _linkArtigo.text,
                          dataInicio: _dataInicio.text,
                          previsaoTermino: _previsaoTermino.text,
                          custo: int.parse(_custo.text),
                          telefone: _telefone.text,
                          email: _email.text,
                          descricao: _descricao.text,
                        );
                        repository.addProjeto(projeto);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _camposAtributos(var controller, IconData icone, String nome) {
  return Container(
    margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
    alignment: Alignment.topCenter,
    decoration: new BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      color: Colors.white,
      border: Border.all(
        width: 3,
        color: Color.fromRGBO(124, 70, 192, 1.0),
      ),
    ),
    child: ListTile(
      leading: Icon(
        icone,
        color: Color.fromRGBO(124, 70, 192, 1.0),
        size: 29,
      ),
      title: TextField(
        decoration: new InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          labelText: nome,
          labelStyle: TextStyle(
            fontSize: 20,
          ),
        ),
        controller: controller,
      ),
    ),
  );
}

/* Widget _temas() {
  return Container(
    margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
    alignment: Alignment.topCenter,
    decoration: new BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      color: Colors.white,
      border: Border.all(
        width: 3,
        color: Color.fromRGBO(124, 70, 192, 1.0),
      ),
    ),
    child: TextField(
      decoration: new InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        labelText: 'Digite temas do projeto',
        labelStyle: TextStyle(
          fontSize: 20,
        ),
      ),
      minLines: 5,
      maxLines: 6,
    ),
  );
} */

Widget _descricaoProjeto(var controller) {
  return Container(
    margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
    alignment: Alignment.topCenter,
    decoration: new BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      color: Colors.white,
      border: Border.all(
        width: 3,
        color: Color.fromRGBO(124, 70, 192, 1.0),
      ),
    ),
    child: TextField(
      controller: controller,
      decoration: new InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        labelText: 'Descrição do projeto',
        labelStyle: TextStyle(
          fontSize: 20,
        ),
      ),
      minLines: 5,
      maxLines: 6,
    ),
  );
}
