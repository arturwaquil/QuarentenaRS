import 'package:flutter/material.dart';
import 'package:quarentena_rs/data/cityModel.dart';
import 'package:quarentena_rs/screens/infos/infos.dart';
import 'package:quarentena_rs/widgets/button.dart';
import 'package:quarentena_rs/widgets/geoLocal/getLocal.dart';
import 'package:quarentena_rs/widgets/topBar.dart';
import 'package:location/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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

  String city = 'Porto Alegre';

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            TopBar(),
            SizedBox(
              height: 15.0,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70.0),
                    child: Text(
                      'Consultar informações sobre:',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 28),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          city,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Color.fromRGBO(0, 202, 32, 1)),
                        ),
                        !loading
                            ? SizedBox(
                                width: 0,
                              )
                            : Row(
                                children: <Widget>[
                                  SizedBox(width: 20),
                                  SpinKitRing(
                                    color: Color.fromRGBO(0, 202, 32, 1),
                                    size: 30,
                                    lineWidth: 5,
                                  )
                                ],
                              ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  FlatButton(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "OK",
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 20.0),
                    ),
                    onPressed: () async {
                      List<CityModel> cities = await cityModelFromJson();
                      CityModel cityModel = cities
                          .where((citymodel) => citymodel.cidade == city)
                          .elementAt(0);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Infos(city: cityModel),
                        ),
                      );
                    },
                    color: Colors.grey[300],
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Button(
                  text: 'TROCAR CIDADE',
                  onPressed: () async {
                    final cityFromList = await Navigator.push(
                        context,
                        MaterialPageRoute<String>(
                            builder: (context) => CityList()));
                    setState(() {
                      city = cityFromList != null ? cityFromList : city;
                    });
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Button(
                  text: 'DETECTAR LOCALIZAÇÃO',
                  onPressed: () async {
                    setState(() {
                      loading = true;
                    });

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
                    if (this.mounted)
                      setState(() {
                        city = cityFromGPS;
                        loading = false;
                      });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
