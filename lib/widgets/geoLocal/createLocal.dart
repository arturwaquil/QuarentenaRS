import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quarentena_rs/widgets/geoLocal/geoResponse.dart';

Future<GeoResponseModel> createLocal(String latlng) async {
  final String apiUrl = "https://maps.googleapis.com/maps/api/geocode/json";

  final response = await http.post(apiUrl, body: {
    "key": "AIzaSyAuH36GeU9F707QXB1uU6v9Gua6WMvBLKk",
    "latlng": latlng,
    "language": "pt-BR",
    "result_type": "administrative_area_level_2",
  });

  if (response.statusCode == 200) {
    final String responseString = response.body;

    return geoResponseModelFromJson(responseString);
  } else {
    return null;
  }
}
