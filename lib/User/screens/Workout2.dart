import 'package:flutter/material.dart';
import 'package:daily_tracker_diet_app/User/models/bottom_navigation_bar.dart';

// ignore: camel_case_types
class Workout2_screen extends StatefulWidget {
  static const String id = 'Workout2_screen';
  @override
  _Workout2_screenState createState() => _Workout2_screenState();
}

// ignore: camel_case_types
class _Workout2_screenState extends State<Workout2_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF09B44D),
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
              const Text('Workouts',
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
        body: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            child: Expanded(
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text(
                        'Pick A Workout type',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Text(
                        'Pick you exercise and Feel Motivated everyday and every time, your streaks go up',
                        style: TextStyle(color: Colors.white, fontSize: 15.0),
                      )),
                  Expanded(
                    child: Container(
                      width: 250.0,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: FlatButton(
                          onPressed: () {},
                          child: Text(
                            'Cardio',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          color: Colors.white,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 250.0,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: FlatButton(
                          onPressed: () {},
                          child: Text(
                            'Running',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          color: Colors.white,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 250.0,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: FlatButton(
                          onPressed: () {},
                          child: Text(
                            'Yoga',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          color: Colors.white,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: bottomNavigationBar());
  }
}
