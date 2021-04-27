import 'package:cloud_firestore/cloud_firestore.dart';

class MealComponentsModel {
  int caloriesNumber;
  int carb;
  int fats;
  int protein;
  int measure;
  String imageUrl;
  String mealCategoryId;
  String mealDescription;
  String mealName;
  String id;
  MealComponentsModel();

  MealComponentsModel.fromMap(Map<String, dynamic> data) {
    caloriesNumber = data['caloriesNumber'];
    carb = data['carb'];
    fats = data['fats'];
    imageUrl = data['image'];
    mealCategoryId = data['mealCategoryId'];
    mealDescription = data['mealDescription'];
    mealName = data['mealName'];
    measure = data['measure'];
    protein = data['protein'];
    id = data['id'];
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'mealName': mealName,
      'image': imageUrl,
      'caloriesNumber': caloriesNumber,
      'carb': carb,
      'fats': fats,
      'protein': protein,
      'mealCategoryId': mealCategoryId,
      'mealDescription': mealDescription,
      'measure': measure,
    };
  }

  MealComponentsModel.fromSnapshot(DocumentSnapshot snapshot) {
    caloriesNumber = snapshot.data['caloriesNumber'];
    carb = snapshot.data['carb'];
    fats = snapshot.data['fats'];
    imageUrl = snapshot.data['image'];
    mealCategoryId = snapshot.data['mealCategoryId'];
    mealDescription = snapshot.data['mealDescription'];
    mealName = snapshot.data['mealName'];
    measure = snapshot.data['measure'];
    protein = snapshot.data['protein'];
  }
}
