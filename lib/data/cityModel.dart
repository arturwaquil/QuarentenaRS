// To parse this JSON data, do
//
//     final cityModel = cityModelFromJson(jsonString);

import 'dart:convert';

import 'dart:io';

final File file = new File('cities.json');

Future<List<CityModel>> cityModelFromJson() async => List<CityModel>.from(json
    .decode(await file.readAsString(encoding: utf8))
    .map((x) => CityModel.fromJson(x)));

String cityModelToJson(List<CityModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CityModel {
  CityModel({
    this.cidade,
    this.regiao,
    this.bandeira,
  });

  String cidade;
  Regiao regiao;
  Bandeira bandeira;

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        cidade: json["cidade"],
        regiao: regiaoValues.map[json["regiao"]],
        bandeira: bandeiraValues.map[json["bandeira"]],
      );

  Map<String, dynamic> toJson() => {
        "cidade": cidade,
        "regiao": regiaoValues.reverse[regiao],
        "bandeira": bandeiraValues.reverse[bandeira],
      };
}

enum Bandeira { VERMELHA, LARANJA, AMARELA, PRETA }

final bandeiraValues = EnumValues({
  "Laranja": Bandeira.LARANJA,
  "Vermelha": Bandeira.VERMELHA,
  "Amarela": Bandeira.AMARELA,
  "Preta": Bandeira.PRETA
});

enum Regiao {
  R01_R02,
  R03,
  R04_R05,
  R06,
  R07,
  R08,
  R09_R10,
  R11,
  R12,
  R13,
  R14,
  R15_R20,
  R16,
  R17_R18_R19,
  R21,
  R22,
  R23_R24_R25_R26,
  R27,
  R28,
  R29_R30
}

final regiaoValues = EnumValues({
  "R01/R02": Regiao.R01_R02,
  "R03": Regiao.R03,
  "R04/R05": Regiao.R04_R05,
  "R06": Regiao.R06,
  "R07": Regiao.R07,
  "R08": Regiao.R08,
  "R09/R10": Regiao.R09_R10,
  "R11": Regiao.R11,
  "R12": Regiao.R12,
  "R13": Regiao.R13,
  "R14": Regiao.R14,
  "R15/R20": Regiao.R15_R20,
  "R16": Regiao.R16,
  "R17/R18/R19": Regiao.R17_R18_R19,
  "R21": Regiao.R21,
  "R22": Regiao.R22,
  "R23/R24/R25/R26": Regiao.R23_R24_R25_R26,
  "R27": Regiao.R27,
  "R28": Regiao.R28,
  "R29/R30": Regiao.R29_R30
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
