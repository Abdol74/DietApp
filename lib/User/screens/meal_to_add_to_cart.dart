import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_tracker_diet_app/Admin/Provider/meal_provider.dart';
import 'package:daily_tracker_diet_app/Admin/screens/Approve_meal.dart';
import 'package:daily_tracker_diet_app/User/helpers/meal_services.dart';
import 'package:daily_tracker_diet_app/User/helpers/measure_brain.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_tracker_diet_app/User/screens/meals_by_user_type.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';

FirebaseUser loggedInUser;

class MealCart extends StatefulWidget {
  final String mealType;
  final String mealTypeName;
  MealCart({this.mealType, this.mealTypeName});
  @override
  _MealCartState createState() => _MealCartState();
}

class _MealCartState extends State<MealCart> {
  double differenceCalories;
  double currentCalories;
  bool equalDate = true;
  String todaydate;
  String userDate;
  int standardCalory;
  double requiredCalories;
  int shouldburnCalories = 0;
  String getdocumentID = "";
  @override
  void initState() {
    // TODO: implement initState
    MealProvider mealProvider =
        Provider.of<MealProvider>(context, listen: false);
    getDifferenceCalories();
    getRequiredCalories();
    updateCalory();
    getCurrentDate();
    printDates();

    //getRemaingCalories();

    getCurrentUser();

    super.initState();
  }

  getCurrentDate() async {
    var date = new DateTime.now().toString();
    var dateParse = DateTime.parse(date);
    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
    setState(() {
      todaydate = formattedDate.toString();
    });
  }

  getDifferenceCalories() async* {
    try {
      await Firestore.instance
          .collection("UserCurrentCalory")
          .document("l1qhUkw25ZjKJkk1Jzv5")
          .get()
          .then((cal) {
        setState(() {
          differenceCalories = cal.data["requiredCalories"];
        });
      });
    } catch (e) {
      print(e);
    }
  }

  void printDates() {
    print("function Print Dates");
    print(todaydate);
    print(equalDate);
  }

  final fireStore = Firestore.instance;
  updateCalory() async {
    final user = await _auth.currentUser();
    await Firestore.instance
        .collection("Clients")
        .where("clientId", isEqualTo: user.uid.toString())
        .getDocuments()
        .then((cal) async {
      userDate = cal.documents[0].data["date"].toString();
      requiredCalories = cal.documents[0].data["caloriesRequired"];
      getdocumentID = cal.documents[0].documentID;

      if (userDate != todaydate) {
        await Firestore.instance
            .collection("Clients")
            .document(getdocumentID)
            .updateData({
          "date": todaydate,
          " remaining calories": requiredCalories,
        }).then((_) {});
        getRemaingCalories();
      } else
        getRemaingCalories();
    });
  }

  getRequiredCalories() async {
    try {
      await Firestore.instance
          .collection("UserCurrentCalory")
          .document("l1qhUkw25ZjKJkk1Jzv5")
          .get()
          .then((cal) {
        setState(() {
          requiredCalories = cal.data["requiredCalories"];
        });
      });
    } catch (e) {
      print(e);
    }
  }

