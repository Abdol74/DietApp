import 'dart:collection';
import 'package:daily_tracker_diet_app/Admin/models/meal_components_model.dart';
import 'package:flutter/cupertino.dart';

class MealProvider with ChangeNotifier {
  List<MealComponentsModel> _meals = [];
  MealComponentsModel _currentMeal;

  UnmodifiableListView<MealComponentsModel> get meals =>
      UnmodifiableListView(_meals);

  MealComponentsModel get currentMeal => _currentMeal;

  set mealList(List<MealComponentsModel> mealList) {
    _meals = mealList;
    notifyListeners();
  }

  set currentMeal(MealComponentsModel currentMeal) {
    _currentMeal = currentMeal;
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
}
