import 'package:flutter/material.dart';
import 'package:quarentena_rs/widgets/button.dart';
import 'package:quarentena_rs/widgets/logo.dart';
import 'package:quarentena_rs/widgets/topBar.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light),
      home: Home(),
    ));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: TopBar(),
      ),
    );
  }
}
