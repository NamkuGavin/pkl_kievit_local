import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pkl_kievit/Page/home.dart';
import 'package:pkl_kievit/api/api_service.dart';
import 'package:pkl_kievit/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _secureText = true;
  Timer _timer;
  double _progress;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  LoginRequestModel loginRequestModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    loginRequestModel = new LoginRequestModel();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background1.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: isloading == false ? SingleChildScrollView(
          child: Column(
            children: <Widget>[
            Stack(
            key: scaffoldKey,
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
                  key: globalFormKey,
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Tolong masukkan Username anda';
                            }
                            return null;
                          },
                          onSaved: (input) => loginRequestModel.username = input,
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Tolong masukkan Password anda';
                            }
                            return null;
                          },
                          onSaved: (input) => loginRequestModel.password = input,
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
                        onPressed: () {
                          if (validateAndSave()) {
                            loginapi();
                          }
                        },
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
          ),
            ],
          ),
        ): Center(
        ),
      ),
    );
  }


  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  bool isloading = false;
  void loginapi() {
    setState(() {
      isloading = true;
      _progress = 0;
      _timer?.cancel();
      _timer = Timer.periodic(const Duration(milliseconds: 100),
              (Timer timer) {
            EasyLoading.showProgress(_progress,
                status: '${(_progress * 100).toStringAsFixed(0)}%');
            _progress += 0.07;
          });
    });
    APIService apiService = new APIService();
    apiService.login(loginRequestModel).then((value) async {
      if (value != null) {
        Fluttertoast.showToast(
            msg: "Sukses Login",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            fontSize: 16.0
        );
        if (value.access_token.isNotEmpty) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs?.setBool("isLoggedIn", true);
          prefs.setString("access_token", value.access_token.toString());
          setState(() {
            isloading = false;
            _timer?.cancel();
            EasyLoading.dismiss();
          });
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage()));
        }
      }
    });
  }
}
