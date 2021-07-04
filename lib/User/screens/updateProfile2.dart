import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_tracker_diet_app/User/screens/update_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";

class updateProfile2 extends StatefulWidget {
  static String id = "updateProfile2";
  @override
  _updateProfile2State createState() => _updateProfile2State();
}

class _updateProfile2State extends State<updateProfile2> {
  String firstName = " ";

  String newEmail = " ";
  String lastName = " ";
  final FirebaseAuth auth = FirebaseAuth.instance;
  getUserData() async {
    try {
      final FirebaseUser user = await auth.currentUser();
      final uid = user.uid;
      await Firestore.instance
          .collection("Users")
          .where("id", isEqualTo: uid)
          .getDocuments()
          .then((cal) {
        setState(() {
          firstName = cal.documents[0].data["FirstName"];
          newEmail = cal.documents[0].data['Email'];
          lastName = cal.documents[0].data['LastName'];

          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return update_profile(
                firstName.toString(), newEmail.toString(), lastName.toString());
          }));
          print(cal.documents[0].data['id']);
        });

        print("success update2");
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return update_profile(
        firstName.toString(), newEmail.toString(), lastName.toString());
  }
}
