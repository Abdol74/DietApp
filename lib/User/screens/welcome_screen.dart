import 'package:daily_tracker_diet_app/User/screens/step2.dart';

import 'constants.dart';
import 'package:daily_tracker_diet_app/User/screens/login_screen.dart';
import 'package:daily_tracker_diet_app/User/screens/step1.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WelcomeScreen extends StatelessWidget {
  static String id = 'WelcomeScreen ';
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  final String uId;
  final String clientName;
  WelcomeScreen({this.uId, this.clientName});

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              margin: EdgeInsets.only(top: 100),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/DAILY-TRACKER-logo.png'),
                ),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                width: 250,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return StepOne(
                          uId: uId,
                          clientName: clientName,
                        );
                      }));
                    },
                    color: kPrimaryColor,
                    child: Text(
                      "START NOW",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Already have an account?",
                  style: TextStyle(color: kPrimaryColor),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                        color: kPrimaryColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
