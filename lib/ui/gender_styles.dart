import 'dart:math' as math;

import './gender_model.dart';
import './widget_utils.dart';
import 'package:flutter/material.dart';

const double defaultGenderAngle = math.pi / 2;
const Map<Gender, double> genderAngles = {
  Gender.female: -defaultGenderAngle,
  Gender.other: 0.0,
  Gender.male: defaultGenderAngle,
};

double circleSize(BuildContext context) => screenAwareSize(80.0, context);