import 'package:flutter/material.dart';
import 'package:tdee_calculator/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showAlertDialog({
  @required BuildContext context,
  @required String content,
  String closeButtonTitle = 'Close',
}) {
  ScreenUtil.init(context, designSize: designSize);
  AlertDialog alert = AlertDialog(
    backgroundColor: kCardColor,
    content: Text(
      content,
      style: TextStyle(fontSize: kDefaultFontSize.w),
    ),
    actions: [
      FlatButton(
        child: Text(
          closeButtonTitle,
          style: TextStyle(fontSize: kDefaultFontSize.w),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
