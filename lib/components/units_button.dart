import 'package:flutter/material.dart';
import 'package:tdee_calculator/constants.dart';

class UnitsButton extends StatelessWidget {
  UnitsButton({
    @required this.units,
    @required this.isActive,
    @required this.onTap,
  });

  final Units units;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    BoxDecoration decoration;

    if (isActive) {
      decoration = BoxDecoration(
        color: kThemeMainColor,
        borderRadius: units == Units.metric
            ? BorderRadius.only(
                topLeft: Radius.circular(4),
                bottomLeft: Radius.circular(4),
              )
            : BorderRadius.only(
                topRight: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
      );
    } else {
      decoration = BoxDecoration(
        border: Border.all(
          color: kThemeMainColor,
          width: 2,
        ),
        borderRadius: units == Units.metric
            ? BorderRadius.only(
                topLeft: Radius.circular(4),
                bottomLeft: Radius.circular(4),
              )
            : BorderRadius.only(
                topRight: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
      );
    }

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: decoration,
          height: 40,
          child: Center(
            child: Text(
              units.toString().split('.')[1].toUpperCase(),
              style: TextStyle(
                color: isActive ? kMainTextColor : kThemeMainColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
