import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "Contador",
      home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int     _people = 0;
  String  _status = "Pode entrar";

  void _changePeople(int delta) {
    setState(() {
      _people += delta;

      if(_people < 0) {
        _status = "Cê tá doidoo!?";
      } else if(_people > 20) {
        _status = "Não tô fazendo nada";
      } else {
        _status = "Pode entrar";
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoass: $_people",
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FlatButton(
                    child: Text(
                      "-1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed: () {
                      debugPrint('-1');
                      _changePeople(-1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FlatButton(
                    child: Text(
                      "+1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed: () {
                      debugPrint('+1');
                      _changePeople(1);
                    },
                  ),
                )
              ],
            ),
            Text(
              _status,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontStyle: FontStyle.italic),
            )
          ],
        )
      ],
    );
  }
}

