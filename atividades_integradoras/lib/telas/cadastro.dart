import 'package:flutter/material.dart';

class CadastroPasso1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(124, 70, 192, 1.0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Cadastrar Usuário",
            style: TextStyle(
              fontSize: 32,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          _passo1(),
          _nomeCompleto(),
          _email(),
          _senha(),
          _confirmaSenha(),
          _proximoPasso(),
        ],
      ),
    );
  }
}

Widget _nomeCompleto() {
  return Container(
    padding:
        const EdgeInsets.only(left: 42.5, right: 42.5, top: 24.0, bottom: 12.0),
    child: new Theme(
      data: new ThemeData(
        primaryColor: Colors.white,
      ),
      child: TextField(
        decoration: new InputDecoration(
          enabledBorder: new OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          border: new OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          labelText: 'Nome Completo',
          labelStyle: TextStyle(color: Colors.white, fontSize: 26),
        ),
      ),
    ),
  );
}

Widget _email() {
  return Container(
    padding:
        const EdgeInsets.only(left: 42.5, right: 42.5, top: 12.0, bottom: 12.0),
    child: new Theme(
      data: new ThemeData(
        primaryColor: Colors.white,
      ),
      child: TextField(
        decoration: new InputDecoration(
          enabledBorder: new OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          border: new OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          labelText: 'Email',
          labelStyle: TextStyle(color: Colors.white, fontSize: 26),
        ),
      ),
    ),
  );
}

Widget _senha() {
  return Container(
    padding:
        const EdgeInsets.only(left: 42.5, right: 42.5, top: 12.0, bottom: 12.0),
    child: new Theme(
      data: new ThemeData(
        primaryColor: Colors.white,
      ),
      child: TextField(
        decoration: new InputDecoration(
          enabledBorder: new OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          border: new OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          labelText: 'Senha',
          labelStyle: TextStyle(color: Colors.white, fontSize: 26),
        ),
      ),
    ),
  );
}

Widget _confirmaSenha() {
  return Container(
    padding:
        const EdgeInsets.only(left: 42.5, right: 42.5, top: 12.0, bottom: 12.0),
    child: new Theme(
      data: new ThemeData(
        primaryColor: Colors.white,
      ),
      child: TextField(
        decoration: new InputDecoration(
          enabledBorder: new OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          border: new OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          labelText: 'Confirmar Senha',
          labelStyle: TextStyle(color: Colors.white, fontSize: 26),
        ),
      ),
    ),
  );
}

Widget _passo1() {
  return Container(
    color: Colors.white,
    padding: const EdgeInsets.only(
      left: 70.5,
      right: 70.5,
      top: 9,
      bottom: 9,
    ),
    child: Text(
      "Passo 1 de 4",
      style: TextStyle(
        backgroundColor: Colors.white,
        color: Color.fromRGBO(124, 70, 192, 1.0),
        fontSize: 32,
      ),
    ),
  );
}

Widget _proximoPasso() {
  return Container(
    padding: const EdgeInsets.only(
      left: 42.5,
      right: 42.5,
      top: 12.0,
      bottom: 12.0,
    ),
    child: SizedBox(
      height: 66,
      width: double.infinity,
      child: RaisedButton(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[    
            SizedBox(width: 30),        
            Text('Próximo', style: TextStyle(fontSize: 26)),
            SizedBox(width: 30),
            Icon(Icons.keyboard_tab),
          ],
        ),
        onPressed: () {},
      ),
    ),
  );
}
