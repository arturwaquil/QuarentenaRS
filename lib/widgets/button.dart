import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  String text;
  Function onPressed;
  // size?

  Button({ this.text, this.onPressed });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: FlatButton(
        padding: EdgeInsets.all(20.0),
        onPressed: onPressed,
        child: Text(text,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
        ),
        color: Colors.grey[300],
      ),
    );
  }
}