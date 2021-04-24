import 'package:cloud_firestore/cloud_firestore.dart';

class WorkoutsModel {
  String _burnedCalories;
  String _videoLink;
  String _workoutName;
  int _minutesTime;

  //getters//

  String get burnedCalories => _burnedCalories;
  String get videoLink => _videoLink;
  String get workoutName => _workoutName;
  int get minutesTime => _minutesTime;

  WorkoutsModel.fromSnapShot(DocumentSnapshot snapshot) {
    _minutesTime = snapshot.data['minutesTime'];
    _workoutName = snapshot.data['workoutName'];
    _videoLink = snapshot.data['videoLink'];
    _burnedCalories = snapshot.data['burnedCalories'];
  }
}
