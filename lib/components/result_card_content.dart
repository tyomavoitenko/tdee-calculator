import 'package:flutter/material.dart';
import 'package:tdee_calculator/constants.dart';
import 'package:tdee_calculator/components/alert_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultCardContent extends StatelessWidget {
  final String title;
  final String description;
  final int result;
  final String additionalInfo;

  ResultCardContent({
    @required this.title,
    @required this.description,
    @required this.result,
    this.additionalInfo,
  });

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: designSize);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 24.w,
              ),
            ),
            additionalInfo != null
                ? Container(
                    padding: EdgeInsets.only(left: 4.w),
                    child: GestureDetector(
                      onTap: () {
                        showAlertDialog(
                          context: context,
                          content: additionalInfo,
                        );
                      },
                      child: Icon(
                        Icons.info_outline,
                        size: kIconSize.w,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
        SizedBox(
          height: 5.w,
        ),
        Text(
          description,
          style: TextStyle(
            color: kSecondaryTextColor,
            fontSize: kSecondaryFontSize.w,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20.w,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              '$result',
              style: TextStyle(
                fontSize: 56.w,
                fontWeight: FontWeight.w300,
                color: kThemeMainColor,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              'kcal',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: kThemeMainColor,
                fontSize: 16.w,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
