import 'package:flutter/material.dart';
import './widget_utils.dart';
import './gender_card.dart';
import './weight_card.dart';
import './height_card.dart';
import './gender_model.dart';
import './input_summary_card.dart';

class HomePage extends StatefulWidget {
  @override
  InputPageState createState() {
    return new InputPageState();
  }
}

class InputPageState extends State<HomePage> {
  Gender gender = Gender.other;
  int height = 170;
  int weight = 70;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: MediaQuery.of(context).padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTitle(context),
            InputSummaryCard(
              gender: gender,
              weight: weight,
              height: height,
            ),
            Expanded(child: _middleArea(context)),
            _bottomArea(context),
          ],
        ),
      ),
    );
  } // end of Build Context

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24.0,
        top: screenAwareSize(56.0, context),
      ),
      child: Text(
        "BMI Calculator",
        style: new TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
      ),
    );
  }

// Bottom Part **********/
  Widget _bottomArea(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: screenAwareSize(16.0, context),
        right: screenAwareSize(16.0, context),
        bottom: screenAwareSize(22.0, context),
        top: screenAwareSize(14.0, context),
      ),
      child: Placeholder(
        fallbackHeight: screenAwareSize(52.0, context),
        color: Theme.of(context).primaryColor,
      ),
    );
  }

// Bottom Part **********/

// Middle Part ********/
  Widget _middleArea(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 14.0, right: 14.0, top: screenAwareSize(32.0, context)),
      child: Row(
        children: <Widget>[
          Expanded(child: HeightCard(
            height: height,
            onChanged: (val) => setState(() => height = val),
          ),),
          Expanded(
            child: Column(
              children: <Widget>[
                Expanded(child: WeightCard(
                  weight: weight,
                  onChanged: (val) => setState(() => weight = val),
                )),
                Expanded(child: GenderCard(
                  gender: gender,
                  onChanged: (val) => setState(() => gender = val),
                ),),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Middle Part

  // Card Display Function
  Widget _cardDisplay(String title) {
    return Card(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Text(title),
      ),
    );
  }
// Card Display Function
}
