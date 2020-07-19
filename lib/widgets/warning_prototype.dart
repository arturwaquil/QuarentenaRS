import 'package:flutter/material.dart';

class WarningPrototype extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          'Este aplicativo é um protótipo e foi atualizado pela última vez no dia 18/07/2020',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
      );
  }
}
