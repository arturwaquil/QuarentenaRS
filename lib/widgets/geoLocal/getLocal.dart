import 'package:http/http.dart' as http;
import 'package:quarentena_rs/widgets/geoLocal/geoResponse.dart';

Future<String> getLocal(String latlng) async {
  final String key = "AIzaSyAuH36GeU9F707QXB1uU6v9Gua6WMvBLKk";
  final String language = "pt-BR";
  final String resultType = "administrative_area_level_2";
  final String apiUrl =
      "https://maps.googleapis.com/maps/api/geocode/json?latlng=${latlng}&key=${key}&language=${language}&result_type${resultType}";
  final response = await http.get(apiUrl);

  String cityName;
  GeoResponseModel local = geoResponseModelFromJson(response.body);
  local.results.forEach((element) => {
        element.addressComponents.forEach((element) {
          if (element.types.contains("administrative_area_level_2")) {
            cityName = element.longName;
          }
        })
      });
  return cityName;
}
