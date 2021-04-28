//import 'package:dailytracker/register.dart';
//import 'package:dailytracker/welcome_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:daily_tracker_diet_app/Admin/screens/admin_home.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => new _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen>{
  String _email, _password;
  final GlobalKey <FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          // TODO: Implement key
          child: Column(
            children: <Widget>[
              // TODO: Implement fields
              Container(
                margin: EdgeInsets.only(
                  top: 50.0,
                  bottom: 10.0,
                  left: 300.0,
                ),
                child: Image(
                    image: AssetImage('assets/images/logosmall.png')),
              ),
              Container(
                margin: EdgeInsets.only(top: 70),
                child: Center(
                  child: Text(
                    "Welcome",
                    style: TextStyle(
                        fontFamily: 'Roboto',
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
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(top: 20.0),
                            alignment: Alignment.center,
                            child: Container(
                              width: 335.0,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                      width: 1, color: Color(0xFFDBD9D9), style: BorderStyle.solid)),
                              child: TextFormField(
                                validator: (input){
                                  if (input.isEmpty){
                                    return 'Please enter your email';
                                  }
                                },
                                onSaved: (input) => _email = input ,
                                minLines: 1, maxLines: 1,
                                decoration: InputDecoration(
                                    hintText: 'Email',
                                    contentPadding: EdgeInsets.all(15),
                                    border: InputBorder.none),

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10.0),
                      alignment: Alignment.center,
                      child: Container(
                        width: 335.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                                width: 1, color: Color(0xFFDBD9D9), style: BorderStyle.solid)),
                        child: TextFormField(
                          minLines: 1, maxLines: 1,
                          decoration: InputDecoration(
                              hintText: 'Password',
                              contentPadding: EdgeInsets.all(15),
                              border: InputBorder.none),
                          obscureText: true,
                          validator: (input){
                            if (input.length < 6 &&  input.isNotEmpty){
                              return 'Password needs to be at  least 6 Characters';
                            }
                            else if (input.isEmpty){
                              return 'Please enter your password';
                            }
                          },
                          onSaved: (input) => _password = input ,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Forget your password?",
                      style: TextStyle(
                        fontFamily: 'RobotoL',
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5, bottom: 5),
                    ),
                    SizedBox(
                      width: 300.0,
                      height: 50.0,
                      child: RaisedButton(
                        color: Color(0xFF09B44D),
                        child: Text("Sign in", style: TextStyle(fontFamily: 'Roboto', fontSize: 18, color: const Color(0xffffffff),),),
                        onPressed: signIn,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an account? ",
                          style: TextStyle(fontFamily: 'Roboto', color: Colors.grey[600]),),
                        GestureDetector(
                          onTap: (){
                            //Navigator.pushNamed(context, Register.id);
                          },

                          child: Text("Sign up",
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top:20, left: 110),
                          child: Image(
                            height: 60,
                            width: 40,
                            image: AssetImage('assets/images/icons/googleicon.png'),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20, left: 50, right: 100),
                          child: Image(
                            height: 60,
                            width: 40,
                            image: AssetImage('assets/images/icons/facebookicon.png'),
                          ),
                        )
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






  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser user = await
        FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _email, password: _password);
        if (_formKey.currentState.validate()) {
          var firebaseUser = await FirebaseAuth.instance.currentUser();
          FirebaseAuth.instance.signInWithEmailAndPassword(
              email: _email, password: _password);
          if (firebaseUser.uid == "RFDhlmQ4h6WxKh2zCWzKXy31ZVr2") {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Profile()));
          }
        }
        // El else bta3et el user di msh sh8alaa
        else { // sends to account page
          var firebaseUser = await FirebaseAuth.instance.currentUser();
          final snapShot = await Firestore.instance.collection("Clients")
              .document(firebaseUser.uid)
              .get();

          if (snapShot.exists) { // if user has a collection, go to user screens
            //TODO add user home screen
             //Navigator.push(context, MaterialPageRoute(builder: (context) => UserHome()));
          }
        }
      }
      catch (e) {
        print(e.message);
      }
    }
  }






    }