  getRemaingCalories() async {
    try {
      final user = await _auth.currentUser();

      await Firestore.instance
          .collection("Clients")
          .where("clientId", isEqualTo: user.uid.toString())
          .getDocuments()
          .then((cal) {
        setState(() {
          currentCalories = cal.documents[0].data[" remaining calories"];
          getdocumentID = cal.documents[0].documentID;
        });

        print(currentCalories);
      });
    } catch (e) {
      print(e);
    }
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
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.only(left: 60, right: 60),
            child: Center(
              child: TextFormField(
                cursorWidth: 4,
                cursorColor: Colors.black,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: 'Quantity',
                  labelStyle: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'cairoSemiBold'),
                  fillColor: Colors.white.withOpacity(.85),
                  filled: true,
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(25),
                    ),
                    borderSide: new BorderSide(
                      color: Colors.red,
                      width: 1.0,
                    ),
                  ),
                ),
                initialValue: (mealProvider.currentMealToAddToUser.measure ==
                        null)
                    ? 'Insert Measure '
                    : mealProvider.currentMealToAddToUser.measure.toString(),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly
                ],
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
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
                  mealProvider.currentMealToAddToUser.measure =
                      int.parse(value);
                },
              ),
            ),
          ),
        ],
      );
    }

    final _firestore = Firestore.instance;

    return Scaffold(
      backgroundColor: Colors.white,
      body: new ListView(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Color(0xFF09C04F)),
            child: Row(
              children: [
                Text("Remaining Calories"),
                SizedBox(width: 30),
                Text(currentCalories.toString()),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            height: 350,
            width: 20,
            decoration: BoxDecoration(
                color: Color(0xFF09C04F),
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
                Column(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Text(
                        mealProvider.currentMealToAddToUser.mealName,
                        style: TextStyle(
                            fontSize: 32,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Shadows'),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 25, right: 26),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(32)),
                          padding: EdgeInsets.only(left: 3, right: 8),
                          child: Row(
                            children: [
                              Text(
                                'Calories ',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'cairoSemiBold'),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Text(
                                '${mealProvider.currentMealToAddToUser.caloriesNumber}'
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'cairoSemiBold'),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 25, right: 26),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(32)),
                          padding: EdgeInsets.only(left: 3, right: 2),
                          child: Row(
                            children: [
                              Text(
                                'Protein',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'cairoSemiBold'),
                              ),
                              SizedBox(
                                width: 60,
                              ),
                              Text(
                                '${mealProvider.currentMealToAddToUser.protein}'
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'cairoSemiBold'),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 25, right: 26),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(32)),
                          padding: EdgeInsets.only(left: 3, right: 2),
                          child: Row(
                            children: [
                              Text(
                                'Carb',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'cairoSemiBold'),
                              ),
                              SizedBox(
                                width: 95,
                              ),
                              Text(
                                '${mealProvider.currentMealToAddToUser.carb.toString()}',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'cairoSemiBold'),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 25, right: 26),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(32)),
                          padding: EdgeInsets.only(left: 3, right: 2),
                          child: Row(
                            children: [
                              Text(
                                'Fats',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'cairoSemiBold'),
                              ),
                              SizedBox(
                                width: 95,
                              ),
                              Text(
                                '${mealProvider.currentMealToAddToUser.fats.toString()}',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'cairoSemiBold'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
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
                width: 20,
              ),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 90, height: 90),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    primary: Colors.green, // background
                    onPrimary: Colors.white,
                    // foreground
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
                  child: Container(
                      child: Text('Calculate',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Shadows'))),
                ),
              ),
              SizedBox(width: 20),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 90, height: 90),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
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

                    String userGoal;

                    final fireStore = Firestore.instance;
                    fireStore
                        .collection("UserCurrentCalory")
                        .document("l1qhUkw25ZjKJkk1Jzv5")
                        .get()
                        .then((da) {
                      userGoal = da.data["goalName"].toString();
                      shouldburnCalories = da.data["shouldburnCalory"];

                      setState(() {
                        if (currentCalories >=
                            mealProvider
                                .currentMealToAddToUser.caloriesNumber) {
                          currentCalories -= mealProvider
                              .currentMealToAddToUser.caloriesNumber;
                          fireStore
                              .collection("Clients")
                              .document(getdocumentID)
                              .updateData({
                            " remaining calories": currentCalories,
                          }).then((_) {
                            print(currentCalories);
                            fireStore.collection('UserMealComponents').add({
                              'mealTypeId': widget.mealType,
                              'mealTypeName': widget.mealTypeName,
                              'mealComponentName':
                                  mealProvider.currentMealToAddToUser.mealName,
                              'mealComponentId':
                                  mealProvider.currentMealToAddToUser.id,
                              'userId': loggedInUser.uid,
                              'mealComponentsCounts':
                                  mealProvider.currentMealToAddToUser.measure,
                            });

                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return MealsByUserAndType(
                                uid: loggedInUser.uid,
                                mealType: widget.mealType,
                              );
                            }));
                          });
                        } else
                          print("You should burn calories to eat more");
                      });
                    });
                  },
                  child: Text('Add',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Shadows')),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
