import 'package:cloud_firestore/cloud_firestore.dart';

class TipsModel {
  String _tipName;
  String _description;
  Timestamp _time;

  //getters//

  String get tipName => _tipName;
  String get description => _description;
  Timestamp get time => _time;

  TipsModel.fromSnapshot(DocumentSnapshot snapshot) {
    _tipName = snapshot.data['tipName'];
    _description = snapshot.data['description'];
    _time = snapshot.data['time'];
  }
}
