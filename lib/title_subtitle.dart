import 'package:flutter/material.dart';

class HeaderText extends StatefulWidget {
  @override
  _HeaderTextState createState() => _HeaderTextState();
}

class _HeaderTextState extends State<HeaderText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "Welcome to Kievit",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.0),
        ),
        SizedBox(
          height: 70,
        ),
        Text("Deskripsi", style: TextStyle(fontSize: 19.0)),
      ],
    );
  }
}
