import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String text = 'Informe seus dados';

  TextEditingController weightController = TextEditingController();
  TextEditingController widthController = TextEditingController();

  void _resetFields() {
    weightController.text = '';
    widthController.text = '';

    setState(() {
      this.text = 'Informe seus dados';
    });
  }

  void _calculate() {
    setState(() {

      double weight = double.parse(weightController.text);
      double height = double.parse(widthController.text) / 100;
      double imc = weight / (height * height);
      print('weight $weight');
      print('height $height');
      print(imc);

      if (imc < 18.6) {
        this.text = 'Abaixo do Peso (${imc.toStringAsPrecision(2)})';
      } else if (imc >= 18.6 && imc < 24.9) {
        this.text = 'Peso ideal (${imc.toStringAsPrecision(2)})';
      } else if (imc >= 24.9 && imc < 29.9) {
        this.text = 'Levemente Acima do Peso(${imc.toStringAsPrecision(2)})';
      } else if (imc >= 29.9 && imc < 34.9) {
        this.text = 'Obesidade Grau I (${imc.toStringAsPrecision(2)})';
      } else if (imc >= 34.9 && imc < 39.9) {
        this.text = 'Obesidade Grau II (${imc.toStringAsPrecision(2)})';
      } else {
        this.text = 'Obesidade Grau III (${imc.toStringAsPrecision(2)})';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              this._resetFields();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(32.0),
                child:
                Icon(Icons.person_outline, size: 120.0, color: Colors.green)),
            TextField(
              keyboardType: TextInputType.number,
              controller: weightController,
              decoration: InputDecoration(
                  labelText: "Peso (Kg)",
                  labelStyle: TextStyle(color: Colors.green)),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: widthController,
              decoration: InputDecoration(
                  labelText: "Altura (cm)",
                  labelStyle: TextStyle(color: Colors.green)),
            ),
            Container(
              height: 48.0,
              margin: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
              child: RaisedButton(
                onPressed: () {
                  this._calculate();
                },
                child: Text(
                  "Calcular",
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                ),
                color: Colors.green,
              ),
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 16.0),
            )
          ],
        ),
      )
    );
  }
}
