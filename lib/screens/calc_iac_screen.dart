import 'package:aula_imc/widgets/calc_iac_widget.dart';
import 'package:flutter/material.dart';

class CalculoIacScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("IMC e IAC"),
        backgroundColor: Colors.black87,
      ),
      body: CalculoIacWidget(),
    );
  }
}
