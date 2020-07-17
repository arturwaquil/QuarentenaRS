import 'package:flutter/material.dart';
import 'widgets/logo.dart';

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
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 40.0,
            ),
            Logo(),
            FlatButton(
              onPressed: () {},
              child: Text('CONSULTAR CIDADE'),
              color: Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }
}
