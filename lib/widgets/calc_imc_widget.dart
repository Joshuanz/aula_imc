import 'dart:math';

import 'package:flutter/material.dart';

class CalculoImcWidget extends StatefulWidget {
  @override
  _CalculoImcWidgetState createState() => _CalculoImcWidgetState();
}

class _CalculoImcWidgetState extends State<CalculoImcWidget> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController alturacontroller = TextEditingController();
  TextEditingController pesocontroller = TextEditingController();

  String _resultadoimc;
  int radioBtn = 0;
  int radioType = 0;

  void _handleRadioBtnValChange(int value) {
    setState(() {
      radioBtn = value;
    });
  }

  void _handleRadioTypeValChange(int value) {
    setState(() {
      radioType = value;
    });
  }

  void _calcularimc() {
    double altura = double.parse(alturacontroller.text) / 100;
    double peso = double.parse(pesocontroller.text);
    double imc = peso / pow(altura, 2);

    setState(() {
      _resultadoimc = imc.toStringAsFixed(2) + "\n" + getClassificacao(imc);
    });
  }

  String getClassificacao(num imc) {
    String strclassificacao;

    if (radioBtn == 1) {
      if (imc < 18.6)
        strclassificacao = "Abaixo do peso!!!";
      else if (imc < 25)
        strclassificacao = "Peso ideal!!!";
      else if (imc < 30)
        strclassificacao = "Pouco acima do peso!!!";
      else if (imc < 35)
        strclassificacao = "Obesidade grau 1!!!";
      else if (imc < 40)
        strclassificacao = "Obesidade grau 2!!!";
      else
        strclassificacao = "Obesidade grau 3!!!";
    } else {
      if (imc < 20)
        strclassificacao = "Abaixo do peso!!!";
      else if (imc < 24.9)
        strclassificacao = "Peso ideal!!!";
      else if (imc < 29.9)
        strclassificacao = "Pouco acima do peso!!!";
      else if (imc < 39.9)
        strclassificacao = "Obesidade grau 1!!!";
      else if (imc < 43)
        strclassificacao = "Obesidade grau 2!!!";
      else
        strclassificacao = "Obesidade grau 3!!!";
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
                    value: 0,
                    groupValue: radioType,
                    onChanged: _handleRadioTypeValChange,
                  ),
                  new Text("Calculo IMC"),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: 0,
                    groupValue: radioBtn,
                    onChanged: _handleRadioBtnValChange,
                  ),
                  new Text("Masculino"),
                  Radio(
                    value: 1,
                    groupValue: radioBtn,
                    onChanged: _handleRadioBtnValChange,
                  ),
                  new Text("Feminino")
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
                  controller: pesocontroller,
                  validator: (value) {
                    return value.isEmpty ? "Informe seu peso" : null;
                  },
                  decoration: InputDecoration(labelText: "Peso em Kg -"),
                ),
              ),
              visible: radioType == 0,
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: Text(_resultadoimc == null ? "" : "IAC - $_resultadoimc"),
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState.validate()) {
                    _calcularimc();
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
