import 'package:flutter/material.dart';
import 'package:tdee_calculator/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    @required this.child,
    this.onTap,
  });

  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: designSize);
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: kCardColor,
          child: Padding(
            padding: EdgeInsets.all(12.w),
            child: child,
          ),
        ),
      ),
    );
  }
}
