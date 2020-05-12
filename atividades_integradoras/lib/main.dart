import 'package:flutter/material.dart';

void main() => runApp(AtividadeIntegradora());

class AtividadeIntegradora extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ativdades Integradoras",
      home: TelaInicial(),
    );
  }
}

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(124, 70, 192, 1.0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Image.asset(
            'assets/inicial.png',
            height: 320,
            width: 360,
          ),
          SizedBox(height: 12),
          Text(
            "Login",
            style: TextStyle(
              fontSize: 32,
              color: Colors.white,
            ),
          ),

          Container(
            padding: const EdgeInsets.only(
                left: 42.5, right: 42.5, top: 12.0, bottom: 12.0),
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
          ),

          Container(
            padding: const EdgeInsets.only(
                left: 42.5, right: 42.5, top: 12.0, bottom: 12.0),
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
          ),
          
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
                child: Text('Sign in', style: TextStyle(fontSize: 26)),
                onPressed: () {},
              ),
            ),
          ),

          GestureDetector(
            onTap: (){
              //Navigator.pushNamed(context, routeName);
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('data'),
                ),
              );
            },
            child: Text(
              'Faça seu cadastro gratuito', 
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
