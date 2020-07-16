import 'package:atividades_integradoras/telas/listaprojetos.dart';
import 'package:atividades_integradoras/telas/pesquisador.dart';
import 'package:flutter/material.dart';

class Passo3 extends StatefulWidget {
  var tipoUsuario = new List<String>();

  Passo3() {
    tipoUsuario = ['Investidor', 'Pesquisador'];
  }

  @override
  _Passo3State createState() => _Passo3State();
}

class _Passo3State extends State<Passo3> {
  var _currentTipo;

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
              "Passo 3 de 4",
              style: TextStyle(
                backgroundColor: Colors.white,
                color: Color.fromRGBO(124, 70, 192, 1.0),
                fontSize: 32,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
                left: 42.5, right: 42.5, top: 69.0, bottom: 52.0),
            child: Text(
              'Sou um ...',
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
          ),
          //Dropdown tipoUsuario
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
                        value: _currentTipo,
                        hint: Text(
                          'Selecione',
                          style: TextStyle(color: Colors.white),
                        ),
                        isDense: true,
                        onChanged: (String newValue) {
                          setState(() {
                            _currentTipo = newValue;
                            state.didChange(newValue);
                          });
                        },
                        style: TextStyle(fontSize: 26),
                        items: widget.tipoUsuario.map((String value) {
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
          //PROXIMO
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
                  ],
                ),
                onPressed: (){
                  if(_currentTipo=='Investidor'){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ListaProjetos()));
                  }
                  if(_currentTipo=='Pesquisador'){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Pesquisador()));                    
                  }
                },
              ),
            ),
          ),
          _voltarLogin(context)
        ],
      ),
    );
  }
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
