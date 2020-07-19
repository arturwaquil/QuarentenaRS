import 'package:flutter/material.dart';
import 'package:quarentena_rs/data/cityModel.dart';
import 'package:quarentena_rs/widgets/topBar.dart';
import 'package:quarentena_rs/widgets/warning_prototype.dart';

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                city.cidade,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 35),
              ),
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
            SizedBox(height: 10),
            Padding(
                padding: EdgeInsets.all(30),
                child: getFlagExplanation(city.bandeira)),
            Padding(
              padding: EdgeInsets.all(30),
              child: WarningPrototype(),
            )
          ],
        ),
      ),
    );
  }

  // ignore: missing_return
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

  // ignore: missing_return
  Column getFlagExplanation(Bandeira bandeira) {
    switch (bandeira) {
      case Bandeira.LARANJA:
        return Column(
          children: <Widget>[
            Text("A região encontra-se em um dos dois cenários: ",
                textAlign: TextAlign.justify, style: TextStyle(fontSize: 25)),
            Text(
                "1- Média capacidade do sistema de saúde e baixa propagação do vírus",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 25)),
            Text(
                "2- Alta capacidade do sistema de saúde e média propagação do vírus.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 25))
          ],
        );
      case Bandeira.VERMELHA:
        return Column(
          children: <Widget>[
            Text("A região encontra-se em um dos dois cenários: ",
                textAlign: TextAlign.justify, style: TextStyle(fontSize: 25)),
            Text(
                "1 - Baixa capacidade do sistema de saúde e média propagação do vírus",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 25)),
            Text(
                "2 - Média/alta capacidade do sistema de saúde, porém alta propagação do vírus.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 25))
          ],
        );
      case Bandeira.AMARELA:
        // TODO: Handle this case.
        break;
      case Bandeira.PRETA:
        // TODO: Handle this case.
        break;
    }
  }
}
