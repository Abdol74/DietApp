import 'package:daily_tracker_diet_app/Admin/Provider/meal_provider.dart';
import 'package:daily_tracker_diet_app/Admin/screens/add&&update_meal.dart';
import 'package:daily_tracker_diet_app/Admin/helpers/meal_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'dart:async';

class ProfileMeal extends StatefulWidget {
  static const String id = 'profileMeal';
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfileMeal> {
  @override
  void initState() {
    // TODO: implement initState
    // Do something
    MealProvider mealProvider =
        Provider.of<MealProvider>(context, listen: false);
    getMeals(mealProvider);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MealProvider mealProvider = Provider.of<MealProvider>(context);

    Future<void> _refreshList() async {
      getMeals(mealProvider);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.green),
        title: Text(
          "Home",
          style: TextStyle(
              color: Color(0xFF09C04F),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Container(
        width: 250,
        height: 800,
        child: Drawer(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                color: Colors.grey[200],
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.only(top: 30),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/images/logo.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ListTile(
                leading: Icon(
                  Icons.account_box,
                  size: 30,
                  color: Color(0xFF09C04F),
                ),
                title: Text(
                  "View Users",
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.add,
                  size: 30,
                  color: Color(0xFF09C04F),
                ),
                title: GestureDetector(
                  onTap: () {
                    mealProvider.currentMeal = null;
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context) {
                        return UpdateMeal(
                          isUpdating: false,
                        );
                      }),
                    );
                  },
                  child: Text(
                    "Add Meal",
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFF09C04F),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Logout",
                    style: TextStyle(
                        color: Colors.grey[100],
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: LiquidPullToRefresh(
        child: new Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/am1.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: ListView.builder(
            itemCount: mealProvider.meals.length,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 50,
                        height: 80,
                        child: (mealProvider.meals[index].imageUrl == null)
                            ? Image.asset('assets/images/person.png')
                            : Image.network(
                                mealProvider.meals[index].imageUrl,
                                fit: BoxFit.fill,
                              ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      ButtonTheme(
                          minWidth: 50.0,
                          height: 50.0,
                          child: RaisedButton(
                            child: Icon(Icons.update),
                            onPressed: () {
                              mealProvider.currentMeal =
                                  mealProvider.meals[index];
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return UpdateMeal(
                                    isUpdating: true,
                                  );
                                }),
                              );
                            },
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Text(
                            (mealProvider.meals[index].mealName == null)
                                ? 'mealName'
                                : mealProvider.meals[index].mealName,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "1 person per plate",
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 40, left: 12),
                          child: Text(
                            mealProvider.meals[index].caloriesNumber.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 250,
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: new BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.grey,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 26, left: 5),
                          child: Text(
                            mealProvider.meals[index].protein.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: new BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.grey,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 25, left: 08),
                          child: Text(
                            mealProvider.meals[index].carb.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: new BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.grey,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 25, left: 08),
                          child: Text(
                            mealProvider.meals[index].fats.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },

            // Container(
            //   height: 50,
            //   width: 50,
            //   padding: EdgeInsets.all(10),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(32),
            //     color: Colors.teal.shade50,
            //     boxShadow: kElevationToShadow[6],
            //   ),
            //   child: TextField(
            //     cursorColor: Color(0xFF09C04F),
            //     decoration: InputDecoration(
            //       contentPadding: EdgeInsets.only(bottom: 13, left: 20),
            //       hintText: "search Meal",
            //       hintStyle: TextStyle(
            //         color: Colors.grey[400],
            //         fontSize: 20,
            //       ),
            //       border: InputBorder.none,
            //       icon: Icon(
            //         Icons.search,
            //         color: Colors.grey[400],
            //         size: 30,
            //       ),
            //     ),
            //   ),
            // ),

            //////////////////////////////////////////////////////////////////////////////////////////////////////////

            // Padding(
            //   padding: EdgeInsets.symmetric(vertical: 5.0),
            //   child: SizedBox(
            //     width: 10,
            //     child: Divider(
            //       color: Colors.black12,
            //       thickness: 5.0,
            //     ),
            //   ),
            // ),
          ),
        ),
        onRefresh: _refreshList,
        showChildOpacityTransition: true,
        color: Color(0xFF09C04F),
      ),
    );
  }
}
