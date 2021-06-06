import 'package:cloud_firestore/cloud_firestore.dart';

class MealCategoriesModel {
  String _categoryName;
  String _categoryId;

  //getter//

  String get categoryName => _categoryName;
  String get categoryId => _categoryId;

  MealCategoriesModel.fromSnapshot(DocumentSnapshot snapshot) {
    _categoryName = snapshot.data['categoryName'];
    _categoryId = snapshot.data['id'];
  }
}
