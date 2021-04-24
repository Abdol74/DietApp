import 'package:cloud_firestore/cloud_firestore.dart';

class UsersModel {
  String _roleId ;
  String _uId ;

  //getters//

 String get uId => _uId ;
 String get roleId => _roleId ;

 UsersModel.fromSnapshot(DocumentSnapshot snapshot) {
   _uId = snapshot.data['uId'];
   _roleId = snapshot.data['roleId'] ; 
 }
}
