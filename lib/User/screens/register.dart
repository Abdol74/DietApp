import 'package:daily_tracker_diet_app/User/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'login_screen.dart';

class Register extends StatelessWidget {
  static String id = 'Register';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:  AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children:<Widget>[
              Container(
                padding: EdgeInsets.only(right: 130),
                child:
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, WelcomeScreen.id);
                  },
                  child: Image.asset(
                    "assets//images/icons/arrow.png",

                    height: 55,
                    width: 20,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 80),
                child:
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, WelcomeScreen.id);
                  },
                  child: Image.asset(
                    "assets/images/DAILY-TRACKER-logo.png",

                    height: 55,
                    width: 90,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/croppedbackground2.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "FINALLY,",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600],
                            fontSize: 25,
                            fontFamily: "Roboto"),
                      ),
                      Text(
                        "Click Sign up to create an account",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 15,
                            fontFamily: "Roboto"),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(25.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 9.0,
                                offset: Offset(5, 5)),
                          ]),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "First Name",
                            hintStyle: TextStyle(color: Colors.grey[400])),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 9.0,
                                offset: Offset(5, 5)),
                          ]),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Last Name",
                            hintStyle: TextStyle(color: Colors.grey[400])),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 9.0,
                                offset: Offset(5, 5)),
                          ]),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.grey[400])),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 9.0,
                                offset: Offset(5, 5)),
                          ]),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.grey[400])),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 9.0,
                                offset: Offset(5, 5)),
                          ]),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Confirm Password",
                            hintStyle: TextStyle(color: Colors.grey[400])),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(9, 180, 78, 1),
                    Color.fromRGBO(9, 180, 78, 1)
                  ]),
                ),
                child: Center(
                  child: Text(
                    "Finish",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
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
            ],
          ),
        ),
      ),
    );
  }
}
