import 'package:flutter/material.dart';
import "dart:async";
import './homepage.dart';
import './widget_utils.dart' show screenAwareSize;


class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashState();
  }
}

class _SplashState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // NC
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(.6)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start, //Need to Check
            children: <Widget>[
              Expanded(
                flex: 2, //NC
                child: Container(
                  margin: EdgeInsets.only(left: 40.0, top: 100.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "images/logo.png",
                        height: screenAwareSize(250.0, context),
                        width: screenAwareSize(250.0, context),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30.0),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '\"All the money in the world can\'t buy \n you back good health\"',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          fontStyle: FontStyle.italic,
                          color: Color(0xFF183059)),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: LinearProgressIndicator(
              backgroundColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
