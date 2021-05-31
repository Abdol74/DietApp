import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:daily_tracker_diet_app/Admin/screens/Approve_meal.dart';

final _firestore = Firestore.instance;

class MealBubble extends StatelessWidget {
  const MealBubble(
      {this.mealName,
      this.fat,
      this.protein,
      this.calories,
      this.mealImage,
      this.desc,
      this.id,
      this.carb,
      this.addMeal,
      this.deleteMeal});

  final String mealImage;
  final String mealName;
  final String desc;
  final String calories;
  final String carb;
  final String id;
  final String fat;
  final String protein;
  final deleteMeal;
  final addMeal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(
              width: 15,
            ),
            Container(
                width: 90,
                height: 100,
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: (mealImage == null)
                    ? Image.asset('assets/images/person.png')
                    : Image.network(mealImage)),
            SizedBox(
              width: 15,
            ),
            Column(
              children: [
                Text(
                  "$mealName",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 150.0,
                  child: Text(
                    "$desc",
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              width: 80,
              height: 80,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.only(top: 15.0, left: 12.0, right: 12.0),
                    child: Text(
                      "Calories",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("$calories"),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                width: 100.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Color(0xFF09B44D),
                  ),
                  width: 35.0,
                  height: 40.0,
                  child: TextButton(
                    onPressed: () async {
                      await (mealImage);
                      await _firestore.collection('MealComponents').add({
                        'mealName': mealName,
                        'caloriesNumber': calories,
                        'carb': carb,
                        'fats': fat,
                        'protein': protein,
                        'image': mealImage,
                        'description': desc
                      });
                      await _firestore
                          .collection("MealComponentsTemp")
                          .document('$id')
                          .delete();
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.grey.shade400,
                      size: 20.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Color(0xFF09B44D),
                  ),
                  width: 35.0,
                  height: 40.0,
                  child: TextButton(
                    onPressed: () async {
                      await _firestore
                          .collection("MealComponentsTemp")
                          .document('$id')
                          .delete();
                    },
                    child: Icon(
                      Icons.delete,
                      color: Colors.grey.shade400,
                      size: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 30.0,
              ),
              Expanded(
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.grey,
                  ),
                  child: Expanded(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text('$protein'),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 0, left: 2.0, right: 2.0),
                          child: Text(
                            "protein",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Expanded(
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.grey,
                  ),
                  child: Expanded(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text('$carb'),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 0, left: 2.0, right: 2.0),
                          child: Text(
                            "Carb",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Expanded(
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.grey,
                  ),
                  child: Expanded(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 5.0, bottom: 5.0, right: 5.0, left: 5.0),
                          child: Text('$fat'),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 0, left: 2.0, right: 2.0),
                          child: Text(
                            "Fat",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
