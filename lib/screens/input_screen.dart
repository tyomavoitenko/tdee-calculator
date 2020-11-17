import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tdee_calculator/components/dropdown_card_content.dart';
import 'package:tdee_calculator/components/custom_card.dart';
import 'package:tdee_calculator/components/gender_card_content.dart';
import 'package:tdee_calculator/components/minus_plus_button_row.dart';
import 'package:tdee_calculator/components/number_card_content.dart';
import 'package:tdee_calculator/components/units_button.dart';
import 'package:tdee_calculator/components/bottom_button.dart';
import 'package:tdee_calculator/constants.dart';
import 'package:tdee_calculator/models/goals_data.dart';
import 'package:tdee_calculator/models/activity_levels_data.dart';
import 'package:tdee_calculator/utilities/units_helper.dart';
import 'package:tdee_calculator/models/calculator.dart';
import 'package:tdee_calculator/screens/results_screen.dart';
import 'package:tdee_calculator/components/alert_dialog.dart';
import 'package:tdee_calculator/components/scrollable_wrapper.dart';

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  Gender selectedGender;
  Units selectedUnits = Units.metric;

  int height = 180;
  int weight = 75;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TDEE Calculator'),
      ),
      // Make the entire screen scrollable if there is not enough room to see the entire contents
      body: ScrollableWrapper(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Units Buttons Section
            Container(
              padding: const EdgeInsets.fromLTRB(4, 8, 4, 4),
              child: Row(
                children: <Widget>[
                  UnitsButton(
                    units: Units.metric,
                    isActive: selectedUnits == Units.metric ? true : false,
                    onTap: () {
                      setState(() {
                        // Converting weight and correcting height on switch from imperial to metric
                        // More explanation about correctFeetToCm function is in its file
                        if (selectedUnits != Units.metric) {
                          weight = toKilograms(weight);
                          height = correctFeetToCm(height);
                        }
                        selectedUnits = Units.metric;
                      });
                    },
                  ),
                  UnitsButton(
                    units: Units.imperial,
                    isActive: selectedUnits == Units.imperial ? true : false,
                    onTap: () {
                      setState(() {
                        // Converting weight on switch from metric to imperial
                        if (selectedUnits != Units.imperial) {
                          weight = toPounds(weight);
                        }
                        selectedUnits = Units.imperial;
                      });
                    },
                  ),
                ],
              ),
            ),
            // Gender Selection Section
            Expanded(
              child: Row(
                children: <Widget>[
                  CustomCard(
                    child: GenderCardContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                      isActive: selectedGender == Gender.male ? true : false,
                    ),
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                  CustomCard(
                    child: GenderCardContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                      isActive: selectedGender == Gender.female ? true : false,
                    ),
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ],
              ),
            ),
            // Height Selection
            CustomCard(
              child: NumberCardContent(
                label: 'HEIGHT',
                number: selectedUnits == Units.metric
                    ? height.toString()
                    : toFeet(height),
                unit: selectedUnits == Units.metric ? 'cm' : null,
                numberChanger: Slider(
                  value: height.toDouble(),
                  onChanged: (newValue) {
                    setState(() {
                      height = newValue.round();
                    });
                  },
                  min: 1,
                  max: 300,
                ),
              ),
            ),
            // Weight and Age Selection Section
            Expanded(
              child: Row(
                children: <Widget>[
                  CustomCard(
                    child: NumberCardContent(
                      label: 'WEIGHT',
                      number: weight.round().toString(),
                      unit: selectedUnits == Units.metric ? 'kg' : 'lb',
                      numberChanger: MinusPlusButtonRow(
                        onMinusPressed: () {
                          setState(() {
                            if (weight > 2) {
                              weight--;
                            }
                          });
                        },
                        onPlusPressed: () {
                          setState(() {
                            weight++;
                          });
                        },
                      ),
                    ),
                  ),
                  CustomCard(
                    child: NumberCardContent(
                      label: 'AGE',
                      number: age.toString(),
                      numberChanger: MinusPlusButtonRow(
                        onMinusPressed: () {
                          setState(() {
                            if (age > 1) {
                              age--;
                            }
                          });
                        },
                        onPlusPressed: () {
                          setState(() {
                            age++;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Activity Level Selection
            CustomCard(
              child: DropdownCardContent(
                label: 'ACTIVITY',
                value: activityLevelValue,
                options: activityLevels.options,
                onChanged: (newValue) {
                  setState(() {
                    activityLevelValue = newValue;
                  });
                },
              ),
            ),
            // Goal Selection
            CustomCard(
              child: DropdownCardContent(
                label: 'GOAL',
                value: goalValue,
                options: goals.options,
                onChanged: (String newValue) {
                  setState(() {
                    goalValue = newValue;
                  });
                },
              ),
            ),
            // Bottom Calculate Button
            BottomButton(
              title: 'CALCULATE',
              onTap: () {
                if (selectedGender == null) {
                  showAlertDialog(
                    context: context,
                    content: 'Please, select gender',
                    closeButtonTitle: 'OK',
                  );
                  return;
                }

                Calculator calculator = Calculator(
                  gender: selectedGender,
                  height: selectedUnits == Units.metric
                      ? height
                      : correctFeetToCm(height),
                  weight: selectedUnits == Units.metric
                      ? weight.toDouble()
                      : toRealKilograms(weight),
                  age: age,
                  activityFactor: double.parse(activityLevelValue),
                  goalFactor: double.parse(goalValue),
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsScreen(
                      bmr: calculator.calculateBMR(),
                      tdee: calculator.calculateTDEE(),
                      suggestedCalories:
                          calculator.calculateSuggestedCalories(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
