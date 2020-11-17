import 'package:flutter/material.dart';
import 'package:tdee_calculator/screens/input_screen.dart';
import 'package:tdee_calculator/constants.dart';

void main() => runApp(TDEECalculator());

class TDEECalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TDEE Calculator',
      theme: ThemeData.dark().copyWith(
        sliderTheme: SliderTheme.of(context).copyWith(
          inactiveTrackColor: kSliderInactiveTrackColor,
          activeTrackColor: kThemeMainColor,
          thumbColor: kThemeMainColor,
          overlayColor: kSliderOverlayColor,
        ),
        primaryColor: kBackgroundColor,
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      home: InputScreen(),
    );
  }
}
