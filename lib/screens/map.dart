import 'package:flutter/material.dart';
import 'package:pinch_zoom_image_last/pinch_zoom_image_last.dart';
import 'package:quarentena_rs/widgets/topBar.dart';

class Map extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            TopBar(),
            SizedBox(height: 15.0,),
            Text(
              'Mapa das regiões',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 35),
            ),
            Expanded(
              child: Center(
                child: PinchZoomImage(
                  image: Image.asset('assets/mapa_regioes.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
