import 'package:flutter/material.dart';
import 'package:quarentena_rs/data/cityModel.dart';
import 'package:quarentena_rs/widgets/topBar.dart';

class GeneralInfos extends StatelessWidget {
  final CityModel city;
  GeneralInfos({Key key, @required this.city});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            TopBar(),
            SizedBox(height: 25),
            Text(
              city.cidade,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 35),
            ),
            SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'BANDEIRA: ',
                  style: TextStyle(fontSize: 27),
                ),
                Text(
                  city.bandeira.toString().split('.').last,
                  style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: flagColor(city.bandeira)),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'REGIÃO: ',
                  style: TextStyle(fontSize: 27),
                ),
                Text(
                  city.regiao.toString().split('.').last,
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              'ÚLTIMAS BANDEIRAS:',
              style: TextStyle(fontSize: 27),
            ),
            Text(
              '31/05-06/06: LARANJA',
              style: TextStyle(fontSize: 22),
            ),
            Text(
              '24/05-30/05: AMARELA',
              style: TextStyle(fontSize: 22),
            ),
            Text(
              '17/05-23/05: AMARELA',
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(height: 30),
            Text('ETC')
          ],
        ),
      ),
    );
  }

  MaterialColor flagColor(Bandeira bandeira) {
    switch (bandeira) {
      case Bandeira.AMARELA:
        return Colors.yellow;
      case Bandeira.LARANJA:
        return Colors.orange;
      case Bandeira.VERMELHA:
        return Colors.red;
      case Bandeira.PRETA:
        return Colors.black;
    }
  }
}
