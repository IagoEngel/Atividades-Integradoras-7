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
          child: CadastarProjeto(),
        ),
      ),
    );
  }
}

Widget CadastarProjeto() {
  TextEditingController _titulo = new TextEditingController();
  TextEditingController _autor = new TextEditingController();
  TextEditingController _linkArtigo = new TextEditingController();
  TextEditingController _custo = new TextEditingController();
  TextEditingController _telefone = new TextEditingController();
  TextEditingController _email = new TextEditingController();

  return Column(
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
                  _linkArtigo, Icons.calendar_today, "Data de inicio"),
              _camposAtributos(
                  _linkArtigo, Icons.calendar_today, "Previsão de término"),
              _camposAtributos(_custo, Icons.monetization_on, "Custo"),
              _camposAtributos(_telefone, Icons.phone, "Telefone"),
              _camposAtributos(_email, Icons.email, "E-mail"),
              _temas(),
              _descricaoProjeto(),
            ],
          ),
        ),
      ),
    ],
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

Widget _temas() {
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
}

Widget _descricaoProjeto() {
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
