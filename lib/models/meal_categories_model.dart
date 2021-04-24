import 'package:cloud_firestore/cloud_firestore.dart';

class MealCategoriesModel {
  String _categoryName;

  //getter//

  String get categoryName => _categoryName;

  MealCategoriesModel.fromSnapshot(DocumentSnapshot snapshot) {
    _categoryName = snapshot.data['categoryName'];
  }
}
