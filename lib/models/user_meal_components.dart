import 'package:cloud_firestore/cloud_firestore.dart';

class UserMealComponentsModel {
  String _mealComponentId;
  String _userMealId;
  int _mealComponentCounts;

  //getters//

  String get mealComponentId => _mealComponentId;
  String get userMealId => _userMealId;
  int get mealComponentCounts => _mealComponentCounts;

  UserMealComponentsModel.fromSnapshot(DocumentSnapshot snapshot) {
    _mealComponentId = snapshot.data['mealComponentId'];
    _userMealId = snapshot.data['userMealId'];
    _mealComponentCounts = snapshot.data['mealComponentsCounts'];
  }
}
