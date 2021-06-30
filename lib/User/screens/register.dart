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
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/step1 background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            children: <Widget>[
              Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[600],
                        blurRadius: 40,
                      )
                    ]),
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 20,),
                    Icon(
                      Icons.arrow_back,
                      color: Color(0xFF09C04F),
                      size: 30.0,
                    ),
                    SizedBox(width: 250,),
                Container(
                  height: 45,
                  width: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                ),
                  ],
                ),
              ),
              SizedBox(height: 40,),
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
                        TextFormField(
                      cursorWidth: 4,
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        labelText: 'first Name',
                        labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                        fillColor: Colors.white.withOpacity(0.6),
                        filled: true,
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(8.0),
                          ),
                          borderSide: new BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                        ),
                      ),
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Enter the First Name';
                              } else if (val.length < 3)
                                return 'The length of the name must be greater than 3';
                              else
                                return null;
                            },
                            onChanged: (val) {
                              setState(() => firstName = val);
                            },
                          ),

                        SizedBox(
                          height: 10,
                        ),
                         TextFormField(
                           cursorWidth: 4,
                           cursorColor: Colors.green,
                           decoration: InputDecoration(
                             labelText: 'LastName',
                             labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                             fillColor: Colors.white.withOpacity(0.6),
                             filled: true,
                             border: new OutlineInputBorder(
                               borderRadius: const BorderRadius.all(
                                 const Radius.circular(8.0),
                               ),
                               borderSide: new BorderSide(
                                 color: Colors.green,
                                 width: 3.0,
                               ),
                             ),
                           ),
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Enter the Last Name';
                              } else if (val.length < 3)
                                return 'The length of the name must be greater than 3';
                              else
                                return null;
                            },
                            onChanged: (val) {
                              setState(() => lastName = val);
                            },
                          ),

                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            keyboardType: TextInputType.emailAddress,
                          cursorWidth: 4,
                          cursorColor: Colors.green,
                          decoration: InputDecoration(
                            labelText: 'E-mail',
                            labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                            fillColor: Colors.white.withOpacity(0.6),
                            filled: true,
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(8.0),
                              ),
                              borderSide: new BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                            ),
                          ),
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

                            onChanged: (val) {
                              setState(() => email = val);
                            },
                          ),

                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            controller: _passwordController,
                          cursorWidth: 4,
                          cursorColor: Colors.green,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                            fillColor: Colors.white.withOpacity(0.6),
                            filled: true,
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(8.0),
                              ),
                              borderSide: new BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                            ),
                          ),
                            validator: (String value) => value.length < 6
                                ? 'Please enter atleast 6 characters'
                                : null,
                            obscureText: true,
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                          ),

                        SizedBox(
                          height: 10,
                        ),
                       TextFormField(
                            controller: _confirmPasswordController,
                         cursorWidth: 4,
                         cursorColor: Colors.green,
                         decoration: InputDecoration(
                           labelText: 'Confirm password',
                           labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                           fillColor: Colors.white.withOpacity(0.6),
                           filled: true,
                           border: new OutlineInputBorder(
                             borderRadius: const BorderRadius.all(
                               const Radius.circular(8.0),
                             ),
                             borderSide: new BorderSide(
                               color: Colors.transparent,
                               width: 1.0,
                             ),
                           ),
                         ),
                            validator: (val) {
                              if (val != _passwordController.value.text) {
                                return 'passwords don\'t match';
                              } else
                                return null;
                            },
                            obscureText: true,

                          ),
                      ],
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: EdgeInsets.only(left: 70,right: 70),
                width: 50,
                height: 40,
                color: Colors.green,
              child:
              ElevatedButton(
                  child: Text('FINISH'),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFF09C04F),
                      padding: EdgeInsets.only(left: 40,right: 40),
                      textStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
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
                              Navigator.pushNamed(context, WelcomeScreen.id);
                            }
                          } catch (e) {
                            print(e);
                          }
                        }
                      }),
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
                            color: Colors.grey[700], fontWeight: FontWeight.bold),
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
