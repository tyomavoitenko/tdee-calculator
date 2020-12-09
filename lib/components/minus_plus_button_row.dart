import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdee_calculator/constants.dart';

class MinusPlusButtonRow extends StatelessWidget {
  MinusPlusButtonRow({
    @required this.onMinusPressed,
    @required this.onPlusPressed,
  });

  final VoidCallback onMinusPressed;
  final VoidCallback onPlusPressed;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: designSize);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.remove,
          ),
          iconSize: kIconSize.w,
          onPressed: onMinusPressed,
        ),
        IconButton(
          icon: Icon(
            Icons.add,
          ),
          iconSize: kIconSize.w,
          onPressed: onPlusPressed,
        ),
      ],
    );
  }
}
