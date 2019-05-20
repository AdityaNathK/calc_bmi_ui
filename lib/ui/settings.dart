import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final MobileAdTargetingInfo targetInfo = MobileAdTargetingInfo(
    keywords: <String>[
      'bmi',
      'bmi calculatior',
      'bmiCalculator',
      'BMICalculator',
      'calculator'
    ],
    childDirected: true,
  );

  BannerAd _bannerAd;

//  InterstitialAd _interstitialAd;
  BannerAd _createBannerAd() {
    return BannerAd(
        adUnitId: BannerAd.testAdUnitId,
        size: AdSize.largeBanner,
        targetingInfo: targetInfo,
        listener: (MobileAdEvent event) {
          print("Banner event : $event");
        });
  }

//  InterstitialAd _createInterstetialAd() {
//    return InterstitialAd(
//        adUnitId: InterstitialAd.testAdUnitId,
//        targetingInfo: targetInfo,
//        listener: (MobileAdEvent event) {
//          print("Interstetial event : $event");
//        });
//  }
  @override
  void initState() {
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    _bannerAd = _createBannerAd()
      ..load()
      ..show();
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ABOUT',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFFFFFFFF),
              fontSize: 20.0),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          new Column(
            children: <Widget>[
              _getToolbar(context),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              Text(
                "BMI CALCULATOR",
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              Text(
                "v 0.1.1",
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              Text(
                "Made with Flutter",
                style: TextStyle(fontSize: 10.0, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              Container(
                color: Colors.grey,
                height: 1.5,
              ),
              Card(
                child: Container(
                  color: Colors.grey.withOpacity(0.1),
                  padding: EdgeInsets.all(25.0),
                  child: Text(
                    "This App user the follwing dependencies: \n\n \t "
                        "1. flutter_svg: ^0.12.4+1 : for integrating svg into flutter \n\n \t "
                        "2. firebase_admob: ^0.5.2 : for working with google admob",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0),
              ),
              Image(
                  width: 70.0,
                  height: 70.0,
                  fit: BoxFit.cover,
                  image: new AssetImage('images/kapps.png')),
              Container(
                alignment: Alignment.bottomCenter,
                child: Card(
                  margin: EdgeInsets.all(5.0),
                  elevation: 2.0,
                  child: Text('2019 © kronos apps'),
                ),
              ),
              Padding(padding: EdgeInsets.all(5.0),),
              Text(
                "Below Ad is our fuel for more projects. \nThank you",
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(padding: EdgeInsets.all(5.0),),
              Container(
                color: Colors.grey,
                height: 1.5,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding _getToolbar(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: new Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        new Image(
            width: 50.0,
            height: 50.0,
            fit: BoxFit.cover,
            image: new AssetImage('images/logo.png')),
      ]),
    );
  }
}
