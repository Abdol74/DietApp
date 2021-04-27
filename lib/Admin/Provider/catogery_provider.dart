import 'package:flutter/cupertino.dart';
import 'package:daily_tracker_diet_app/Admin/models/meal_categories_model.dart';
import 'package:daily_tracker_diet_app/Admin/helpers/category.dart';

class CategoryProvider with ChangeNotifier {
  CategoryServices _categoryServices = CategoryServices();
  List<MealCategoriesModel> categories = [];

  Future<List<MealCategoriesModel>> loadCategories() async {
    categories = await _categoryServices.getCategories();
    return categories;
  }
}
