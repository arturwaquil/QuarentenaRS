import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:quarentena_rs/data/cityModel.dart';
import 'package:quarentena_rs/widgets/topBar.dart';
import 'package:url_launcher/url_launcher.dart';

import 'linkArray/laranja.dart';
import 'linkArray/vermelha.dart';

class Protocols extends StatelessWidget {
  final CityModel city;
  final Color green = Color.fromRGBO(0, 202, 32, 1);
  final Color altGreen = Colors.lightGreenAccent[400];

  final StorageReference protocols =
      FirebaseStorage.instance.ref().child('protocolos');

  final TextStyle style =
      TextStyle(fontSize: 23, fontWeight: FontWeight.normal);

  Protocols({Key key, @required this.city});

  //// download pdf file directly (not working)
  //void _downloadFile(String folder, String filename) async {
  //  String user = await AuthService().signInAnon();
  //
  //  if (user != null) {
  //    String tempDir = Directory.systemTemp.path;
  //    File localPdf = new File('$tempDir/$filename');
  //    print('$tempDir/$filename');
  //    protocols.child('$folder/$filename').writeToFile(localPdf);
  //  } else {
  //    print("can't download, user not signed in");
  //  }
  //}

  static List<String> getLinks(Bandeira bandeira) {
    switch (bandeira) {
      case Bandeira.VERMELHA:
        return getRedLinks();
      case Bandeira.LARANJA:
        return getOrangeLinks();
      default:
        return [];
    }
  }

  // open pdf link on browser
  void _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // ignore: non_constant_identifier_names
  Widget ProtocolsTile(
      {String title, String folder, String filename, Color color}) {
    return FlatButton(
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.normal),
        ),
      ),
      color: color,
      padding: EdgeInsets.all(3.0),
      onPressed: () async {
        // _downloadFile(folder, filename);
        _launchUrl(
            'https://distanciamentocontrolado.rs.gov.br/wp/wp-content/uploads/2020/$filename');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> links = getLinks(city.bandeira);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            TopBar(),
            SizedBox(height: 25),
            Text(
              city.cidade,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 35),
            ),
            SizedBox(height: 15),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: <Widget>[
                  ProtocolsTile(
                      title: 'Protocolos Gerais',
                      filename:
                          "06/Protocolos_especificacoes_versao_site_15-06-2020.pdf",
                      color: green),
                  ProtocolsTile(
                      title: 'Administação Pública',
                      filename: links.elementAt(0),
                      color: green),
                  ProtocolsTile(
                      title: 'Agropecuária',
                      filename: links.elementAt(1),
                      color: altGreen),
                  ProtocolsTile(
                      title: 'Alojamento e Alimentação',
                      filename: links.elementAt(2),
                      color: altGreen),
                  ProtocolsTile(
                      title: 'Comércio',
                      filename: links.elementAt(3),
                      color: green),
                  ProtocolsTile(
                      title: 'Educação',
                      filename: links.elementAt(4),
                      color: green),
                  ProtocolsTile(
                      title: 'Indústria',
                      filename: links.elementAt(5),
                      color: altGreen),
                  ProtocolsTile(
                      title: 'Saúde',
                      filename: links.elementAt(6),
                      color: altGreen),
                  ProtocolsTile(
                      title: 'Serviços',
                      filename: links.elementAt(7),
                      color: green),
                  ProtocolsTile(
                      title: 'Serviços de Informação e Comunicação',
                      filename: links.elementAt(8),
                      color: green),
                  ProtocolsTile(
                      title: 'Serviços de Utilidade Pública',
                      filename: links.elementAt(9),
                      color: altGreen),
                  ProtocolsTile(
                      title: 'Transportes',
                      filename: links.elementAt(10),
                      color: altGreen),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
