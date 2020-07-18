import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quarentena_rs/services/auth.dart';
import 'package:quarentena_rs/widgets/topBar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:url_launcher/url_launcher.dart';

class Protocols extends StatelessWidget {
  final Color green = Color.fromRGBO(0, 202, 32, 1);
  final Color red = Color.fromRGBO(255, 0, 0, 1);
  final Color yellow = Color.fromRGBO(255, 199, 0, 1);

  final StorageReference protocols =
      FirebaseStorage.instance.ref().child('protocolos');

  final TextStyle style =
      TextStyle(fontSize: 23, fontWeight: FontWeight.normal);

  // download pdf file directly (not working)
  void _downloadFile(String folder, String filename) async {
    String user = await AuthService().signInAnon();

    if (user != null) {
      String tempDir = Directory.systemTemp.path;
      File localPdf = new File('$tempDir/$filename');
      print('$tempDir/$filename');
      protocols.child('$folder/$filename').writeToFile(localPdf);
    } else {
      print("can't download, user not signed in");
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
        _launchUrl('https://distanciamentocontrolado.rs.gov.br/wp/wp-content/uploads/2020/06/$filename');
      },
    );
  }

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
                  ProtocolsTile(
                      title: 'Administação Pública',
                      folder: 'administracao_publica',
                      filename: 'Administracao_Publica_AMARELA-2.pdf',
                      color: green),
                  ProtocolsTile(
                      title: 'Agropecuária',
                      folder: 'administracao_publica',
                      filename: 'Administracao_Publica_AMARELA-2.pdf',
                      color: green),
                  ProtocolsTile(
                      title: 'Alojamento e Alimentação',
                      folder: 'administracao_publica',
                      filename: 'Administracao_Publica_AMARELA-2.pdf',
                      color: red),
                  ProtocolsTile(
                      title: 'Comércio',
                      folder: 'administracao_publica',
                      filename: 'Administracao_Publica_AMARELA-2.pdf',
                      color: red),
                  ProtocolsTile(
                      title: 'Educação',
                      folder: 'administracao_publica',
                      filename: 'Administracao_Publica_AMARELA-2.pdf',
                      color: yellow),
                  ProtocolsTile(
                      title: 'Indústria',
                      folder: 'administracao_publica',
                      filename: 'Administracao_Publica_AMARELA-2.pdf',
                      color: yellow),
                  ProtocolsTile(
                      title: 'Saúde',
                      folder: 'administracao_publica',
                      filename: 'Administracao_Publica_AMARELA-2.pdf',
                      color: green),
                  ProtocolsTile(
                      title: 'Serviços',
                      folder: 'administracao_publica',
                      filename: 'Administracao_Publica_AMARELA-2.pdf',
                      color: green),
                  ProtocolsTile(
                      title: 'Serviços de Informação e Comunicação',
                      folder: 'administracao_publica',
                      filename: 'Administracao_Publica_AMARELA-2.pdf',
                      color: red),
                  ProtocolsTile(
                      title: 'Serviços de Utilidade Pública',
                      folder: 'administracao_publica',
                      filename: 'Administracao_Publica_AMARELA-2.pdf',
                      color: red),
                  ProtocolsTile(
                      title: 'Transportes',
                      folder: 'administracao_publica',
                      filename: 'Administracao_Publica_AMARELA-2.pdf',
                      color: yellow),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
