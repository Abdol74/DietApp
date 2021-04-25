import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationsModel {
  String _tipId;

  //getter//

  String get tipId => _tipId;

  NotificationsModel.fromSnapshot(DocumentSnapshot snapshot) {
    _tipId = snapshot.data['tipId'];
  }
}
