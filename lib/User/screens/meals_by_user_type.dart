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
      body: LiquidPullToRefresh(
        child: new Container(
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
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 0,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 10,
                          ),

                          Column(
                            children: [
                              Text(
                                "Meal Name",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto'),
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
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Text(
                                "Meal Type",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  (mealProvider.mealsByUserAndType[index]
                                              .mealTypeName ==
                                          null)
                                      ? 'mealName'
                                      : mealProvider.mealsByUserAndType[index]
                                          .mealTypeName,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              //////////////////////////
                              Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        width: 100,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Color(0xFF09C04F),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey[400],
                                                blurRadius: 5,
                                              )
                                            ]),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          ////
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
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
        onRefresh: _refreshList,
        showChildOpacityTransition: true,
        color: Color(0xFF09C04F),
      ),
    );
  }
}
