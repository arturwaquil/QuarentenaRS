import 'package:flutter/material.dart';
import 'package:quarentena_rs/widgets/topBar.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            TopBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // title
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            child: Text(
                              '?',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 29.0,
                                  color: Colors.black),
                            ),
                            backgroundColor: Colors.grey[300],
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Ajuda',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 35),
                          )
                        ],
                      ),
                      SizedBox(height: 20.0),
                      //content
                      Text(
                        'Tela inicial',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20.0),

                      Text(
                          "Este aplicativo tem como objetivo trazer informações sobre os Protocolos e medidas do Governo do Estado do Rio Grande do Sul relacionadas a pandemia do Covid-19."),
                      Text(
                          "Para isso duas funcionalidades foram implementadas: "),
                      Text(
                          "A primeira, Consultar cidade, permite que o usuário insira sua cidade, selecionando da lista ou utilizando o GPS do aparelho, e receba a sua bandeira, uma explicação dela e os protocolos associados a cada setor da economia"),
                      Text(
                          "A segunda, Mapa das Regiões, permite que o usuário acesse um mapa geral do estado com as bandeiras atuais em cada região.")
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
