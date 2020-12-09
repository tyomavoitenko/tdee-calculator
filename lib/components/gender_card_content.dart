import 'package:flutter/material.dart';
import 'package:tdee_calculator/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderCardContent extends StatelessWidget {
  GenderCardContent({
    @required this.icon,
    @required this.label,
    @required this.isActive,
  });

  final IconData icon;
  final String label;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: designSize);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 45.w,
          color: isActive ? kMainTextColor : kSecondaryTextColor,
        ),
        SizedBox(
          height: 10.w,
        ),
        Text(
          label,
          style: TextStyle(
            color: isActive ? kMainTextColor : kSecondaryTextColor,
            fontSize: kLabelFontSize.w,
          ),
        ),
      ],
    );
  }
}
