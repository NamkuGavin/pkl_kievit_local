import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:pkl_kievit/home.dart';

class HeaderButton extends StatefulWidget {
  @override
  _HeaderButtonState createState() => _HeaderButtonState();
}

class _HeaderButtonState extends State<HeaderButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        minWidth: 250.0,
        height: 50.0,
        color: Colors.red,
        textColor: Colors.white,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => HomePage()),
          );
        },
        child: Text(
          'Get Started',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
      );
  }
}
