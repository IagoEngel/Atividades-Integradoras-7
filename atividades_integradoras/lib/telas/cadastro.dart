import 'package:atividades_integradoras/models/user.dart';
import 'package:atividades_integradoras/services/auth.dart';
import 'package:atividades_integradoras/telas/passo2.dart';
import 'package:flutter/material.dart';

class CadastroPasso1 extends StatefulWidget {
  @override
  _CadastroPasso1State createState() => _CadastroPasso1State();
}

class _CadastroPasso1State extends State<CadastroPasso1> {
  final AuthService _auth = AuthService();

  var uid;

  TextEditingController txtnome = new TextEditingController();

  TextEditingController txtemail = new TextEditingController();

  TextEditingController txtsenha = new TextEditingController();

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
          _nomeCompleto(txtnome),
          _email(txtemail),
          _senha(txtsenha),
          _confirmaSenha(),
          Container(
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
                onPressed: () async {
                  await _auth.createEmailPasswd(txtemail.text, txtsenha.text);
                  await _getUID(txtemail.text, txtsenha.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Passo2(
                              usuario: User(
                                email: txtemail.text,
                                nome: txtnome.text,
                                uid: uid,
                              ),
                            )),
                  );
                },
              ),
            ),
          ),
          _voltarLogin(context),
        ],
      ),
    );
  }
  _getUID(String email, String passwd) async{
    dynamic result = await _auth.signInEmailPasswd(email, passwd);
    uid = result.uid;
  }
}

Widget _nomeCompleto(TextEditingController txtnome) {
  return Container(
    padding:
        const EdgeInsets.only(left: 42.5, right: 42.5, top: 24.0, bottom: 12.0),
    child: new Theme(
      data: new ThemeData(
        primaryColor: Colors.white,
      ),
      child: TextField(
        controller: txtnome,
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

Widget _email(TextEditingController txtemail) {
  return Container(
    padding:
        const EdgeInsets.only(left: 42.5, right: 42.5, top: 12.0, bottom: 12.0),
    child: new Theme(
      data: new ThemeData(
        primaryColor: Colors.white,
      ),
      child: TextField(
        controller: txtemail,
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

Widget _senha(TextEditingController txtsenha) {
  return Container(
    padding:
        const EdgeInsets.only(left: 42.5, right: 42.5, top: 12.0, bottom: 12.0),
    child: new Theme(
      data: new ThemeData(
        primaryColor: Colors.white,
      ),
      child: TextField(
        controller: txtsenha,
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

Widget _voltarLogin(var context) {
  return GestureDetector(
    onTap: () {
      Navigator.pop(context);
    },
    child: Text(
      'Voltar para o Login',
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
    ),
  );
}
