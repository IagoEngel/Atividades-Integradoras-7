import 'package:flutter/material.dart';

class FiltrarPesquisa extends StatefulWidget {
  var instituicao = new List<String>();

  FiltrarPesquisa() {
    instituicao = ['Unifenas', 'Unicamp', 'Unifal'];
  }

  @override
  _FiltrarPesquisaState createState() => _FiltrarPesquisaState();
}

class _FiltrarPesquisaState extends State<FiltrarPesquisa> {
  var _currentInstituicao;
  TextEditingController _controllerCusto = new TextEditingController();
  TextEditingController _controllerPConclusao = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(124, 70, 192, 1.0),
        title: Text('Filtro de pesquisa'),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Container(
            color: Color.fromRGBO(240, 240, 245, 1.0),

            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                children: <Widget>[
                  //DROPDOWN INSTITUIÇÃO
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(
                        top: 10, left: 20, right: 20, bottom: 10),
                    child: new Theme(
                      data: new ThemeData(
                        canvasColor: Colors.white70,
                      ),
                      child: FormField<String>(
                        builder: (FormFieldState<String> state) {
                          return InputDecorator(
                            decoration: InputDecoration(
                              hintStyle: TextStyle(fontSize: 26),
                              enabledBorder: new OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(124, 70, 192, 1.0),
                                    width: 3),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                icon: Icon(Icons.keyboard_arrow_down),
                                value: _currentInstituicao,
                                hint: Text('Instituição'),
                                isDense: true,
                                onChanged: (String newValue) {
                                  setState(() {
                                    _currentInstituicao = newValue;
                                    state.didChange(newValue);
                                  });
                                },
                                style: TextStyle(fontSize: 26),
                                items: widget.instituicao.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(color: Colors.black),
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
                  _camposAtributos(_controllerCusto, 'Custo'),
                  _camposAtributos(_controllerPConclusao, 'Prazo de conclusão'),
                  _camposAtributos(null, 'Selecione um ou mais temas'),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 42.0,
                      bottom: 12.0,
                    ),
                    child: SizedBox(
                      height: 66,
                      width: double.infinity,
                      child: RaisedButton(
                        color: Color.fromRGBO(124, 70, 192, 1.0),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: Text(
                          'Filtrar',
                          style: TextStyle(color: Colors.white,fontSize: 26),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _camposAtributos(var controller, String nome) {
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
      title: TextField(
        decoration: new InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          labelText: nome,
          labelStyle: TextStyle(
            fontSize: 26,
          ),
        ),
        controller: controller,
      ),
    ),
  );
}
