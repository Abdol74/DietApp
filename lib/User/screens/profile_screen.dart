import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:daily_tracker_diet_app/User/models/icon_content.dart';
import 'package:daily_tracker_diet_app/User/models/reusable_card.dart';
import 'package:daily_tracker_diet_app/User/models/bottom_navigation_bar.dart';
import 'package:daily_tracker_diet_app/User//screens/tips_screen.dart';
import 'calender_screen.dart';

class profileScreen extends StatefulWidget {
  static const String id = 'profile_screen';
  @override
  _profileScreenState createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF09B44D),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.all(1.0),
              padding: EdgeInsets.only(left: 5.0, right: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(70.0),
                  bottomLeft: Radius.circular(70.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {},
                        child: Image.asset(
                          'images/arrow.png',
                          width: 20.0,
                          height: 20.0,
                        ),
                      ),
                      Image(
                        image: AssetImage('images/logo.png'),
                        width: 70.0,
                        height: 70.0,
                      ),
                    ],
                  )),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Image(
                          image: AssetImage('images/profile.png'),
                          width: 70.0,
                          height: 100.0,
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              'USER NAME',
                              style: TextStyle(
                                  color: Color(0xFF09B44D),
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                            Text('Streak',
                                style: TextStyle(
                                  color: Color(0xFF09B44D),
                                  fontSize: 15.0,
                                )),
                            Text(
                              '1 Day',
                              style: TextStyle(
                                  color: Color(0xFF09B44D), fontSize: 15.0),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: reusableCode(
                    onPress: () {},
                    colour: Colors.white,
                    cardChild: inputCard(
                      image: Image.asset(
                        'images/cutlery-77.png',
                        width: 40.0,
                        height: 40.0,
                      ),
                      label: 'Meal',
                    ),
                  ),
                ),
                Expanded(
                  child: reusableCode(
                    onPress: () {},
                    colour: Colors.white,
                    cardChild: inputCard(
                      image: Image.asset(
                        'images/stretching.png',
                        width: 40.0,
                        height: 40.0,
                      ),
                      label: 'Workout',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: reusableCode(
                    onPress: () {},
                    colour: Colors.white,
                    cardChild: inputCard(
                      image: Image.asset(
                        'images/weight-scale.png',
                        width: 40.0,
                        height: 40.0,
                      ),
                      label: 'Weight',
                    ),
                  ),
                ),
                Expanded(
                  child: reusableCode(
                    onPress: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => tipsScreen()));
                    },
                    colour: Colors.white,
                    cardChild: inputCard(
                      image: Image.asset(
                        'images/bulb-63.png',
                        width: 40.0,
                        height: 40.0,
                      ),
                      label: 'Tips',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: reusableCode(
                    onPress: () {},
                    colour: Colors.white,
                    cardChild: inputCard(
                      image: Image.asset(
                        'images/calendar-grid-61.png',
                        width: 40.0,
                        height: 40.0,
                      ),
                      label: 'History',
                    ),
                  ),
                ),
                Expanded(
                  child: reusableCode(
                    onPress: () {},
                    colour: Colors.white,
                    cardChild: inputCard(
                      image: Image.asset(
                        'images/support.png',
                        width: 40.0,
                        height: 40.0,
                      ),
                      label: 'Support',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: reusableCode(
                    onPress: () {},
                    colour: Colors.white,
                    cardChild: inputCard(
                      image: Image.asset(
                        'images/home.png',
                        width: 40.0,
                        height: 40.0,
                      ),
                      label: 'Home',
                    ),
                  ),
                ),
                Expanded(
                  child: reusableCode(
                    onPress: () {},
                    colour: Colors.white,
                    cardChild: inputCard(
                      image: Image.asset(
                        'images/setting.png',
                        width: 40.0,
                        height: 40.0,
                      ),
                      label: ' Update Profile ',
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar(
              backgroundcolor: Colors.white,
              selecteditemcolor: Color(0xFF09B44D),
              unselecteditemColor: Color(0xFF61D27C))
        ],
      ),
    );
  }
}
