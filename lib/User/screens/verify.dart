import 'dart:async';

import 'package:daily_tracker_diet_app/User/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class verify extends StatefulWidget {
  static String id = 'verify ';

  @override
  _verifyState createState() => _verifyState();
}

class _verifyState extends State<verify> {
  /* final _fireBaseAuth = FirebaseAuth.instance;
  Future<bool> isLoggedIn() async {
    FirebaseUser user = await _fireBaseAuth.currentUser();
    if (user == null) {
      return false;
    }
    return user.isEmailVerified;
  }
  countDownTime() async {
    return Timer(
        Duration(seconds: 5),
    () async {
      if (await userAuth.isLoggedIn()) {
        Navigator.pushReplacement(
          context,
          ScaleRoute(
            widget: HomeScreen(),),
        );
      }
    } else {
    Navigator.pushReplacement(
    context,
    ScaleRoute(
    widget: LoginScreen(),),
    );
    }
  },
  );
}
*/
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
