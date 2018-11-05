import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(32.0),
            child: Icon(Icons.person_outline, size: 120.0, color: Colors.green)
          ),
          TextField(keyboardType: TextInputType.number, decoration: InputDecoration(
            labelText: "Peso (Kg)",
            labelStyle: TextStyle(color: Colors.green)
          ),),
          TextField(keyboardType: TextInputType.number, decoration: InputDecoration(
              labelText: "Peso (Kg)",
              labelStyle: TextStyle(color: Colors.green)
          ),),
          Container(
            height: 48.0,
            child: RaisedButton(
              onPressed: (){},
              child: Text("Calcular", style: TextStyle(color: Colors.white, fontSize: 25.0),),
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}
