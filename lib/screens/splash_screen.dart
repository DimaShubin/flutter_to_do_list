import 'dart:async';
import 'package:flutter/material.dart';

import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () => _completeSplashScreen());
  }

  void _completeSplashScreen() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => MainScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg-image.jpg"),
                fit: BoxFit.cover,
              ),
            ), /* add child content here */
          ),
          Center(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Image.asset(
                      'assets/images/logo.png',
                      alignment: Alignment(1.0, -0.5),
                    ),
                    width: 150.0,
                    height: 150.0,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
