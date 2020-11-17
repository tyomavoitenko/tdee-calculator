import 'package:tdee_calculator/models/options.dart';
import 'package:tdee_calculator/models/option.dart';

// Katch-McArdle activity level multipliers
Options activityLevels = Options(
  options: [
    Option(
      title: 'Sedentary',
      description: 'Little to no exercise',
      multiplier: 1.2,
    ),
    Option(
      title: 'Lightly Active',
      description: 'Light exercise 1-3 days/week',
      multiplier: 1.375,
    ),
    Option(
      title: 'Moderately Active',
      description: 'Moderate exercise 3-5 days/week',
      multiplier: 1.55,
    ),
    Option(
      title: 'Very Active',
      description: 'Heavy exercise 6-7 days/week',
      multiplier: 1.725,
    ),
    Option(
      title: 'Extremely Active',
      description: 'Very heavy exercise 2x/day',
      multiplier: 1.9,
    ),
  ],
  defaultOptionIndex: 2,
);

String activityLevelValue =
    activityLevels.getDefaultOption().multiplier.toString();
