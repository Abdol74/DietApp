import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class update_profile extends StatefulWidget {
  static String id = 'updateUserProfile';

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
        child: new ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
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
                          Icon(
                            Icons.arrow_back,
                            color: Color(0xFF09C04F),
                            size: 30.0,
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
                          Icon(
                            Icons.notifications,
                            color: Color(0xFF09C04F),
                            size: 30.0,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.search,
                            color: Color(0xFF09C04F),
                            size: 30.0,
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: new Stack(
                fit: StackFit.loose,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        width: 140.0,
                        height: 140.0,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            image: AssetImage("assets/person.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 100, right: 120),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 25.0,
                          child: new Icon(
                            Icons.camera_alt,
                            color: Color(0xFF09C04F),
                            size: 30,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //kda klsna el md5lat
            SizedBox(
              height: 20,
            ),
            Padding(
                padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 6.0),
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Flexible(
                      child: new TextFormField(
                        textAlign: TextAlign.center,
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'Enter the First Name';
                          } else if (val.length < 3)
                            return 'The length of the name must be greater than 3';
                          else
                            return null;
                        },
                        decoration: const InputDecoration(
                          hintText: "New Name",
                        ),
                        onChanged: (val) {
                          setState(() => firstName = val);
                        },
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            Padding(
                padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 6.0),
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Flexible(
                      child: new TextFormField(
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
                        decoration: const InputDecoration(
                          hintText: "New Email",
                        ),
                        onChanged: (val) {
                          setState(() => newEmail = val);
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
                        textAlign: TextAlign.center,
                        validator: (String value) => value.length < 6
                            ? 'Please enter atleast 6 characters'
                            : null,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "New Password",
                        ),
                        onChanged: (val) {
                          setState(() => newPassword = val);
                        },
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            Padding(
                padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 6.0),
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Flexible(
                      child: new TextFormField(
                        textAlign: TextAlign.center,
                        controller: _confirmPasswordController,
                        validator: (val) {
                          if (val != _passwordController.value.text) {
                            return 'passwords don\'t match';
                          } else
                            return null;
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Confirm Password",
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 100,
            ),

            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 70),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xFF09C04F),
              ),
              child: Center(
                child: RaisedButton(
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
                      }).then((_) {});
                      print("Successs !!!");
                    });
                    user.updateEmail(newEmail);
                    user.updatePassword(newPassword);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Color(0xFF09B44D),
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white.withOpacity(.60),
                selectedFontSize: 14,
                unselectedFontSize: 14,
                onTap: (value) {
                  // Respond to item press.
                },
                items: [
                  BottomNavigationBarItem(
                    title: Text('Favorites'),
                    icon: Icon(Icons.favorite),
                  ),
                  BottomNavigationBarItem(
                    title: Text('Home'),
                    icon: Icon(Icons.home),
                  ),
                  BottomNavigationBarItem(
                    title: Text('Places'),
                    icon: Icon(Icons.location_on),
                  ),
                  BottomNavigationBarItem(
                    title: Text('News'),
                    icon: Icon(Icons.library_books),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
