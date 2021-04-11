import 'dart:math';

import 'package:flutter/material.dart';

class CalculoIacWidget extends StatefulWidget {
  @override
  _CalculoImcWidgetState createState() => _CalculoImcWidgetState();
}

class _CalculoImcWidgetState extends State<CalculoIacWidget> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController alturacontroller = TextEditingController();
  TextEditingController pesocontroller = TextEditingController();
  TextEditingController circunferenciacontroller = TextEditingController();

  String _resultadoiac;
  int radioBtn = 0;
  int radioType = 0;

  void _handleRadioTypeValChange(int value) {
    setState(() {
      radioType = value;
    });
  }

  void _calculariac() {
    double altura = double.parse(alturacontroller.text) / 100;
    double circunferencia = double.parse(circunferenciacontroller.text);
    double iac = circunferencia / altura * sqrt(altura);

    setState(() {
      _resultadoiac = iac.toStringAsFixed(2) + "\n" + getClassificacaoIAC(iac);
    });
  }

  String getClassificacaoIAC(num iac) {
    String strclassificacao;

    if (radioBtn == 0) {
      if (iac < 8)
        strclassificacao = "Abaixo do normal!!!";
      else if (iac < 20.9)
        strclassificacao = "Adiposidade está normal!!!";
      else if (iac < 25)
        strclassificacao = "Com sobrepeso!!!";
      else
        strclassificacao = "Obesidade!!!";
    } else {
      if (iac < 21)
        strclassificacao = "Abaixo do normal!!!";
      else if (iac < 32.9)
        strclassificacao = "Adiposidade está normal!!!";
      else if (iac < 38)
        strclassificacao = "Com sobrepeso!!!";
      else
        strclassificacao = "Obesidade!!!";
    }

    return strclassificacao;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: 1,
                    groupValue: radioType,
                    onChanged: _handleRadioTypeValChange,
                  ),
                  new Text("Calculo IAC")
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: alturacontroller,
                validator: (value) {
                  return value.isEmpty ? "Informe sua altura" : null;
                },
                decoration: InputDecoration(labelText: "Altura em cm -"),
              ),
            ),
            Visibility(
              child: Container(
                margin: EdgeInsets.all(16),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: circunferenciacontroller,
                  validator: (value) {
                    return value.isEmpty
                        ? "Informe sua circunferência de quadril"
                        : null;
                  },
                  decoration:
                      InputDecoration(labelText: "Circunferência de quadril -"),
                ),
              ),
              visible: radioType == 1,
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: Text(_resultadoiac == null ? "" : "IAC - $_resultadoiac"),
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState.validate()) {
                    _calculariac();
                  }
                },
                child: Text("Fazer calculo"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
