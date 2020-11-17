import 'package:flutter/material.dart';
import 'package:tdee_calculator/constants.dart';

class NumberCardContent extends StatelessWidget {
  NumberCardContent({
    @required this.label,
    @required this.number,
    this.unit,
    @required this.numberChanger,
  });

  final String label;
  final String number;
  final String unit;
  final Widget numberChanger;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(label),
        SizedBox(
          height: 10,
        ),
        unit != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    number,
                    style: kNumberTextStyle,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    unit,
                  ),
                ],
              )
            : Text(
                number,
                style: kNumberTextStyle,
              ),
        numberChanger,
      ],
    );
  }
}
