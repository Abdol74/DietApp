import 'package:cloud_firestore/cloud_firestore.dart';

class UsersModel {
  String roleId;
  String uId;
  String email;
  String firstName;
  String lastName;

  UsersModel();

  UsersModel.fromMap(Map<String, dynamic> data) {
    roleId = data['roleId'];
    uId = data['id'];
    email = data['Email'];
    firstName = data['FirstName'];
    lastName = data['LastName'];
  }

  UsersModel.fromSnapshot(DocumentSnapshot snapshot) {
    uId = snapshot.data['uId'];
    roleId = snapshot.data['roleId'];
  }
}
