import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputLogin extends StatefulWidget {
  @override
  _InputLoginState createState() => _InputLoginState();
}

class _InputLoginState extends State<InputLogin> {
  bool _secureText = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: 375,
          padding: EdgeInsets.all(25),
          margin: EdgeInsets.only(left: 380, top: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Form(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Center(
                    child: Text(
                      "Login to Your Account",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Text(
                      "Username",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextFormField(
                    decoration: new InputDecoration(
                      suffixIcon: Icon(
                        Icons.account_circle_sharp,
                        color: Colors.black,
                      ),
                      hintText: "Type Your Username",
                      hintStyle: TextStyle(color: Colors.grey[350], fontSize: 15),
                      enabledBorder: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Text(
                      "Password",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextFormField(
                    decoration: new InputDecoration(
                      suffixIcon: IconButton(
                        color: Colors.black,
                        icon: Icon(
                            _secureText ? Icons.lock : Icons.remove_red_eye),
                        onPressed: () {
                          setState(() {
                            _secureText = !_secureText;
                          });
                        },
                      ),
                      hintText: "Type Your Password",
                      hintStyle: TextStyle(color: Colors.grey[350], fontSize: 15),
                      enabledBorder: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(),
                    ),
                    obscureText: _secureText,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    child: Text(
                      "Forgot Password ?",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 125),
                  onPressed: () {},
                  child: Text(
                    "Sign In",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
