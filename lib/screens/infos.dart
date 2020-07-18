import 'package:flutter/material.dart';
import 'package:quarentena_rs/screens/gen_infos.dart';
import 'package:quarentena_rs/screens/prot_infos.dart';

// ignore: must_be_immutable
class Infos extends StatefulWidget {
  String city;
  Infos({String city}) {
    this.city = city;
  }
  @override
  _InfosState createState() => _InfosState();
}

class _InfosState extends State<Infos> {
  int _currentIndex = 0;
  final tabs = [GeneralInfos(), Protocols()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                'GERAL',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              title: Text(
                'PROTOCOLOS',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor:
              Color.fromRGBO(0, 202, 32, 1), // same green as the logo
          backgroundColor: Colors.grey[300],
        ),
      ),
    );
  }
}
