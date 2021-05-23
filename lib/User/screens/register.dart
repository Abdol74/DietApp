import 'package:daily_tracker_diet_app/User/screens/step1.dart';
import 'package:daily_tracker_diet_app/User/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'constants.dart';
import 'login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Register extends StatefulWidget {
  static const String id = 'Register';

  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<Register> {
  final fireStore = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();
  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  Pattern pattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    "assets/images/icons/DAILY-TRACKER-logo.png",
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
                child: Form(
                    key: _formKey,
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
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Enter the First Name';
                              } else if (val.length < 3)
                                return 'The length of the name must be greater than 3';
                              else
                                return null;
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "First Name",
                                hintStyle: TextStyle(color: Colors.grey[400])),
                            onChanged: (val) {
                              setState(() => firstName = val);
                            },
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
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Enter the Last Name';
                              } else if (val.length < 3)
                                return 'The length of the name must be greater than 3';
                              else
                                return null;
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Last Name",
                                hintStyle: TextStyle(color: Colors.grey[400])),
                            onChanged: (val) {
                              setState(() => lastName = val);
                            },
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
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            textAlign: TextAlign.center,
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
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.grey[400])),
                            onChanged: (val) {
                              setState(() => email = val);
                            },
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
                          child: TextFormField(
                            controller: _passwordController,
                            textAlign: TextAlign.center,
                            validator: (String value) => value.length < 6
                                ? 'Please enter atleast 6 characters'
                                : null,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.grey[400])),
                            onChanged: (val) {
                              setState(() => password = val);
                            },
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
                          child: TextFormField(
                            controller: _confirmPasswordController,
                            validator: (val) {
                              if (val != _passwordController.value.text) {
                                return 'passwords don\'t match';
                              } else
                                return null;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Confirm Password",
                                hintStyle: TextStyle(color: Colors.grey[400])),
                          ),
                        ),
                      ],
                    )),
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
                  child: RaisedButton(
                      child: Text(
                        "Finish",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          print(firstName);
                          try {
                            final newUser =
                                await _auth.createUserWithEmailAndPassword(
                                    email: email, password: password);
                            final FirebaseUser user =
                                await FirebaseAuth.instance.currentUser();
                            final String uid = user.uid.toString();
                            fireStore.collection('Users').add({
                              'FirstName': firstName,
                              'LastName': lastName,
                              'Email': email,
                              'id': uid,
                              'roleId': "1sDEqpaFQmHc9OMz0ESl"
                            });
                            if (newUser != null) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return WelcomeScreen(
                                  uId: uid,
                                  clientName: user.email,
                                );
                              }));
                            }
                          } catch (e) {
                            print(e);
                          }
                        }
                      }),
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
