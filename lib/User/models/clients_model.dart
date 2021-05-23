import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ClientsModel {
  String clientId;
  String clientName;
  String goalId;
  String profilePicture;
  String activityLevelValue;
  String goalName;
  double age;
  double height;
  double weight;
  double caloriesRequired;

  ClientsModel();

  ClientsModel.fromMap(Map<String, dynamic> data) {
    clientName = data['clientName'];
    goalId = data['goalId'];
    profilePicture = data['profilePicture'];
    age = data['age'];
    height = data['height'];
    weight = data['weight'];
    caloriesRequired = data['caloriesRequired'];
    clientId = data['clientId'];
    activityLevelValue = data['activityLevelValue'];
    goalName = data['goalName'];
  }
  Map<String, dynamic> toMap() {
    return {
      'clientName': clientName,
      'age': age,
      'height': height,
      'weight': weight,
      'caloriesRequired': caloriesRequired,
      'clientId': clientId,
      'activityLevelValue': activityLevelValue,
      'goalName': goalName,
    };
  }

  ClientsModel.fromSnapshot(DocumentSnapshot snapshot) {
    clientName = snapshot.data['clientName'];
    goalId = snapshot.data['goalId'];
    profilePicture = snapshot.data['profilePicture'];
    age = snapshot.data['age'];
    height = snapshot.data['height'];
    weight = snapshot.data['weight'];
    caloriesRequired = snapshot.data['caloriesRequired'];
  }
}
