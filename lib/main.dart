import 'package:flutter/material.dart';
import 'package:quarentena_rs/screens/home.dart';
import 'package:quarentena_rs/screens/help.dart';
import 'package:quarentena_rs/screens/map.dart';
import 'package:quarentena_rs/screens/infos/infos.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/help': (context) => Help(),
        '/map': (context) => Map(),
        '/infos': (context) => Infos(),
        // other screens go here
      }
    ));
