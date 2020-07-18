import 'package:flutter/material.dart';
import 'package:quarentena_rs/screens/cityQuery.dart';
import 'package:quarentena_rs/screens/home.dart';
import 'package:quarentena_rs/screens/help.dart';
import 'package:quarentena_rs/screens/cityList.dart';
import 'package:quarentena_rs/screens/map.dart';

void main() => runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.light),
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
          '/help': (context) => Help(),
          '/map': (context) => Map(),
          '/cityQuery': (context) => CityQuery(),
          '/cityList': (context) => CityList(),
          // other screens go here
        }));
