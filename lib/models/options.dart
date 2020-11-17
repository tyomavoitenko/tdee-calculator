import 'package:flutter/cupertino.dart';
import 'package:tdee_calculator/models/option.dart';

// Class holding List of Options for Activity Level and Goal dropdown buttons
class Options {
  final List<Option> options;
  int defaultOptionIndex;

  Options({
    @required this.options,
    this.defaultOptionIndex = 0,
  });

  Option getDefaultOption() {
    return options[defaultOptionIndex];
  }
}
