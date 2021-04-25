import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class UserWorkoutsModel {
  String _workoutId;
  String _uId;
  String _totalBurnedCalories;
  int _time;

  //getters//

  String get workoutId => _workoutId;
  String get uId => _uId;
  String get totalBurnedCalories => _totalBurnedCalories;
  int get time => _time;

  UserWorkoutsModel.fromSnapshot(DocumentSnapshot snapshot) {
    _workoutId = snapshot.data['workoutId'];
    _uId = snapshot.data['uId'];
    _totalBurnedCalories = snapshot.data['totalBurnedCalories'];
    _time = snapshot.data['time'];
  }
}
