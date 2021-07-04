import 'package:daily_tracker_diet_app/Admin/Provider/catogery_provider.dart';
import 'package:daily_tracker_diet_app/Admin/Provider/meal_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'mealsbycategories.dart';

class MealCategories extends StatefulWidget {
  static const String id = 'mealCategories';
  final String mealType;
  final String mealTypeName;
  MealCategories({this.mealType, this.mealTypeName});
  @override
  _MealCategoriesState createState() => _MealCategoriesState();
}

class _MealCategoriesState extends State<MealCategories> {
  List<String> values = [
    'assets/images/c9.png',
    'assets/images/c2.png',
    'assets/images/c6.png',
    'assets/images/c4.png',
    'assets/images/c5.png',
    'assets/images/c1.png',
    'assets/images/c3.png',
    'assets/images/c10.png',
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CategoryProvider categoryProvider =
        Provider.of<CategoryProvider>(context, listen: false);
    categoryProvider.loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    CategoryProvider categoryProvider = Provider.of<CategoryProvider>(context);
    MealProvider mealProvider = Provider.of<MealProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF61D27C),
        toolbarHeight: 200,
        title: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10, right: 20, top: 0, bottom: 3),
              child: Text('Categories',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 27,
                      fontWeight: FontWeight.bold)),
            ),
            Container(
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Column(
                    children: <Widget>[
                      Text(
                        "Nutrition",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 27,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Eat more fruits & vegtables",
                        style: TextStyle(
                            color: Color(0xFF09C04F),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Eat smaller portions",
                        style: TextStyle(
                            color: Color(0xFF09C04F),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Image(
                    image: AssetImage("assets/images/c8.png"),
                    width: 90,
                    height: 110,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
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
                      mealTypeName: widget.mealTypeName,
                    );
                  }));
                },
                child: Container(
                  margin:
                      EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
                  height: 120,
                  width: 150,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Color(0xFF61D27C),
                    boxShadow: kElevationToShadow[6],
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Image.asset(values[index]),
                        //heightFactor: -5,
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
