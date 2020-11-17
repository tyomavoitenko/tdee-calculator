import 'package:flutter/material.dart';
import 'package:tdee_calculator/constants.dart';
import 'package:tdee_calculator/components/alert_dialog.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            additionalInfo != null
                ? Container(
                    padding: const EdgeInsets.only(left: 4),
                    child: GestureDetector(
                      onTap: () {
                        showAlertDialog(
                          context: context,
                          content: additionalInfo,
                        );
                      },
                      child: Icon(
                        Icons.info_outline,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          description,
          style: kSecondaryTextStyle,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              '$result',
              style: TextStyle(
                fontSize: 56,
                fontWeight: FontWeight.w300,
                color: kThemeMainColor,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              'kcal',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: kThemeMainColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
