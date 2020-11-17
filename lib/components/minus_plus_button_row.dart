import 'package:flutter/material.dart';

class MinusPlusButtonRow extends StatelessWidget {
  MinusPlusButtonRow({
    @required this.onMinusPressed,
    @required this.onPlusPressed,
  });

  final VoidCallback onMinusPressed;
  final VoidCallback onPlusPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.remove,
          ),
          onPressed: onMinusPressed,
        ),
        IconButton(
          icon: Icon(
            Icons.add,
          ),
          onPressed: onPlusPressed,
        ),
      ],
    );
  }
}
