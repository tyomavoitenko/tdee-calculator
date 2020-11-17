import 'package:flutter/material.dart';
import 'package:tdee_calculator/constants.dart';

class BottomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  BottomButton({this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        width: double.infinity,
        height: 70,
        color: kThemeMainColor,
        margin: EdgeInsets.only(top: 4),
      ),
    );
  }
}
