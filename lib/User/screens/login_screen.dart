import 'register.dart';
import 'package:daily_tracker_diet_app/User/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  static String id = 'LoginScreen';
  Pattern pattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  @override
  Widget build(BuildContext context) {
    // double widthScreen = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 130),
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
                padding: EdgeInsets.only(left: 80),
                child: GestureDetector(
                  onTap: () {
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
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 80),
                    child: Center(
                      child: Text(
                        "Welcome",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600],
                            fontSize: 40),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 9.0,
                                    offset: Offset(5, 5)),
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  validator: (val) {
                                    if (val.isEmpty)
                                      return 'Enter the Email';
                                    else {
                                      RegExp regexp = new RegExp(pattern);
                                      if (!regexp.hasMatch(val))
                                        return 'Enter a valid Email';
                                      else
                                        return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Your Name",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400])),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 9.0,
                                    offset: Offset(5, 5)),
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  validator: (String value) => value.length < 6
                                      ? 'Please enter atleast 6 characters'
                                      : null,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400])),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          "Forget Password?",
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            gradient: LinearGradient(colors: [
                              Color.fromRGBO(9, 180, 78, 1),
                              Color.fromRGBO(9, 180, 78, 1)
                            ]),
                          ),
                          child: Center(
                            child: RaisedButton(
                                child: Text(
                              "Sign In",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Don't have an account?",
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'Register');
                              },
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 100),
                              child: Image(
                                height: 60,
                                width: 40,
                                image: AssetImage(
                                    'assets/images/icons/googleicon.png'),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 80),
                              child: Image(
                                height: 60,
                                width: 40,
                                image: AssetImage(
                                    'assets/images/icons/facbook-icon-png-4.jpg'),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
