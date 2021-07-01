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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        child: new Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/step1 background.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                height: 50,
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
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 140,
                    ),
                    Text(
                      "STEP 1 of 2",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Text(
                "Welcome",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                    fontSize: 50),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Image(
                  width: 370,
                  height: 240,
                  image: AssetImage(
                    'assets/images/step1.png',
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 190),
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(70),
                  color: Color(0xFF09C04F),
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
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
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
