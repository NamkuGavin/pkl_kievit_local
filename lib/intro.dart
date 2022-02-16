import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pkl_kievit/button_started.dart';
import 'package:pkl_kievit/home.dart';
import 'package:pkl_kievit/title_subtitle.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Color(0xFFF6F6F6),
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 10, right: 32),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => HomePage()),
                );
              },
              child: Text("Skip",
                  style: TextStyle(color: Color(0xC9C9C9BD), fontSize: 15)),
            ),
          ),
        ),
      ),
      pages: [
        PageViewModel(
          title: "",
          bodyWidget: Row(
            children: <Widget>[
              Container(
                width: 400,
                height: 200,
                child: Image(
                  image: AssetImage("assets/logo_intro_3.png"),
                ),
              ),
              SizedBox(
                width: 35,
              ),
              HeaderText(),
            ],
          ),
        ),
        PageViewModel(
          title: "",
          bodyWidget: Row(
            children: <Widget>[
              Container(
                width: 400,
                height: 200,
                child: Image(
                  image: AssetImage("assets/logo_intro_2.png"),
                ),
              ),
              SizedBox(
                width: 35,
              ),
              HeaderText(),
            ],
          ),
        ),
        PageViewModel(
          title: "",
          bodyWidget: Row(
            children: <Widget>[
              Container(
                width: 400,
                height: 200,
                child: Image(
                  image: AssetImage("assets/logo_intro_1.png"),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              HeaderButton(),
            ],
          ),
        ),
      ],
      onDone: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => HomePage()),
        );
      },
      showSkipButton: false,
      showNextButton: false,
      showDoneButton: false,
      skip: Text(''),
      controlsMargin: EdgeInsets.only(left: 330),
      next: Text(''),
      done: Text(''),
      dotsDecorator: DotsDecorator(
        spacing: const EdgeInsets.all(2.0),
        activeColor: Colors.red,
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
