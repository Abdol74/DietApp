import 'package:flutter/material.dart';
import 'package:daily_tracker_diet_app/User/models/bottom_navigation_bar.dart';

class Cardio extends StatefulWidget {
  static const String id = 'cardio';
  @override
  _CardioState createState() => _CardioState();
}

class _CardioState extends State<Cardio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF09B44D)),
        leading: Icon(
          Icons.arrow_back,
        ),
        title: Row(
          children: <Widget>[
            Image.asset(
              'images/stretching.png',
              width: 30.0,
              height: 30.0,
            ),
            const Text('Cardio',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF09B44D),
                )),
          ],
        ),
        actions: [
          Icon(Icons.notifications),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search),
          ),
        ],
        toolbarHeight: 60.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(40.0),
          bottomLeft: Radius.circular(40.0),
        )),
        backgroundColor: Colors.white,
      ),
      body: Scaffold(
          bottomNavigationBar: bottomNavigationBar(
        backgroundcolor: Color(0xFF09B44D),
        selecteditemcolor: Colors.white,
        unselecteditemColor: Colors.white.withOpacity(.60),
      )),
    );
  }
}
