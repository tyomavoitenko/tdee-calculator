import 'package:tdee_calculator/models/options.dart';
import 'package:tdee_calculator/models/option.dart';

Options goals = Options(
  options: [
    Option(
      title: 'Cut',
      description: 'Lose fat',
      multiplier: 0.8,
    ),
    Option(
      title: 'Lean Bulk',
      description: 'Build lean muscle',
      multiplier: 1.1,
    ),
    Option(
      title: 'Maintain',
      description: 'Maintain the same weight',
      multiplier: 1,
    ),
  ],
);

String goalValue = goals.getDefaultOption().multiplier.toString();
