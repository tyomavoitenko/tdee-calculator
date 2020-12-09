import 'package:flutter/material.dart';
import 'package:tdee_calculator/constants.dart';
import 'package:tdee_calculator/models/option.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    ScreenUtil.init(context, designSize: designSize);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(fontSize: kLabelFontSize.w),
        ),
        SizedBox(
          height: 10.w,
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton(
            value: value,
            onChanged: onChanged,
            icon: Icon(
              Icons.arrow_downward,
              color: kMainTextColor,
            ),
            iconSize: kIconSize.w,
            items: options.map((Option option) {
              return DropdownMenuItem(
                value: option.multiplier.toString(),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Text(
                        option.title.toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.w,
                        ),
                      ),
                      alignment: Alignment.center,
                      width: 280.w,
                    ),
                    SizedBox(
                      height: 1.w,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Text(
                        option.description,
                        style: TextStyle(
                          color: kSecondaryTextColor,
                          fontSize: kSecondaryFontSize.w,
                        ),
                      ),
                      alignment: Alignment.center,
                      width: 280.w,
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
