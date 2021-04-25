import 'package:flutter/material.dart';
import 'package:daily_tracker_diet_app/User/models/tips_button.dart';
import 'package:daily_tracker_diet_app/User/models/bottom_navigation_bar.dart';
import 'package:daily_tracker_diet_app/User/screens/popup_screen.dart';

class tipsScreen extends StatefulWidget {
  static const String id = 'tips_screen';
  @override
  _tipsScreenState createState() => _tipsScreenState();
}

class _tipsScreenState extends State<tipsScreen> {
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
              'images/bulb-63.png',
              width: 30.0,
              height: 30.0,
            ),
            SizedBox(
              width: 10.0,
            ),
            const Text('Tips',
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
        toolbarHeight: 80.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(40.0),
          bottomLeft: Radius.circular(40.0),
        )),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: tip(
              title: 'About training',
              ontap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return popup(
                        title: 'About Training',
                        dialog:
                            'Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna ',
                      );
                    });
              },
            ),
          ),
          Divider(
            height: 10.0,
            endIndent: 35.0,
            indent: 35.0,
            thickness: 2.0,
            color: Colors.grey.shade300,
          ),
          Expanded(
            child: tip(
              title: 'How to lose Weight?',
              ontap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return popup(
                        title: 'How to lose Weight?',
                        dialog:
                            'Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna ',
                      );
                    });
              },
            ),
          ),
          Divider(
            height: 10.0,
            endIndent: 35.0,
            indent: 35.0,
            thickness: 2.0,
            color: Colors.grey.shade300,
          ),
          Expanded(
            child: tip(
              title: 'Introducing about meal plan',
              ontap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return popup(
                        title: 'Introducing about meal plan',
                        dialog:
                            'Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna ',
                      );
                    });
              },
            ),
          ),
          Divider(
            height: 10.0,
            endIndent: 35.0,
            indent: 35.0,
            thickness: 2.0,
            color: Colors.grey.shade300,
          ),
          Expanded(
            child: tip(
              title: 'Drink Water',
              ontap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return popup(
                        title: 'Drink Water',
                        dialog:
                            'Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna ',
                      );
                    });
              },
            ),
          ),
          Divider(
            height: 10.0,
            endIndent: 35.0,
            indent: 35.0,
            thickness: 2.0,
            color: Colors.grey.shade300,
          ),
          Expanded(
            child: tip(
              title: 'How many times a day to eat',
              ontap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return popup(
                        title: 'How many times a day to eat',
                        dialog:
                            'Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna ',
                      );
                    });
              },
            ),
          ),
          Divider(
            height: 10.0,
            endIndent: 35.0,
            indent: 35.0,
            thickness: 2.0,
            color: Colors.grey.shade300,
          ),
          Expanded(
            child: tip(
              title: 'Appeal tips',
              ontap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return popup(
                        title: 'Appeal tips',
                        dialog:
                            'Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna ',
                      );
                    });
              },
            ),
          ),
          bottomNavigationBar(
            backgroundcolor: Color(0xFF09B44D),
            selecteditemcolor: Colors.white,
            unselecteditemColor: Colors.white.withOpacity(.60),
          ),
        ],
      ),
    );
  }
}
