import './calculator.dart' as calculator;
import './gender_model.dart';
import 'package:flutter/material.dart';
import './fade_route.dart';
import './settings.dart';
import 'package:firebase_admob/firebase_admob.dart';

class ResultPage extends StatefulWidget {
  final int height;
  final int weight;
  final Gender gender;

  const ResultPage({Key key, this.height, this.weight, this.gender})
      : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "RESULT",
            style: new TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Stack(fit: StackFit.expand, children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFf6f7f8), Color(0xFFf6f7f8)])),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ResultCard(
                bmi: calculator.calculateBMI(
                    height: widget.height, weight: widget.weight),
                minWeight:
                    calculator.calculateMinNormalWeight(height: widget.height),
                maxWeight:
                    calculator.calculateMaxNormalWeight(height: widget.height),
              ),
            ],
          ),
        ]));
  }
}

class ResultCard extends StatefulWidget {
  final double bmi;
  final double minWeight;
  final double maxWeight;

  ResultCard({Key key, this.bmi, this.minWeight, this.maxWeight})
      : super(key: key);

  @override
  ResultCardState createState() {
    return ResultCardState();
  }
}

class ResultCardState extends State<ResultCard> {
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
    _interstitialAd?.dispose();
    super.dispose();
  }

  Widget _bmiRange(BuildContext context) {
    double calcBmi = widget.bmi;
    String _result;
    calcBmi = this.widget.bmi;
    if (calcBmi <= 18.5) {
      _result = "Underweight";
      return Column(
        children: <Widget>[
          Text(
            "$_result",
            style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange),
          ),
          Container(
            margin: EdgeInsets.only(top: 35.0),
            child: Text(
              "You need more nutrition. \n Take good Care",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF183059),
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      );
    } else if (calcBmi >= 18.5 && calcBmi <= 24.9) {
      _result = "Normal";
      return Column(
        children: <Widget>[
          Text(
            "$_result",
            style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                color: Colors.green),
          ),
          Container(
            margin: EdgeInsets.only(top: 35.0),
            child: Text(
              "You are doing just fine \n Cheers :)",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF183059),
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      );
    } else if (calcBmi >= 25 && calcBmi <= 29.9) {
      _result = "Overweight";
      return Column(
        children: <Widget>[
          Text(
            "$_result",
            style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                color: Colors.orangeAccent),
          ),
          Container(
            margin: EdgeInsets.only(top: 35.0),
            child: Text(
              "You need a little tuining \n Its not that difficult",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF183059),
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      );
    } else {
      _result = "Obese";
      return Column(
        children: <Widget>[
          Text(
            "$_result",
            style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent),
          ),
          Container(
            margin: EdgeInsets.only(top: 35.0),
            child: Text(
              "You need to take your health seriously.\n "
                  "nothings worth more except good health",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF183059),
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          margin: EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Container(
              width: double.infinity,
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'BMI : ${widget.bmi.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF183059),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 2.0),
                    ),
                    Text(
                      'kg/m²',
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF183059)),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                ),
                _bmiRange(context),
                Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                ),
                _buildBottomBar(context),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    '*Normal BMI weight range for the height is :\n${widget.minWeight.round()}kg - ${widget.maxWeight.round()}kg',
                    style: TextStyle(fontSize: 14.0, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
              ]),
            ),
          ),
        ),
        Text(
          "Below Ad is our fuel for more projects. \nThank you",
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Container(
          color: Colors.grey,
          height: 1.5,
        ),
      ],
    );
  }
//  Widget _smoothStarRating () {
//    double rating;
//    return SmoothStarRating(
//      allowHalfRating: false,
//      onRatingChanged: (v) {
//        rating = v;
//        setState(() {});
//      },
//      starCount: 5,
//      rating: rating,
//      size: 40.0,
//      color: Colors.green,
//      borderColor: Colors.green,
//    );
//  }
}

Widget _buildBottomBar(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(1.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            height: 52.0,
            width: 80.0,
            child: RaisedButton(
              child: Icon(
                Icons.refresh,
                color: Colors.white,
                size: 28.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
              onPressed: () {
                _createInterstetialAd()
                  ..load()
                  ..show();
                Navigator.of(context).pop();
              },
              color: Theme.of(context).primaryColor,
            )),
        Padding(
          padding: const EdgeInsets.only(left: 40.0),
        ),
        Container(
            height: 52.0,
            width: 80.0,
            child: RaisedButton(
              child: Icon(
                Icons.info,
                color: Colors.white,
                size: 28.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
              onPressed: () {
                _createInterstetialAd()
                  ..load()
                  ..show();
                Navigator.of(context).push(FadeRoute(
                  builder: (context) => SettingsPage(),
                ));
              },
              color: Theme.of(context).primaryColor,
            ))
      ],
    ),
  );
}

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
InterstitialAd _interstitialAd;

BannerAd _createBannerAd() {
  return BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.largeBanner,
      targetingInfo: targetInfo,
      listener: (MobileAdEvent event) {
        print("Banner event : $event");
      });
}

InterstitialAd _createInterstetialAd() {
  return InterstitialAd(
      adUnitId: InterstitialAd.testAdUnitId,
      targetingInfo: targetInfo,
      listener: (MobileAdEvent event) {
        print("Interstetial event : $event");
      });
}
