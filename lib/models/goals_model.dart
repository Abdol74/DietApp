import 'package:cloud_firestore/cloud_firestore.dart';

class GoalsModel {
  String _goalName;

  //getter//

  String get goalName => _goalName;

  GoalsModel.fromSnapshot(DocumentSnapshot snapshot) {
    _goalName = snapshot.data['goalName'];
  }
}
