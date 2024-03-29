import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: 'Contador de Pessoas',
      //home: Container(color: Colors.teal)
      home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _pessoas = 0;
  String _infoText = 'Pode Entrar!';
  
  void _mudarPessoas(int delta) {
    setState(() {
      _pessoas += delta;
      
       if (_pessoas < 0) {
         _infoText = '';
       } else if (_pessoas < 10) {
         _infoText = 'Pode Entrar!';
       } else {
          _infoText = 'Lotado!';
       }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Image.asset(
            'images/restaurant_background.jpg',
            fit: BoxFit.cover,
            height: 1000.0,
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Pessoas: $_pessoas',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: FlatButton(
                          child: Text(
                            '+1',
                            style:
                                TextStyle(color: Colors.white, fontSize: 40.0),
                          ),
                          onPressed: () {
                            _mudarPessoas(1);
                          },
                        )),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: FlatButton(
                          child: Text(
                            '-1',
                            style:
                                TextStyle(color: Colors.white, fontSize: 40.0),
                          ),
                          onPressed: () {
                            _mudarPessoas(-1);
                          },
                        )),
                  ],
                ),
                Text(_infoText,
                    style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: 30.0)),
              ])
        ],
      );
  }
}


