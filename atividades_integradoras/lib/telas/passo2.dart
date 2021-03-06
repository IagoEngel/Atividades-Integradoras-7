import 'package:atividades_integradoras/models/user.dart';
import 'package:atividades_integradoras/telas/passo3.dart';
import 'package:flutter/material.dart';

class Passo2 extends StatefulWidget {
  var estados = new List<String>();
  var escolaridade = new List<String>();
  User usuario;

  Passo2({@required this.usuario}) {
    estados = [
      'RO',
      'AC',
      'AM',
      'RR',
      'PA',
      'AP',
      'TO',
      'MA',
      'PI',
      'CE',
      'RN',
      'PB',
      'PE',
      'AL',
      'SE',
      'BA',
      'MG',
      'ES',
      'RJ',
      'SP',
      'PR',
      'SC',
      'RS',
      'MS',
      'MT',
      'GO',
      'DF',
    ];
    escolaridade = ['Ensino Superior', 'Doutorado', 'Mestrado'];
  }
  @override
  _Passo2State createState() => _Passo2State();
}

class _Passo2State extends State<Passo2> {
  var _currentSelectedValue;
  var _currentEscolaridade;
  TextEditingController txtcidade = new TextEditingController();
  TextEditingController txtinstituicao = new TextEditingController();

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
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(
              left: 70.5,
              right: 70.5,
              top: 9,
              bottom: 9,
            ),
            child: Text(
              "Passo 2 de 4",
              style: TextStyle(
                backgroundColor: Colors.white,
                color: Color.fromRGBO(124, 70, 192, 1.0),
                fontSize: 32,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
                left: 42.5, right: 42.5, top: 12.0, bottom: 12.0),
            child: new Theme(
              data: new ThemeData(
                canvasColor: Color.fromRGBO(0, 0, 0, 0.1),
              ),
              child: FormField<String>(
                builder: (FormFieldState<String> state) {
                  return InputDecorator(
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 26),
                      enabledBorder: new OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      border: new OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                        ),
                        value: _currentSelectedValue,
                        hint: Text(
                          'UF',
                          style: TextStyle(color: Colors.white),
                        ),
                        isDense: true,
                        onChanged: (String newValue) {
                          setState(() {
                            _currentSelectedValue = newValue;
                            state.didChange(newValue);
                          });
                        },
                        style: TextStyle(fontSize: 26),
                        items: widget.estados.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          _cidade(txtcidade),
          _instituicao(txtinstituicao),
          //Escolaridade DropDown
          Container(
            padding: const EdgeInsets.only(
                left: 42.5, right: 42.5, top: 12.0, bottom: 12.0),
            child: new Theme(
              data: new ThemeData(
                canvasColor: Color.fromRGBO(0, 0, 0, 0.1),
              ),
              child: FormField<String>(
                builder: (FormFieldState<String> state) {
                  return InputDecorator(
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 26),
                      enabledBorder: new OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      border: new OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                        ),
                        value: _currentEscolaridade,
                        hint: Text(
                          'Escolaridade',
                          style: TextStyle(color: Colors.white),
                        ),
                        isDense: true,
                        onChanged: (String newValue) {
                          setState(() {
                            _currentEscolaridade = newValue;
                            state.didChange(newValue);
                          });
                        },
                        style: TextStyle(fontSize: 26),
                        items: widget.escolaridade.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          //Próximo
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Passo3(
                              usuario: User(
                                nome: widget.usuario.nome,
                                email: widget.usuario.email,
                                uf: _currentSelectedValue,
                                cidade: txtcidade.text,
                                instituicao: txtinstituicao.text,
                                escolaridade: _currentEscolaridade,
                                uid: widget.usuario.uid,
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
}

Widget _cidade(var controller) {
  return Container(
    padding:
        const EdgeInsets.only(left: 42.5, right: 42.5, top: 12.0, bottom: 12.0),
    child: new Theme(
      data: new ThemeData(
        primaryColor: Colors.white,
      ),
      child: TextField(
        controller: controller,
        decoration: new InputDecoration(
          enabledBorder: new OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          border: new OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          labelText: 'Cidade',
          labelStyle: TextStyle(color: Colors.white, fontSize: 26),
        ),
      ),
    ),
  );
}

Widget _instituicao(var controller) {
  return Container(
    padding:
        const EdgeInsets.only(left: 42.5, right: 42.5, top: 12.0, bottom: 12.0),
    child: new Theme(
      data: new ThemeData(
        primaryColor: Colors.white,
      ),
      child: TextField(
        controller: controller,
        decoration: new InputDecoration(
          enabledBorder: new OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          border: new OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          labelText: 'Instituição',
          labelStyle: TextStyle(color: Colors.white, fontSize: 26),
        ),
      ),
    ),
  );
}

Widget _voltarLogin(var context) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).popUntil((route) => route.isFirst);
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
