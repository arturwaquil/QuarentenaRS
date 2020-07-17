import 'package:flutter/material.dart';
import 'package:quarentena_rs/screens/help.dart';
import 'package:quarentena_rs/screens/home.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/help': (context) => Help(),
        // other screens go here
      }
    ));
