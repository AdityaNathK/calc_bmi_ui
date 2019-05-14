import 'package:flutter/material.dart';
import './widget_utils.dart';
import './gender_card.dart';
import './weight_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: MediaQuery.of(context).padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTitle(context),
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
    return Container(
      alignment: Alignment.center,
      height: screenAwareSize(108.0, context),
      width: double.infinity,
      child: Switch(value: true, onChanged: (val) {}),
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
          Expanded(child: _cardDisplay("Height")),
          Expanded(
            child: Column(
              children: <Widget>[
                Expanded(child: WeightCard()),
                Expanded(child: GenderCard()),
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
