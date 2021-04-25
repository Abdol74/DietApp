import 'package:cloud_firestore/cloud_firestore.dart';

class UserMealsModel {
  String _mealTypeId;
  String _uId;

  //getters//

  String get mealTypeId => _mealTypeId;
  String get uId => _uId;

  UserMealsModel.fromSnapshot(DocumentSnapshot snapshot) {
    _mealTypeId = snapshot.data['mealTypeId'];
    _uId = snapshot.data['uId'];
  }
}
