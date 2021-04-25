import 'package:cloud_firestore/cloud_firestore.dart';

class MealComponentsModel {
  int _caloriesNumber;
  int _carb;
  int _fats;
  int _protein;
  int _measure;
  String _imageUrl;
  String _mealCategoryId;
  String _mealDescription;
  String _mealName;

  int get caloriesNumber => _caloriesNumber;

  int get carb => _carb;

  int get fats => _fats;

  int get protien => _protein;

  int get measure => _measure;

  String get imageUrl => _imageUrl;

  String get mealCategoryId => _mealCategoryId;

  String get mealDescription => _mealDescription;

  String get mealName => _mealName;

  MealComponentsModel.fromSnapshot(DocumentSnapshot snapshot) {
    _caloriesNumber = snapshot.data['caloriesNumber'];
    _carb = snapshot.data['carb'];
    _fats = snapshot.data['fats'];
    _imageUrl = snapshot.data['image'];
    _mealCategoryId = snapshot.data['mealCategoryId'];
    _mealDescription = snapshot.data['mealDescription'];
    _mealName = snapshot.data['mealName'];
    _measure = snapshot.data['measure'];
    _protein = snapshot.data['protein'];
  }
}
