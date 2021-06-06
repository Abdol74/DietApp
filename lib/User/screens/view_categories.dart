import 'package:daily_tracker_diet_app/Admin/Provider/catogery_provider.dart';
import 'package:daily_tracker_diet_app/Admin/Provider/meal_provider.dart';
import 'package:daily_tracker_diet_app/Admin/helpers/meal_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'mealsbycategories.dart';

class MealCategories extends StatefulWidget {
  static const String id = 'mealCategories';
  final String mealType;
  MealCategories({this.mealType});
  @override
  _MealCategoriesState createState() => _MealCategoriesState();
}

class _MealCategoriesState extends State<MealCategories> {
  @override
  void initState() {
    // TODO: implement initState
    CategoryProvider categoryProvider =
        Provider.of<CategoryProvider>(context, listen: false);
    categoryProvider.loadCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CategoryProvider categoryProvider = Provider.of<CategoryProvider>(context);
    MealProvider mealProvider = Provider.of<MealProvider>(context);
    return Scaffold(
      body: Container(
        child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: categoryProvider.categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () async {
                  await mealProvider.loadMealsByCategory(
                      categoryId:
                          categoryProvider.categories[index].categoryId);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MealByCategories(
                      // mealProvider: mealProvider,
                      mealType: widget.mealType,
                    );
                  }));
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 150,
                  color: Colors.blueGrey,
                  child: Column(
                    children: [
                      Text(categoryProvider.categories[index].categoryName),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
