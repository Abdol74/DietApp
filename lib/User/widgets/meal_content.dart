import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_tracker_diet_app/User/screens/view_categories.dart';
import 'package:flutter/material.dart';
import 'package:daily_tracker_diet_app/constants.dart';
import 'package:daily_tracker_diet_app/User/screens/Add_component_meal.dart';

class MealContent extends StatelessWidget {
  final String mealName;
  final String numberOfCalories;
  final String mealId;

  MealContent({this.mealName, this.numberOfCalories, this.mealId});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Column(
          children: [
            Text(
              mealName,
              style: kMealStyle,
            ),
            Text(
              'completed',
              style: kCompletedStyle,
            ),
            SizedBox(
              height: 20.0,
              width: 200.0,
              child: kDividerStyle,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    numberOfCalories,
                    style: kAdditionalNamesStyle,
                  ),
                  FlatButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MealCategories(
                            mealType: mealId,
                          );
                        }));
                      },
                      child: Icon(Icons.add)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
