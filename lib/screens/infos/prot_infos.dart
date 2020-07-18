import 'package:flutter/material.dart';
import 'package:quarentena_rs/widgets/topBar.dart';

class Protocols extends StatelessWidget {

  final Color green = Color.fromRGBO(0, 202, 32, 1);
  final Color red = Color.fromRGBO(255, 0, 0, 1);
  final Color yellow = Color.fromRGBO(255, 199, 0, 1);

  final TextStyle style = TextStyle(fontSize: 23, fontWeight: FontWeight.normal);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            TopBar(),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: <Widget>[
                  Container(
                    child: Center(child: Text('Administração Pública', textAlign: TextAlign.center, style: style,)),
                    color: green,
                  ),
                  Container(
                    child: Center(child: Text('Agropecuária', textAlign: TextAlign.center, style: style,)),
                    color: green,
                  ),
                  Container(
                    child: Center(child: Text('Alojamento e Alimentação', textAlign: TextAlign.center, style: style,)),
                    color: red,
                  ),
                  Container(
                    child: Center(child: Text('Comércio', textAlign: TextAlign.center, style: style,)),
                    color: red,
                  ),
                  Container(
                    child: Center(child: Text('Educação', textAlign: TextAlign.center, style: style,)),
                    color: yellow,
                  ),
                  Container(
                    child: Center(child: Text('Indústria', textAlign: TextAlign.center, style: style,)),
                    color: yellow,
                  ),
                  Container(
                    child: Center(child: Text('Saúde', textAlign: TextAlign.center, style: style,)),
                    color: green,
                  ),
                  Container(
                    child: Center(child: Text('Serviços', textAlign: TextAlign.center, style: style,)),
                    color: green,
                  ),
                  Container(
                    child: Center(child: Text('Serviços de Informação e Comunicação', textAlign: TextAlign.center, style: style,)),
                    color: red,
                  ),
                  Container(
                    child: Center(child: Text('Serviços de Utilidade Pública', textAlign: TextAlign.center, style: style,)),
                    color: red,
                  ),
                  Container(
                    child: Center(child: Text('Transportes', textAlign: TextAlign.center, style: style,)),
                    color: yellow,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
