import 'package:flutter/material.dart';
import 'package:quarentena_rs/widgets/topBar.dart';

class Consulta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            TopBar(),
          ],
        ),
      ),
    );
  }
}
