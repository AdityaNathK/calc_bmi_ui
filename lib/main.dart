import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './ui/splash.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        primaryColorDark: Colors.deepPurple,
        brightness: Brightness.light,
        primaryColor: Color(0xFF183059)
      ),
      home: SplashScreen(), //Inputpage();
    );
  }
}
