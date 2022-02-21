import 'package:flutter/material.dart';
import 'package:pkl_kievit/button_started.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    PageView(
      children: [
        Row(
          children: <Widget>[
            Container(
              child: Image(
                width: 400,
                height: 200,
                image: AssetImage("assets/logo_intro_3.png"),
              ),
            ),
            SizedBox(
              width: 35,
            ),
            Column(
              children: <Widget>[
                SizedBox(height: 100),
                Text(
                  "Welcome to Kievit",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.0),
                ),
                SizedBox(
                  height: 70,
                ),
                Text("Deskripsi", style: TextStyle(fontSize: 19.0)),
              ],
            ),
          ],
        ),
      ],
    ),
    PageView(
      children: [
        Row(
          children: <Widget>[
            Container(
              child: Image(
                width: 400,
                height: 200,
                image: AssetImage("assets/logo_intro_3.png"),
              ),
            ),
            SizedBox(
              width: 35,
            ),
            Column(
              children: <Widget>[
                SizedBox(height: 100),
                Text(
                  "Welcome to Kievit",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.0),
                ),
                SizedBox(
                  height: 70,
                ),
                Text("Deskripsi", style: TextStyle(fontSize: 19.0)),
              ],
            ),
          ],
        ),
      ],
    ),
    PageView(
      children: [
        Row(
          children: <Widget>[
            Container(
              child: Image(
                width: 400,
                height: 200,
                image: AssetImage("assets/logo_intro_3.png"),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: <Widget>[
                SizedBox(height: 80),
                Text(
                  "Welcome to Kievit",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.0),
                ),
                SizedBox(
                  height: 50,
                ),
                Text("Deskripsi", style: TextStyle(fontSize: 19.0)),
                SizedBox(
                  height: 40,
                ),
                HeaderButton(),
              ],
            ),
          ],
        ),
      ],
    ),
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: _onchanged,
            controller: _controller,
            itemCount: _pages.length,
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),
          Align(
            alignment: Alignment.topRight,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(top: 10, right: 32),
                child: GestureDetector(
                  onTap: () {
                    _controller.animateToPage(2,
                        duration: Duration(milliseconds: 800),
                        curve: Curves.easeInOutQuint);
                  },
                  child: Text("Skip",
                      style: TextStyle(color: Color(0xC9C9C9BD), fontSize: 15)),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 295, bottom: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(_pages.length, (int index) {
                      return AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height: 10,
                          width: (index == _currentPage) ? 20 : 10,
                          margin: EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: (index == _currentPage)
                                  ? Colors.red
                                  : Colors.red.withOpacity(0.5)));
                    })),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
