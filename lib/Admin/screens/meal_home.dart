import 'package:daily_tracker_diet_app/Admin/Provider/meal_provider.dart';
import 'package:daily_tracker_diet_app/Admin/models/meal_components_model.dart';
import 'package:daily_tracker_diet_app/Admin/screens/Approve_meal.dart';
import 'package:daily_tracker_diet_app/Admin/screens/add&&update_meal.dart';
import 'package:daily_tracker_diet_app/Admin/helpers/meal_api.dart';
import 'package:daily_tracker_diet_app/Admin/screens/view_user.dart';
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

    updateDeleteMeal(MealComponentsModel meal) {
      mealProvider.deleteMealFromList(meal);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.green),
        title: Text(
          "My food",
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
                title: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, view_user.id);
                  },
                  child: Text(
                    "View Users",
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.account_box,
                  size: 30,
                  color: Color(0xFF09C04F),
                ),
                title: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ApproveMeal.id);
                  },
                  child: Text(
                    "Approve Meal",
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
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
              image: AssetImage('assets/images/back1.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: ListView.builder(
            itemCount: mealProvider.meals.length,
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
                          Container(
                            width: 180,
                            height: 130,
                            child: (mealProvider.meals[index].imageUrl == null)
                                ? Image.asset('assets/images/noopic.png')
                                : Image.network(
                                    mealProvider.meals[index].imageUrl,
                                    fit: BoxFit.cover,
                                  ),
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
                                  (mealProvider.meals[index].mealName == null)
                                      ? 'mealName'
                                      : mealProvider.meals[index].mealName,
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
                                          child: TextButton(
                                            child: Text('Gradients'),
                                            style: TextButton.styleFrom(
                                              primary: Colors.white,
                                            ),
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      content: Column(
                                                        children: [
                                                          Container(
                                                            width: 200,
                                                            height: 200,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 30),
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              image:
                                                                  DecorationImage(
                                                                image: AssetImage(
                                                                    "assets/images/logo.png"),
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "FATS ",
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xFF09C04F),
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Text(
                                                                mealProvider
                                                                    .meals[
                                                                        index]
                                                                    .fats
                                                                    .toString(),
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "Protein ",
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xFF09C04F),
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Text(
                                                                mealProvider
                                                                    .meals[
                                                                        index]
                                                                    .protein
                                                                    .toString(),
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "Carb ",
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xFF09C04F),
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Text(
                                                                mealProvider
                                                                    .meals[
                                                                        index]
                                                                    .carb
                                                                    .toString(),
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "Calories ",
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xFF09C04F),
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Text(
                                                                mealProvider
                                                                    .meals[
                                                                        index]
                                                                    .caloriesNumber
                                                                    .toString(),
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 40,
                                                          ),
                                                          Row(
                                                            children: [
                                                              SizedBox(
                                                                width: 60,
                                                              ),
                                                              Container(
                                                                width: 40,
                                                                height: 50,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: Color(
                                                                      0xFF09C04F),
                                                                ),
                                                                child:
                                                                    TextButton(
                                                                  child: Icon(
                                                                    Icons.edit,
                                                                    size: 25,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    mealProvider
                                                                        .currentMeal = mealProvider
                                                                            .meals[
                                                                        index];
                                                                    Navigator.of(
                                                                            context)
                                                                        .push(
                                                                      MaterialPageRoute(builder:
                                                                          (BuildContext
                                                                              context) {
                                                                        return UpdateMeal(
                                                                          isUpdating:
                                                                              true,
                                                                        );
                                                                      }),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 40,
                                                              ),
                                                              Container(
                                                                width: 40,
                                                                height: 50,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: Colors
                                                                      .green,
                                                                ),
                                                                child:
                                                                    TextButton(
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .delete,
                                                                          size:
                                                                              25,
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          deleteMeal(
                                                                              mealProvider.meals[index],
                                                                              updateDeleteMeal);
                                                                        }),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      actions: <Widget>[
                                                        FlatButton(
                                                          onPressed: () {},
                                                          child: Text("Okay"),
                                                          textColor:
                                                              Colors.green,
                                                        ),
                                                      ],
                                                    );
                                                  });
                                            },
                                          )),
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
