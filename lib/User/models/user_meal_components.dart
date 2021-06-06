import 'package:cloud_firestore/cloud_firestore.dart';

class UserMealComponentsModel {
  String mealComponentId;
  String mealTypeId;
  String mealName;
  String userId;
  int mealComponentCounts;

  UserMealComponentsModel();

  //getters//
  UserMealComponentsModel.fromMap(Map<String, dynamic> data) {
    mealComponentId = data['mealComponentId'];
    mealTypeId = data['mealTypeId'];
    mealComponentCounts = data['mealComponentCounts'];
    mealName = data['mealName'];
    userId = data['userId'];
  }
  Map<String, dynamic> toMap() {
    return {
      // 'id': id,
      'mealComponentId': mealComponentId,
      'mealTypeId': mealTypeId,
      'mealComponentsCounts': mealComponentCounts,
      'mealName': mealName,
      'userId': userId,
    };
  }

  UserMealComponentsModel.fromSnapshot(DocumentSnapshot snapshot) {
    mealComponentId = snapshot.data['mealComponentId'];
    mealTypeId = snapshot.data['mealTypeId'];
    mealComponentCounts = snapshot.data['mealComponentsCounts'];
    mealName = snapshot.data['mealName'];
    userId = snapshot.data['userId'];
  }
}
