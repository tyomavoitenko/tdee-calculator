import 'package:flutter/material.dart';

const Color kBackgroundColor = Color(0xFF222831);
const Color kCardColor = Color(0xFF393e46);
const Color kThemeMainColor = Color(0xFF00adb5);
const Color kSliderInactiveTrackColor = Color(0x3d00adb5);
const Color kSliderOverlayColor = Color(0x2900adb5);
const Color kMainTextColor = Colors.white;
const Color kSecondaryTextColor = Color(0xFF68727f);

const TextStyle kNumberTextStyle = TextStyle(
  fontSize: 26,
  fontWeight: FontWeight.w800,
);

const TextStyle kSecondaryTextStyle = TextStyle(
  color: kSecondaryTextColor,
  fontSize: 15,
);

enum Gender {
  male,
  female,
}

enum Units {
  metric,
  imperial,
}
