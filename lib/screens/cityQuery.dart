import 'package:flutter/material.dart';
import 'package:quarentena_rs/screens/infos.dart';
import 'package:quarentena_rs/widgets/button.dart';
import 'package:quarentena_rs/widgets/geoLocal/getLocal.dart';
import 'package:quarentena_rs/widgets/topBar.dart';
import 'package:location/location.dart';

import 'cityList.dart';

class CityQuery extends StatefulWidget {
  @override
  _CityQueryState createState() => _CityQueryState();
}

class _CityQueryState extends State<CityQuery> {
  Location location = new Location();

  bool _serviceEnabled;

  PermissionStatus _permissionGranted;

  LocationData _locationData;

  String city;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            TopBar(),
            Button(
              text: 'INSERIR CIDADE',
              onPressed: () async {
                final cityFromList = await Navigator.push(
                    context,
                    MaterialPageRoute<String>(
                        builder: (context) => CityList()));
                setState(() {
                  city = cityFromList;
                });
              },
            ),
            Divider(),
            Button(
              text: 'DETECTAR USANDO O GPS',
              onPressed: () async {
                _serviceEnabled = await location.serviceEnabled();
                if (!_serviceEnabled) {
                  _serviceEnabled = await location.requestService();
                  if (!_serviceEnabled) {
                    return;
                  }
                }

                _permissionGranted = await location.hasPermission();
                if (_permissionGranted == PermissionStatus.denied) {
                  _permissionGranted = await location.requestPermission();
                  if (_permissionGranted != PermissionStatus.granted) {
                    return;
                  }
                }

                _locationData = await location.getLocation();
                String cityFromGPS = await getLocal(
                    "${_locationData.latitude},${_locationData.longitude}");
                setState(() {
                  city = cityFromGPS;
                });
              },
            ),
            Row(children: <Widget>[
              Text("CIDADE: $city"),
              Button(
                text: "CONSULTAR",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Infos(
                              city: city,
                            )),
                  );
                },
              ),
            ])
          ],
        ),
      ),
    );
  }
}
