import './fade_route.dart';
import './gender_card.dart';
import './height_card.dart';
import './pacman_slider.dart';
import './transition_dot.dart';
import './weight_card.dart';
import './gender_model.dart';
import './result_page.dart';
import './widget_utils.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController _submitAnimationController;
  Gender gender = Gender.other;
  int height = 180;
  int weight = 70;

  @override
  void initState() {
    super.initState();
    _submitAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _submitAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _goToResultPage().then((_) => _submitAnimationController.reset());
      }
    });
  }

  @override
  void dispose() {
    _submitAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "BMI CALCULATOR",
              style: new TextStyle(
                  color: Color(0xFFFFFFFF),// 183059
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFFf6f7f8), Color(0xFFf6f7f8)])),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(5.0),),
                  InputSummaryCard(
                    gender: gender,
                    weight: weight,
                    height: height,
                  ),
                  Expanded(child: _buildCards(context)),
                  _buildBottom(context),
                ],
              )
            ],
          ),
        ),
        TransitionDot(animation: _submitAnimationController),
      ],
    );
  }

  Widget _buildCards(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: HeightCard(
            height: height,
            onChanged: (val) => setState(() => height = val),
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Expanded(
                child: WeightCard(
                  weight: weight,
                  onChanged: (val) => setState(() => weight = val),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
              ),
              Expanded(
                child: GenderCard(
                  gender: gender,
                  onChanged: (val) => setState(() => gender = val),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottom(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: screenAwareSize(16.0, context),
        right: screenAwareSize(16.0, context),
        bottom: screenAwareSize(22.0, context),
        top: screenAwareSize(14.0, context),
      ),
      child: PacmanSlider(
        submitAnimationController: _submitAnimationController,
        onSubmit: onPacmanSubmit,
      ),
    );
  }

  void onPacmanSubmit() {
    _submitAnimationController.forward();
  }

  _goToResultPage() async {
    return Navigator.of(context).push(FadeRoute(
      builder: (context) => ResultPage(
            weight: weight,
            height: height,
            gender: gender,
          ),
    ));
  }
}

class InputSummaryCard extends StatelessWidget {
  final Gender gender;
  final int height;
  final int weight;

  const InputSummaryCard({Key key, this.gender, this.height, this.weight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(screenAwareSize(10.0, context)),
      child: SizedBox(
        height: screenAwareSize(32.0, context),
        child: Row(
          children: <Widget>[
            Expanded(child: _text("${height}cm")),
            _divider(),
            Expanded(child: _text("${weight}kg")),
            _divider(),
            Expanded(child: _genderText()),
          ],
        ),
      ),
    );
  }

  Widget _genderText() {
    String genderText = gender == Gender.other
        ? 'UNISEX'
        : (gender == Gender.male ? 'MALE' : 'FEMALE');
    return _text(genderText);
  }

  Widget _text(String text) {
    return Text(
      text,
      style: TextStyle(
          color: Color(0xFF183059),
          fontSize: 15.0,
          fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  Widget _divider() {
    return Container(
      width: 1.0,
      color: Color(0xFF210124).withOpacity(0.2),
    );
  }
}
