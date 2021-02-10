import 'package:chating_ui/screens/homeScreen.dart';
import 'package:chating_ui/widget/outline_button.dart';
import 'package:chating_ui/widget/primary_button.dart';
import 'package:chating_ui/widget/text_field_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toast/toast.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double windowWidth = 0;
  double windowHight = 0;
  double _loginOffsit = 0;
  double _registerOffsit = 0;
  double _loginXoffsit = 0;
  double _loginWidth = 0;
  Color loginColor = Colors.white;
  int _pageState = 0;
// Login And registration
  String signupEmail;
  String signupPassword;
  String loginEmail;
  String loginPassword;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    windowHight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    var _backgroundColor = Color(0xFFD34C59);
    var _headingColor = Colors.black87;
    switch (_pageState) {
      case 0:
        _backgroundColor = Theme.of(context).accentColor;
        _loginOffsit = windowHight;
        _registerOffsit = windowHight;
        _loginXoffsit = 0;
        _loginWidth = windowWidth;
        loginColor = Colors.white;
        break;
      case 1:
        _backgroundColor = Color(0xFFD34C59);
        _headingColor = Colors.white;
        _loginOffsit = 270;
        _registerOffsit = windowHight;
        _loginXoffsit = 0;
        _loginWidth = windowWidth;
        loginColor = Colors.white;
        break;
      case 2:
        _backgroundColor = Color(0xFFD34C59);
        _headingColor = Colors.white;
        _loginOffsit = 250;
        _registerOffsit = 270;
        _loginXoffsit = 20;
        _loginWidth = windowWidth - 40;
        loginColor = Colors.white38;

        break;
    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                _pageState = 0;
              });
            },
            child: AnimatedContainer(
              curve: Curves.fastLinearToSlowEaseIn,
              color: _backgroundColor,
              duration: Duration(milliseconds: 500),
              child: SizedBox.expand(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 97, bottom: 15),
                      child: Text(
                        'Chat App',
                        style: TextStyle(
                          fontSize: 28,
                          color: _headingColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 260.0,
                      height: 130.0,
                      child: Text(
                        'Connect with friends and family at any time, with our comprehensive free app',
                        style: TextStyle(
                          fontSize: 16,
                          color: _headingColor,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Image.asset(
                      'assets/images/splashimage.png',
                      width: 250,
                      height: 250,
                    ),
                    SizedBox(
                      height: 120,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_pageState != 0)
                            _pageState = 0;
                          else
                            _pageState = 1;
                        });
                      },
                      child: Container(
                          padding: EdgeInsets.all(20),
                          width: 350.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(27.0),
                            color: Color(0xFFD34C59),
                          ),
                          child: Text(
                            'Get Started',
                            style: TextStyle(
                              fontSize: 16,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _pageState = 2;
              });
            },
            child: AnimatedContainer(
              width: _loginWidth,
              duration: Duration(milliseconds: 1000),
              curve: Curves.fastLinearToSlowEaseIn,
              transform:
                  Matrix4.translationValues(_loginXoffsit, _loginOffsit, 0),
              decoration: BoxDecoration(
                  color: loginColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Padding(
                padding: const EdgeInsets.only(top: 55, left: 25, right: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Text(
                            "Login To Continue",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        InputWithIcon(
                          icon: Icons.email,
                          hint: "Enter Email...",
                          onChanged: (value) {
                            loginEmail = value;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InputWithIcon(
                          icon: Icons.vpn_key,
                          hint: "Enter Password...",
                          onChanged: (value) {
                            loginPassword = value;
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 55,
                    ),
                    Column(
                      children: <Widget>[
                        PrimaryButton(
                          btnText: "Login",
                          onTap: () async {
                            try {
                              final user =
                                  await auth.signInWithEmailAndPassword(
                                      email: loginEmail,
                                      password: loginPassword);
                              if (user != null)
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => HomeScreen()));
                            } catch (e) {
                              Toast.show(
                                  "Error in UserName or passowrd", context,
                                  duration: Toast.LENGTH_SHORT,
                                  gravity: Toast.BOTTOM);
                            }
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _pageState = 2;
                            });
                          },
                          child: OutlineBtn(
                            btnText: "Create New Account",
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _pageState = 1;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              curve: Curves.fastLinearToSlowEaseIn,
              transform: Matrix4.translationValues(0, _registerOffsit, 0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Padding(
                padding: const EdgeInsets.only(top: 55, left: 25, right: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Text(
                            "Create New Account",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        InputWithIcon(
                          icon: Icons.email,
                          hint: "Enter Email...",
                          onChanged: (value) {
                            signupEmail = value;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InputWithIcon(
                          icon: Icons.vpn_key,
                          hint: "Enter Password...",
                          onChanged: (value) {
                            signupPassword = value;
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 55,
                    ),
                    Column(
                      children: <Widget>[
                        PrimaryButton(
                          btnText: "Signup",
                          onTap: () async {
                            try {
                              final newUser =
                                  await auth.createUserWithEmailAndPassword(
                                      email: signupEmail,
                                      password: signupPassword);
                              if (newUser != null) {
                                Toast.show("User Regitration Success", context,
                                    duration: Toast.LENGTH_SHORT,
                                    gravity: Toast.BOTTOM);
                              }
                            } catch (e) {
                              print(e);
                            }
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _pageState = 2;
                            });
                          },
                          child: OutlineBtn(
                            btnText: "Login",
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
