import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firestore = Firestore.instance;
final workouts = _firestore.collection('UserWorkouts').getDocuments();

class WorkoutColumn extends StatelessWidget {
  const WorkoutColumn(this.colName, this.fontSize, this.workoutVal);

  final double fontSize;
  final String colName;
  final String workoutVal;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '$colName',
          style: TextStyle(
              color: Color(0xFF09B44D),
              fontWeight: FontWeight.bold,
              fontSize: fontSize),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          '$workoutVal',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12.0),
        ),
      ],
    );
  }
}
