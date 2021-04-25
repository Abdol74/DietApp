import 'package:cloud_firestore/cloud_firestore.dart';

class RolesModel {
  String _roleName;

  //getter //

  String get roleName => _roleName;

  RolesModel.fromSnapshot(DocumentSnapshot snapshot) {
    _roleName = snapshot.data['roleName'];
  }
}
