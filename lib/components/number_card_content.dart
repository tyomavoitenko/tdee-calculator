import 'package:flutter/material.dart';
import 'package:tdee_calculator/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    ScreenUtil.init(context, designSize: designSize);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(fontSize: kLabelFontSize.w),
        ),
        SizedBox(
          height: 10.w,
        ),
        unit != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    number,
                    style: TextStyle(
                      fontSize: kNumberFontSize.w,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    unit,
                    style: TextStyle(fontSize: kUnitFontSize.w),
                  ),
                ],
              )
            : Text(
                number,
                style: TextStyle(
                  fontSize: kNumberFontSize.w,
                  fontWeight: FontWeight.w800,
                ),
              ),
        numberChanger,
      ],
    );
  }
}
