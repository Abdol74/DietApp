import 'package:daily_tracker_diet_app/User/screens/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class update_profile extends StatefulWidget {
  static String id = 'updateUserProfile';
  String firstName;
  String newEmail;
  String lastName;
  update_profile(this.firstName, this.newEmail, this.lastName);
  @override
  _update_profileState createState() => _update_profileState();
}

class _update_profileState extends State<update_profile> {
  final _auth = FirebaseAuth.instance;
  final fireStore = Firestore.instance;
  String firstName = " ";
  String lastName = " ";
  String newPassword = " ";
  String newEmail = " ";
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Pattern pattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  FirebaseUser loggedUser;
  @override
  void initState() {
    super.initState();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: new Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/step1 background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: new ListView(
          children: <Widget>[
            new Container(
              height: 50,
              width: 20,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[400],
                      blurRadius: 20,
                    )
                  ]),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.only(left: 20, top: 50)),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.popAndPushNamed(context, home_page.id);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Color(0xFF09C04F),
                              size: 30.0,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.settings,
                            color: Color(0xFF09C04F),
                            size: 30.0,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Update Profile",
                            style: TextStyle(
                                color: Color(0xFF09C04F),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 70,
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 100,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/update.png'),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 6.0),
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Flexible(
                      child: new TextFormField(
                        cursorWidth: 4,
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
                          labelText: 'First Name',
                          labelStyle:
                              TextStyle(color: Colors.green, fontSize: 15),
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
                        initialValue: widget.firstName.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
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
                          setState(() => firstName =
                              val == null ? widget.firstName.toString() : val);
                        },
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 5),
            Padding(
                padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 6.0),
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Flexible(
                      child: new TextFormField(
                        cursorWidth: 4,
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                          labelStyle:
                              TextStyle(color: Colors.green, fontSize: 15),
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
                        initialValue: widget.lastName.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
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
                          setState(() => lastName =
                              val == null ? widget.lastName.toString() : val);
                        },
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 5,
            ),
            Padding(
                padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 6.0),
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Flexible(
                      child: new TextFormField(
                        cursorWidth: 4,
                        cursorColor: Colors.green,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'New E-mail',
                          labelStyle:
                              TextStyle(color: Colors.green, fontSize: 15),
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
                        initialValue: widget.newEmail.toString(),
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
                          setState(() => newEmail =
                              val == null ? widget.newEmail.toString() : val);
                        },
                      ),
                    ),
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 6.0),
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Flexible(
                      child: new TextFormField(
                          controller: _passwordController,
                          cursorWidth: 4,
                          cursorColor: Colors.green,
                          decoration: InputDecoration(
                            labelText: 'New password',
                            labelStyle:
                                TextStyle(color: Colors.green, fontSize: 15),
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
                            setState(() => newPassword = val);
                          }),
                    ),
                  ],
                )),
            SizedBox(
              height: 5,
            ),
            Padding(
                padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 6.0),
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Flexible(
                      child: new TextFormField(
                        cursorWidth: 4,
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
                          labelText: 'confirm password',
                          labelStyle:
                              TextStyle(color: Colors.green, fontSize: 15),
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
                        controller: _confirmPasswordController,
                        validator: (val) {
                          if (val != _passwordController.value.text) {
                            return 'passwords don\'t match';
                          } else
                            return null;
                        },
                        obscureText: true,
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 70),
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFF09C04F),
                      padding: EdgeInsets.only(left: 40, right: 40),
                      textStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  child: Text(
                    "Update Profile",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                  onPressed: () async {
                    String getDocumentID;
                    final FirebaseUser user =
                        await FirebaseAuth.instance.currentUser();

                    await Firestore.instance
                        .collection("Users")
                        .where("id", isEqualTo: user.uid.toString())
                        .getDocuments()
                        .then((cal) {
                      getDocumentID = cal.documents[0].documentID;
                      Firestore.instance
                          .collection("Users")
                          .document(getDocumentID)
                          .updateData({
                        "FirstName": firstName,
                        "Email": newEmail,
                        'LastName': lastName
                      }).then((_) {});
                      print("Successs !!!");
                    });
                    user.updateEmail(newEmail);
                    user.updatePassword(newPassword);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
