import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_tracker_diet_app/Admin/models/meal_components_model.dart';
import 'package:daily_tracker_diet_app/Admin/screens/Approve_meal.dart';
import 'package:daily_tracker_diet_app/User/models/user_meal_components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class MealServices {
  Future<List<MealComponentsModel>> getMealsOfCategory(
          {String category}) async =>
      Firestore.instance
          .collection('MealComponents')
          .where("mealCategoryId", isEqualTo: category)
          .getDocuments()
          .then((result) {
        List<MealComponentsModel> meals = [];
        for (DocumentSnapshot meal in result.documents) {
          meals.add(MealComponentsModel.fromSnapshot(meal));
        }
        return meals;
      });
}
