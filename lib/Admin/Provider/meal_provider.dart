import 'dart:collection';
import 'package:daily_tracker_diet_app/Admin/helpers/meal_api.dart';
import 'package:daily_tracker_diet_app/Admin/models/meal_components_model.dart';
import 'package:daily_tracker_diet_app/Admin/models/meal_types_model.dart';
import 'package:daily_tracker_diet_app/User/helpers/meal_services.dart';
import 'package:daily_tracker_diet_app/User/models/user_meal_components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealProvider with ChangeNotifier {
  List<MealComponentsModel> _meals = [];
  List<MealComponentsModel> mealsByCategory = [];
  List<UserMealComponentsModel> mealsByUserAndType = [];
  MealComponentsModel _currentMeal;
  MealComponentsModel _currentMealToAddToUser;

  UnmodifiableListView<MealComponentsModel> get meals =>
      UnmodifiableListView(_meals);

  MealComponentsModel get currentMeal => _currentMeal;
  MealComponentsModel get currentMealToAddToUser => _currentMealToAddToUser;

  set mealList(List<MealComponentsModel> mealList) {
    _meals = mealList;
    notifyListeners();
  }

  set currentMeal(MealComponentsModel currentMeal) {
    _currentMeal = currentMeal;
    notifyListeners();
  }

  set currentMealToAddToUser(MealComponentsModel currentMeal) {
    _currentMealToAddToUser = currentMeal;
    notifyListeners();
  }

  addMeal(MealComponentsModel meal) {
    _meals.insert(0, meal);
    notifyListeners();
  }

  deleteMealFromList(MealComponentsModel meal) {
    _meals.removeWhere((_meal) => _meal.id == meal.id);
    notifyListeners();
  }

  Future loadMealsByCategory({String categoryId}) async {
    mealsByCategory =
        await MealServices().getMealsOfCategory(category: categoryId);
    notifyListeners();
  }

  Future loadMealsByUserAndType({String mealTypeId, String userId}) async {
    mealsByUserAndType = await MealServices()
        .getMealOfCurrentUser(mealTypeId: mealTypeId, userId: userId);
    notifyListeners();
  }
}
