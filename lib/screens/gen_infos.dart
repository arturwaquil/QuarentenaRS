import 'package:flutter/material.dart';
import 'package:quarentena_rs/widgets/topBar.dart';

class GeneralInfos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            TopBar(),
            SizedBox(height: 25),
            Text(
              'PORTO ALEGRE',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 35),
            ),
            SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('BANDEIRA: ', style: TextStyle(fontSize: 27),),
                Text('LARANJA', style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold, color: Colors.orange),),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('REGIÃO: ', style: TextStyle(fontSize: 27),),
                Text('R09, R10', style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: 30),
            Text('ÚLTIMAS BANDEIRAS:', style: TextStyle(fontSize: 27),),
            Text('31/05-06/06: LARANJA', style: TextStyle(fontSize: 22),),
            Text('24/05-30/05: AMARELA', style: TextStyle(fontSize: 22),),
            Text('17/05-23/05: AMARELA', style: TextStyle(fontSize: 22),),

            SizedBox(height: 30),
            Text('ETC')
          ],
        ),
      ),
    );
  }
}
