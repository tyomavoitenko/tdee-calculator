import 'package:flutter/cupertino.dart';

// Class holding data for Activity Level and Gaol dropdown button option
class Option {
  final String title;
  final String description;
  final double multiplier;

  Option({
    @required this.title,
    @required this.description,
    @required this.multiplier,
  });
}
