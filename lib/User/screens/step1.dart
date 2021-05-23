import 'package:daily_tracker_diet_app/User/screens/step2.dart';
import 'welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:daily_tracker_diet_app/User/screens/step4.dart';

class StepOne extends StatelessWidget {
  static String id = ' StepOne ';
  final String uId;
  final String clientName;
  StepOne({this.uId, this.clientName});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Container(
                padding: EdgeInsets.only(right: 100),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, WelcomeScreen.id);
                  },
                  child: Image.asset(
                    "assets/images/icons/arrow.png",
                    height: 55,
                    width: 20,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  "Step 1 of 4",
                  style: TextStyle(color: Colors.green, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/icons/croppedbackground.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 80),
                  child: Center(
                    child: Text(
                      "Welcome",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                          fontSize: 50),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Image(
                        width: 370,
                        height: 240,
                        image: AssetImage(
                          'assets/images/step1.png',
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 1,
                width: 10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 190),
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(70),
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(9, 180, 78, 1),
                    Color.fromRGBO(9, 180, 78, 1)
                  ]),
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return StepTwo(
                            currentClientId: uId, clientName: clientName);
                      }));
                    },
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
