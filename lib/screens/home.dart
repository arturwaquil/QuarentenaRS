import 'package:flutter/material.dart';
import 'package:quarentena_rs/widgets/button.dart';
import 'package:quarentena_rs/widgets/logo.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: <Widget>[
          Expanded(
            flex: 9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Logo(),
                SizedBox(
                  height: 90,
                ),
                Button(
                  text: 'CONSULTAR CIDADE',
                  onPressed: () {
                    Navigator.pushNamed(context, '/cityQuery');
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Button(
                  text: 'MAPA DO ESTADO',
                  onPressed: () {
                    Navigator.pushNamed(context, '/map');
                  },
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.fromLTRB(5, 10, 100, 10),
              child: Text(
                'Este aplicativo é um protótipo e foi atualizado pela ultima vez no dia 18/07/2020',
              ),
            ),
          ),
        ]),
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
