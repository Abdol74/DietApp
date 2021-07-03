import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_tracker_diet_app/User/screens/step1.dart';

class UserMealComponentsModel {
  String mealComponentId;
  String mealTypeId;
  String mealTypeName;
  String mealComponentName;
  String userId;
  int mealComponentCounts;
  int mealCalories;

  UserMealComponentsModel();

  //getters//
  UserMealComponentsModel.fromMap(Map<String, dynamic> data) {
    mealComponentId = data['mealComponentId'];
    mealTypeId = data['mealTypeId'];
    mealComponentCounts = data['mealComponentCounts'];
    mealComponentName = data['mealComponentName'];
    userId = data['userId'];
    mealCalories = data['mealCalories'];
    mealTypeName = data['typeName'];
  }
  Map<String, dynamic> toMap() {
    return {
      // 'id': id,
      'mealComponentId': mealComponentId,
      'typeName': mealTypeName,
      'mealTypeId': mealTypeId,
      'mealComponentsCounts': mealComponentCounts,
      'mealComponentName': mealComponentName,
      'userId': userId,
      'mealCalories': mealCalories,
    };
  }

  UserMealComponentsModel.fromSnapshot(DocumentSnapshot snapshot) {
    mealComponentId = snapshot.data['mealComponentId'];
    mealTypeName = snapshot.data['mealTypeName'];
    mealTypeId = snapshot.data['mealTypeId'];
    mealComponentCounts = snapshot.data['mealComponentsCounts'];
    mealComponentName = snapshot.data['mealComponentName'];
    userId = snapshot.data['userId'];
    mealCalories = snapshot.data['mealCalories'];
  }
}
