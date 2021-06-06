import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:daily_tracker_diet_app/Admin/models/meal_categories_model.dart';

class CategoryServices extends ChangeNotifier {
  String collection = "MealCategories";
  Firestore _firestore = Firestore.instance;
  List<MealCategoriesModel> categories = [];

  Future<List<MealCategoriesModel>> getCategories() async =>
      _firestore.collection(collection).getDocuments().then((result) {
        List<MealCategoriesModel> categories = [];
        for (DocumentSnapshot category in result.documents) {
          categories.add(MealCategoriesModel.fromSnapshot(category));
        }
        return categories;
      });

  int get categoriesCount {
    return categories.length;
  }
}
