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

                      Paragraph(
                          "O app QuarentenaRS foi desenvolvido para ajudar a comunicar as informações sobre o Distanciamento Controlado, plano do governo estadual para o combate à pandemia de COVID-19."),
                      Paragraph(
                          "O estado foi dividido em vinte regiões, que são analisadas levando em conta a velocidade de propagação da COVID-19 e a capacidade de atendimento dos seus sistemas de saúde."),
                      Paragraph(
                          "As bandeiras representam o grau de risco de cada região: a amarela é de menor risco, seguida pela laranja e pela vermelha, e a preta é a de maior risco."),

                      Title('Tela inicial'),
                      // ImageWithBorder('assets/help/home.jpg'),
                      Paragraph(
                          "A opção de CONSULTAR CIDADE permite acessar as informações de cada cidade, como a sua bandeira. A opção MAPA DO ESTADO permite visualizar a situação geral do estado, com cada região colorida de acordo com a sua bandeira."),

                      Title('Consultar cidade'),
                      Paragraph(
                          "Nesta tela é possível selecionar uma cidade de duas maneiras."),
                      ImageWithBorder('assets/help/cityquery_select.jpg'),
                      Paragraph(
                          "Selecionando TROCAR CIDADE, é aberta uma lista com os municípios do estado, e o usuário pode pesquisar pela sua cidade."),
                      Paragraph(
                          "Com a opção DETECTAR LOCALIZAÇÃO é possível selecionar automaticamente a cidade a partir do GPS do celular."),
                      ImageWithBorder('assets/help/cityquery_ok.jpg'),
                      Paragraph(
                          "Após a seleção da cidade, o usuário deve clicar no botão OK para seguir para a próxima tela."),

                      Title('Informações gerais e protocolos'),
                      Paragraph(
                          "Aqui são exibidas as informações relacionadas à cidade selecionada."),
                      ImageWithBorder('assets/help/infos.jpg'),
                      Paragraph(
                          "Na aba GERAL, são exibidas informações da cidade: sua região, sua bandeira e a descrição da bandeira."),
                      Paragraph("Na aba PROTOCOLOS é possível acessar as diretrizes do governo estadual sobre cada setor econômico para a bandeira da cidade selecionada."),

                      Title('Mapa do estado'),
                      Paragraph("Nesta tela o usuário pode visualizar como está o avanço da COVID-19 pelo estado. O mapa, que pode ser aproximado para ver em maior detalhe, exibe cada região com a cor de sua respectiva bandeira."),

                      Divider(indent: 30, endIndent: 30, thickness: 2, height: 40,),

                      Paragraph('App feito por Artur Waquil Campana e Carlos Santiago'),
                      Paragraph('Versão 0.1'),


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

class Title extends StatelessWidget {
  String text;
  Title(this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 20.0),
        Text(
          text,
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class Paragraph extends StatelessWidget {
  String text;
  Paragraph(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class ImageWithBorder extends StatelessWidget {
  String path;
  ImageWithBorder(this.path);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xff7c94b6),
            border: Border.all(
              color: Color.fromRGBO(0, 202, 32, 1),
              width: 3.0,
            ),
          ),
          child: Image.asset(
            path,
            height: 150,
          ),
        ),
      ),
    );
  }
}
