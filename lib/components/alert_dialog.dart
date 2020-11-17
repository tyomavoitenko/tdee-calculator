import 'package:flutter/material.dart';
import 'package:tdee_calculator/constants.dart';

void showAlertDialog({
  @required BuildContext context,
  @required String content,
  String closeButtonTitle = 'Close',
}) {
  AlertDialog alert = AlertDialog(
    backgroundColor: kCardColor,
    content: Text(content),
    actions: [
      FlatButton(
        child: Text(closeButtonTitle),
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
