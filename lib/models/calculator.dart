import 'package:flutter/foundation.dart';
import 'package:tdee_calculator/constants.dart';

class Calculator {
  final Gender gender;
  final int height;
  final double weight;
  final int age;
  final double activityFactor;
  final double goalFactor;

  int _bmr;
  int _tdee;
  int _suggestedCalories;

  Calculator({
    @required this.gender,
    @required this.height,
    @required this.weight,
    @required this.age,
    @required this.activityFactor,
    @required this.goalFactor,
  });

  // Mifflin-St Jeor equation for calculation BMR
  int calculateBMR() {
    int genderValue = gender == Gender.male ? 5 : -161;

    _bmr = ((9.99 * weight) + (6.25 * height) - (4.92 * age) + genderValue)
        .round();
    return _bmr;
  }

  int calculateTDEE() {
    if (_bmr == null) {
      calculateBMR();
    }

    _tdee = (_bmr * activityFactor).round();
    return _tdee;
  }

  int calculateSuggestedCalories() {
    if (_tdee == null) {
      calculateTDEE();
    }

    _suggestedCalories = (_tdee * goalFactor).round();
    return _suggestedCalories;
  }
}
