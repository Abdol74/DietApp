import 'package:daily_tracker_diet_app/Admin/Provider/meal_provider.dart';
import 'package:daily_tracker_diet_app/Admin/models/meal_components_model.dart';
import 'package:daily_tracker_diet_app/Admin/screens/add&&update_meal.dart';
import 'package:daily_tracker_diet_app/Admin/helpers/meal_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'dart:async';

class MealsByUserAndType extends StatefulWidget {
  static const String id = 'mealsUser';
  final String mealType;
  final String uid;

  MealsByUserAndType({this.uid, this.mealType});
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<MealsByUserAndType> {
  @override
  void initState() {
    // TODO: implement initState
    // Do something
    MealProvider mealProvider =
        Provider.of<MealProvider>(context, listen: false);
    mealProvider.loadMealsByUserAndType(
        mealTypeId: widget.mealType, userId: widget.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MealProvider mealProvider = Provider.of<MealProvider>(context);

    Future<void> _refreshList() async {}

    return Scaffold(
      backgroundColor: Colors.white,
      body: new Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back1.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView.builder(
          itemCount: mealProvider.mealsByUserAndType.length,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                SizedBox(height: 10),
                Column(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[600],
                                  blurRadius: 40,
                                )
                              ]),
                          child: Padding(
                            padding: EdgeInsets.only(left: 12, top: 8),
                            child: Text(
                              "Meal Name",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Roboto'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            (mealProvider.mealsByUserAndType[index]
                                        .mealComponentName ==
                                    null)
                                ? 'mealName'
                                : mealProvider.mealsByUserAndType[index]
                                    .mealComponentName,
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[600],
                                  blurRadius: 40,
                                )
                              ]),
                          child: Padding(
                            padding: EdgeInsets.only(left: 16, top: 8),
                            child: Text(
                              "Meal Type",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Roboto'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            (mealProvider.mealsByUserAndType[index]
                                        .mealTypeName ==
                                    null)
                                ? 'mealName'
                                : mealProvider
                                    .mealsByUserAndType[index].mealTypeName,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: SizedBox(
                    width: 400,
                    child: Divider(
                      color: Colors.grey[300],
                      thickness: 3.0,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
