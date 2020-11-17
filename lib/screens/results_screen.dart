import 'package:flutter/material.dart';
import 'package:tdee_calculator/components/custom_card.dart';
import 'package:tdee_calculator/components/result_card_content.dart';
import 'package:tdee_calculator/components/bottom_button.dart';
import 'package:tdee_calculator/components/scrollable_wrapper.dart';

class ResultsScreen extends StatelessWidget {
  final int bmr;
  final int tdee;
  final int suggestedCalories;

  ResultsScreen({
    this.bmr,
    this.tdee,
    this.suggestedCalories,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      // Make the entire screen scrollable if there is not enough room to see the entire contents
      body: ScrollableWrapper(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CustomCard(
              child: ResultCardContent(
                title: 'BMR',
                description: 'Basal Metabolic Rate',
                result: bmr,
                additionalInfo:
                    'Basal Metabolic Rate—the amount of energy expended while at rest',
              ),
            ),
            CustomCard(
              child: ResultCardContent(
                title: 'TDEE',
                description: 'Total Daily Energy Expenditure',
                result: tdee,
              ),
            ),
            CustomCard(
              child: ResultCardContent(
                title: 'Suggested Calories',
                description: 'Based on selected goal',
                result: suggestedCalories,
              ),
            ),
            BottomButton(
              title: 'RECALCULATE',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
