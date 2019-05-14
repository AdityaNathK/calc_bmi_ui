import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './ui/homepage.dart';

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
        primarySwatch: Colors.orange,
        primaryColorDark: Colors.blue,
        brightness: Brightness.light,
        primaryColor: Colors.white
      ),
      home: HomePage(), //Inputpage();
    );
  }
}
