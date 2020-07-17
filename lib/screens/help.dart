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
                          '''Os grupos deverão apresentar a etapa de projeto e prototipação dos seus trabalhos nas aulas desta semana, incluindo uma demo do protótipo.

A ordem de apresentação será definida por mim, no dia da apresentação. Segue algumas instruções:

- submetam por esta atividade os slides da apresentação, incluindo um cronograma para a conclusão do projeto e o indicativo de quanto % da implementação já está concluída.'''),
                      Text(
                          '''Os grupos deverão apresentar a etapa de projeto e prototipação dos seus trabalhos nas aulas desta semana, incluindo uma demo do protótipo.

A ordem de apresentação será definida por mim, no dia da apresentação. Segue algumas instruções:

- submetam por esta atividade os slides da apresentação, incluindo um cronograma para a conclusão do projeto e o indicativo de quanto % da implementação já está concluída.'''),
                      Text(
                          '''Os grupos deverão apresentar a etapa de projeto e prototipação dos seus trabalhos nas aulas desta semana, incluindo uma demo do protótipo.

A ordem de apresentação será definida por mim, no dia da apresentação. Segue algumas instruções:

- submetam por esta atividade os slides da apresentação, incluindo um cronograma para a conclusão do projeto e o indicativo de quanto % da implementação já está concluída.'''),
                      Text(
                          '''Os grupos deverão apresentar a etapa de projeto e prototipação dos seus trabalhos nas aulas desta semana, incluindo uma demo do protótipo.

A ordem de apresentação será definida por mim, no dia da apresentação. Segue algumas instruções:

- submetam por esta atividade os slides da apresentação, incluindo um cronograma para a conclusão do projeto e o indicativo de quanto % da implementação já está concluída.'''),
                      Text(
                          '''Os grupos deverão apresentar a etapa de projeto e prototipação dos seus trabalhos nas aulas desta semana, incluindo uma demo do protótipo.

A ordem de apresentação será definida por mim, no dia da apresentação. Segue algumas instruções:

- submetam por esta atividade os slides da apresentação, incluindo um cronograma para a conclusão do projeto e o indicativo de quanto % da implementação já está concluída.'''),
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
