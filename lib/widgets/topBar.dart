import 'package:flutter/material.dart';

import 'logo.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Image.asset('assets/voltar.png'),
            onPressed: onPressedBack(context),
          ),
          Expanded(child: Logo()),
        ],
      ),
    );
  }

  onPressedBack(BuildContext context) {
    if (Navigator.canPop(context)) {
      // Navigator.pop(context);
    }
  }
}
