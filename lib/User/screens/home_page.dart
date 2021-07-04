import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_tracker_diet_app/Admin/screens/Approve_meal.dart';
import 'package:daily_tracker_diet_app/User/screens/Support.dart';
import 'package:daily_tracker_diet_app/User/screens/add_component_meal.dart';
import 'package:daily_tracker_diet_app/User/screens/add_meal_user_screen.dart';
import 'package:daily_tracker_diet_app/User/screens/history.dart';
import 'package:daily_tracker_diet_app/User/screens/meals_by_user_type.dart';
import 'package:daily_tracker_diet_app/User/screens/step2.dart';
import 'package:daily_tracker_diet_app/User/screens/tips_screen.dart';
import 'package:daily_tracker_diet_app/User/screens/updateProfile2.dart';
import 'package:daily_tracker_diet_app/User/screens/update_profile.dart';
import 'package:daily_tracker_diet_app/User/screens/workout_disease.dart';
import 'package:daily_tracker_diet_app/User/screens/workout_heart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final fireStore = Firestore.instance;
FirebaseUser loggedInUser;

class home_page extends StatefulWidget {
  static String id = 'home_page';
  final String diseaseValue;
  final double age;
  final double weight;
  final Gender gender;
  home_page({this.gender, this.diseaseValue, this.weight, this.age});
  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
    // getMail();
  }

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

  // String getMail() {
  // var mailName = loggedInUser.email;
  //  return mailName;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        child: new Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/green cover.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: new ListView(
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[600],
                        blurRadius: 40,
                      )
                    ]),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(left: 20, top: 50)),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Color(0xFF09C04F),
                            size: 35.0,
                          ),
                        ),
                        SizedBox(
                          width: 90,
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              width: 100,
                              height: 80,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/logo.png'),
                                ),
                              ),
                            ),
                            Text(
                              '',
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 90,
                        ),
                        Icon(
                          Icons.notifications,
                          color: Color(0xFF09C04F),
                          size: 35.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Container(
                    height: 110,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[800],
                            blurRadius: 40,
                          )
                        ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 80,
                          height: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/h8.png'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, MealPage.id);
                          },
                          child: Text(
                            "Meal",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Container(
                    height: 110,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[800],
                            blurRadius: 40,
                          )
                        ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 80,
                          height: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/h7.png'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (widget.diseaseValue == 'Heart Disease') {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return workout_heart(
                                  age: widget.age,
                                  gender: selectedGender,
                                  weight: widget.weight,
                                  diseaseValue: widget.diseaseValue,
                                );
                              }));
                            }
                            if (widget.diseaseValue == 'Diabetes' ||
                                widget.diseaseValue == 'Hypertension' ||
                                widget.diseaseValue == 'None') {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return WorkoutDisease(
                                  diseaseValue: widget.diseaseValue,
                                  weight: widget.weight,
                                  age: widget.age,
                                );
                              }));
                            }
                          },
                          child: Text(
                            "Workout",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Container(
                    height: 110,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[800],
                            blurRadius: 40,
                          )
                        ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 80,
                          height: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/own_meal.png'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            print(loggedInUser.uid);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return MealsByUserAndType(
                                uid: loggedInUser.uid,
                              );
                            }));
                          },
                          child: Text(
                            "My Meals",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Container(
                    height: 110,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[800],
                            blurRadius: 40,
                          )
                        ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 80,
                          height: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/h5.png'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, tipsScreen.id);
                          },
                          child: Text(
                            "TIPS",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Container(
                    height: 110,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[800],
                            blurRadius: 40,
                          )
                        ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 80,
                          height: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/h1.png'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, calenderScreen.id);
                          },
                          child: Text(
                            "Charts",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Container(
                    height: 110,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[800],
                            blurRadius: 40,
                          )
                        ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 80,
                          height: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/h4.png'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Support();
                            }));
                          },
                          child: Text(
                            "Support",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Container(
                    height: 110,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[800],
                            blurRadius: 40,
                          )
                        ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 80,
                          height: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/add_meal_user.jfif'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, AddMealUser.id);
                          },
                          child: Text(
                            "Add Meal ",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Container(
                    height: 110,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[800],
                            blurRadius: 40,
                          )
                        ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 80,
                          height: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/h2.png'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, updateProfile2.id);
                          },
                          child: Text(
                            "Update profile",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
