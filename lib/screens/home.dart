import 'package:flutter/material.dart';
import 'package:quarentena_rs/widgets/button.dart';
import 'package:quarentena_rs/widgets/logo.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Logo(),
            SizedBox(
              height: 90,
            ),
            Button(
              text: 'CONSULTAR CIDADE',
              onPressed: () {},
            ),
            Button(
              text: 'MAPA DAS REGIÕES',
              onPressed: () {},
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/help');
          },
          child: Text(
            '?',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 29.0,
                color: Colors.black),
          ),
          backgroundColor: Colors.grey[300],
          elevation: 0,
        ),
      ),
    );
  }
}