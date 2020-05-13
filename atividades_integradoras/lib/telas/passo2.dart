import 'package:flutter/material.dart';

class Passo2 extends StatefulWidget {
  var estados = new List<String>();

  Passo2() {
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
  }
  @override
  _Passo2State createState() => _Passo2State();
}

class _Passo2State extends State<Passo2> {
  var _currentSelectedValue;
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
                canvasColor: Colors.black,
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
                            child: Text(value,style: TextStyle(),),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
