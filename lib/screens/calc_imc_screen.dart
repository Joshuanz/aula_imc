import 'package:aula_imc/widgets/calc_imc_widget.dart';
import 'package:flutter/material.dart';

class CalculoImcScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("IMC e IAC"),
        backgroundColor: Colors.black87,
      ),
      body: CalculoImcWidget(),
    );
  }
}
