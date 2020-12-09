import 'package:flutter/material.dart';
import 'package:tdee_calculator/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  BottomButton({this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: designSize);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.w,
            ),
          ),
        ),
        width: double.infinity,
        height: 70.w,
        color: kThemeMainColor,
        margin: EdgeInsets.only(top: 4.w),
      ),
    );
  }
}
