import 'package:flutter/material.dart';
import 'package:quarentena_rs/data/cityModel.dart';
import 'package:quarentena_rs/screens/infos/gen_infos.dart';
import 'package:quarentena_rs/screens/infos/prot_infos.dart';

// ignore: must_be_immutable
class Infos extends StatefulWidget {
  CityModel city;
  static CityModel modelo = new CityModel();

  Infos({CityModel city}) {
    this.city = city;
  }
  @override
  _InfosState createState() => _InfosState(city: city);
}

class _InfosState extends State<Infos> {
  CityModel city;
  _InfosState({CityModel city}) {
    this.city = city;
  }
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [GeneralInfos(city: city), Protocols(city: city)];
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
