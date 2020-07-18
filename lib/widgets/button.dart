import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  final String text;
  final Function onPressed;
  // size?

  Button({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(20.0),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
      ),
      color: Colors.grey[300],
    );
  }
}
