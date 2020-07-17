import 'package:flutter/material.dart';

class DetalhesProjeto extends StatefulWidget {
  var registro;

  DetalhesProjeto(@required this.registro);

  @override
  _DetalhesProjetoState createState() => _DetalhesProjetoState();
}

class _DetalhesProjetoState extends State<DetalhesProjeto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(124, 70, 192, 1.0),
        title: Text('${widget.registro.titulo}'),
      ),
      backgroundColor: Color.fromRGBO(240, 240, 245, 1.0),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Container(
            child: Informacoes(widget.registro),
          ),
        ),
      ),
    );
  }
}

Widget Informacoes(var registro) {
  return Padding(
    padding: const EdgeInsets.only(top: 40, left: 30, right: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _texto('Descrição:'),
        Container(
          margin: EdgeInsets.only(top: 20, bottom: 20),
          padding: EdgeInsets.all(20),
          alignment: Alignment.topLeft,
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(
              width: 3,
              color: Color.fromRGBO(124, 70, 192, 1.0),
            ),
          ),
          child: Text(
            '${registro.descricao}',
            style: TextStyle(fontSize: 28),
          ),
        ),
        _texto('Link do Artigo'),
        _purpleBox('${registro.linkArtigo}'),
        _texto('Data de início:'),
        _purpleBox('${registro.dataInicio}'),
        _texto('Prazo de término:'),
        _purpleBox('${registro.previsaoTermino}'),
        _texto('Custo:'),
        _purpleBox('R\$ ${registro.custo},00'),
        _texto('Contatos:'),
        _contatos(Icons.settings_phone,'${registro.telefone}'),
        _contatos(Icons.mail,'${registro.email}'),
      ],
    ),
  );
}

Widget _texto(String texto) {
  return Text(
    '$texto',
    style: TextStyle(
      color: Color.fromRGBO(124, 70, 192, 1.0),
      fontSize: 28,
    ),
  );
}

Widget _purpleBox(String texto) {
  return Container(
    margin: EdgeInsets.only(top: 20, bottom: 20),
    padding: EdgeInsets.only(top: 20, bottom: 20),
    decoration: new BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: Color.fromRGBO(124, 70, 192, 1.0),
    ),
    child: Center(
      child: Text(
        '$texto',
        style: TextStyle(
          color: Colors.white,
          fontSize: 28,
        ),
      ),
    ),
  );
}

Widget _contatos(IconData icone, String texto){
  return Row(
    children: <Widget>[
      SizedBox(height: 60),
      Icon(icone, size: 40),
      SizedBox(width: 15),
      Text('$texto',style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
    ],
  );
}