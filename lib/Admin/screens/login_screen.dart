//import 'package:dailytracker/register.dart';
//import 'package:dailytracker/welcome_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_tracker_diet_app/Admin/models/users_model.dart';
import 'package:daily_tracker_diet_app/Admin/screens/add_meal_screen.dart';
import 'package:daily_tracker_diet_app/User/screens/update_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:daily_tracker_diet_app/Admin/screens/admin_home.dart';
import 'package:flutter/material.dart';
import 'meal_home.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body:Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/images/back1.png'),
            fit: BoxFit.fill,
           ),
                ),
        child:ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                top: 0.0,
                bottom: 10.0,
                left: 300.0,
              ),
              child: Image(image: AssetImage('assets/images/logosmall.png')),
            ),
        Container(
          height: 200,
          width: 400,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/log.png'),
            ),
          ),),
            Container(
              margin: EdgeInsets.only(top: 5.0),
              child: Center(
                child: Text(
                  "Welcome",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                      fontSize: 50),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(14.0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          cursorWidth: 4,
                          cursorColor: Colors.green,
                          decoration: InputDecoration(
                            labelText: 'Enter your Mail',
                            labelStyle:
                            TextStyle(color: Colors.green, fontSize: 14),
                            fillColor: Colors.white.withOpacity(0.10),
                            filled: true,
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(40.0),
                              ),
                              borderSide: new BorderSide(
                                color: Colors.green,
                                width: 1.0,
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            email = value;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          obscureText: true,
                          onChanged: (value) {
                            password = value;
                          },
                          cursorWidth: 4,
                          cursorColor: Colors.green,
                          decoration: InputDecoration(
                            labelText: 'Enter your Password',
                            labelStyle:
                            TextStyle(color: Colors.green, fontSize: 14),
                            fillColor: Colors.white.withOpacity(0.10),
                            filled: true,
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(40.0),
                              ),
                              borderSide: new BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xFF09B44D),
                    ),
                    height: 40.0,
                    width: 250.0,
                    child: FlatButton(
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 20,
                          color: const Color(0xffffffff),
                        ),
                      ),
                      onPressed: () async {
                        setState(() {});
                        try {
                          final currentUser =
                              await _auth.signInWithEmailAndPassword(
                                  email: email, password: password);

                          if (currentUser != null) {
                            authorizeAccess(context);
                            //    Navigator.pushNamed(context, update_profile.id);
                          }
                          setState(() {});
                        } catch (e) {
                          print(e);
                        }
                      },
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(
                            fontFamily: 'Roboto', color: Colors.grey[600]),
                      ),
                      GestureDetector(
                        onTap: () {
                          //Navigator.pushNamed(context, Register.id);
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Image(
                          height: 60,
                          width: 40,
                          image:
                              AssetImage('assets/images/icons/googleicon.png'),
                        ),
                      ),
                      SizedBox(
                        width: 50.0,
                      ),
                      Container(
                        child: Image(
                          height: 60,
                          width: 40,
                          image: AssetImage(
                              'assets/images/icons/facebookicon.png'),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                    ],
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

authorizeAccess(BuildContext context) {
  FirebaseAuth.instance.currentUser().then((user) {
    Firestore.instance
        .collection('Users')
        .where('id', isEqualTo: user.uid)
        .getDocuments()
        .then((docs) {
      if (docs.documents[0].exists) {
        if (docs.documents[0].data['roleId'] == '1sDEqpaFQmHc9OMz0ESl') {
          Navigator.pushNamed(context, update_profile.id);
        } else {
          Navigator.pushNamed(context, Profile.id);
        }
      }
    });
  });
}
