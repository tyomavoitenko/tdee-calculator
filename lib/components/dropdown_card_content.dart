import 'package:flutter/material.dart';
import 'package:tdee_calculator/constants.dart';
import 'package:tdee_calculator/models/option.dart';

class DropdownCardContent extends StatelessWidget {
  DropdownCardContent({
    @required this.label,
    @required this.value,
    @required this.options,
    @required this.onChanged,
  });

  final String label;
  final String value;
  final List<Option> options;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(label),
        SizedBox(
          height: 10,
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton(
            value: value,
            onChanged: onChanged,
            icon: Icon(
              Icons.arrow_downward,
              color: kMainTextColor,
            ),
            iconSize: 24,
            items: options.map((Option option) {
              return DropdownMenuItem(
                value: option.multiplier.toString(),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        option.title.toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      alignment: Alignment.center,
                      width: 280,
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        option.description,
                        style: kSecondaryTextStyle,
                      ),
                      alignment: Alignment.center,
                      width: 280,
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
