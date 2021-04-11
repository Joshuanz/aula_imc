import 'package:aula_imc/screens/calc_imc_screen.dart';
import 'package:flutter/material.dart';

import 'calc_iac_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CalculoImcScreen(),
                    ),
                  );
                },
                child: Text(
                  'IMC',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CalculoIacScreen(),
                    ),
                  );
                },
                child: Text(
                  '   IAC   ',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
