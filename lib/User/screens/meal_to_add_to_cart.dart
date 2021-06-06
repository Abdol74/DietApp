import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_tracker_diet_app/Admin/Provider/meal_provider.dart';
import 'package:daily_tracker_diet_app/Admin/screens/Approve_meal.dart';
import 'package:daily_tracker_diet_app/User/helpers/measure_brain.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';

FirebaseUser loggedInUser;

class MealCart extends StatefulWidget {
  final String mealType;
  MealCart({this.mealType});
  @override
  _MealCartState createState() => _MealCartState();
}

class _MealCartState extends State<MealCart> {
  @override
  void initState() {
    // TODO: implement initState
    MealProvider mealProvider =
        Provider.of<MealProvider>(context, listen: false);
    getCurrentUser();
    super.initState();
  }

  final _auth = FirebaseAuth.instance;
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  int measure;
  @override
  Widget build(BuildContext context) {
    MealProvider mealProvider = Provider.of<MealProvider>(context);
    Future<void> _refreshList() async {}
    Widget _buildMealMeasureField() {
      return Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: TextFormField(
              cursorWidth: 4,
              cursorColor: Colors.green,
              decoration: InputDecoration(
                labelText: 'measure',
                labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                fillColor: Colors.white.withOpacity(0.6),
                filled: true,
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(8.0),
                  ),
                  borderSide: new BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                ),
              ),
              initialValue:
                  (mealProvider.currentMealToAddToUser.measure == null)
                      ? 'Insert Measure '
                      : mealProvider.currentMealToAddToUser.measure.toString(),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly
              ],
              style: TextStyle(fontSize: 15, color: Colors.green),
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Measure is required';
                }

                return null;
              },
              // onSaved: (String value) {
              //   setState(() {
              //     mealProvider.currentMealToAddToUser.measure =
              //         int.parse(value);
              //   });
              // },
              onChanged: (String value) {
                mealProvider.currentMealToAddToUser.measure = int.parse(value);
              },
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: new ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 500,
            width: 20,
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[600],
                    blurRadius: 20,
                  )
                ]),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 040,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 150,
                      width: 190,
                      child: Image.network(
                          mealProvider.currentMealToAddToUser.imageUrl),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          mealProvider.currentMealToAddToUser.mealName,
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Calories : ${mealProvider.currentMealToAddToUser.caloriesNumber}'
                              .toString(),
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Protein : ${mealProvider.currentMealToAddToUser.protein}'
                              .toString(),
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'carb : ${mealProvider.currentMealToAddToUser.carb.toString()}',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'fats : ${mealProvider.currentMealToAddToUser.fats.toString()}',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
                _buildMealMeasureField(),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 100,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () {
                  print(mealProvider.currentMealToAddToUser.measure);
                  double newMeasure =
                      mealProvider.currentMealToAddToUser.measure / 100;

                  setState(() {
                    mealProvider.currentMealToAddToUser.caloriesNumber =
                        mealProvider.currentMealToAddToUser.caloriesNumber *
                            newMeasure.toInt();

                    mealProvider.currentMealToAddToUser.protein =
                        mealProvider.currentMealToAddToUser.protein *
                            newMeasure.toInt();

                    mealProvider.currentMealToAddToUser.fats =
                        mealProvider.currentMealToAddToUser.fats *
                            newMeasure.toInt();
                    mealProvider.currentMealToAddToUser.carb =
                        mealProvider.currentMealToAddToUser.carb *
                            newMeasure.toInt();
                  });
                },
                child: Text('Calculate'),
              ),
              SizedBox(width: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () async {
                  await Firestore.instance
                      .collection('UserMealComponents')
                      .add({
                    'mealComponentId': mealProvider.currentMealToAddToUser.id,
                    'mealComponentName':
                        mealProvider.currentMealToAddToUser.mealName,
                    'mealComponentCounts':
                        mealProvider.currentMealToAddToUser.measure,
                    'mealTypeId': widget.mealType,
                    'userId': loggedInUser.uid,
                  });
                },
                child: Text('Add'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
