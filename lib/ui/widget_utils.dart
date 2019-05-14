import 'package:flutter/material.dart';
//To set the height of the device for multiple devices
const double baseHeight = 650.0;

double screenAwareSize(double size, BuildContext context) {
  return size * MediaQuery.of(context).size.height / baseHeight;
}