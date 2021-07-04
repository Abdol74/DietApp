import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_tracker_diet_app/Admin/Provider/catogery_provider.dart';

import 'package:daily_tracker_diet_app/User/screens/view_categories.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:daily_tracker_diet_app/constants.dart';
import 'package:daily_tracker_diet_app/User/widgets/meal_content.dart';

class MealPage extends StatefulWidget {
  static const String id = 'meal_page';

  @override
  _MealPageState createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  List<String> values = [
    'assets/images/breakfas.png',
    'assets/images/lunch.png',
    'assets/images/dinner.png'
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Meals of the day',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
        ),
      ),
      body: Center(
        child: Container(
          height: 1500,
          margin: EdgeInsets.only(top: 30, bottom: 30),
          child: StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('MealTypes').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, childAspectRatio: 1.2),
                    itemCount:
                        snapshot.hasData ? snapshot.data.documents.length : 0,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MealCategories(
                                      mealType: snapshot
                                          .data.documents[index].documentID,
                                      mealTypeName: snapshot.data
                                          .documents[index].data['typeName'])));
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 80, right: 80, bottom: 10, top: 30),
                          height: 0,
                          width: 0,
                          //padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              // borderRadius: BorderRadius.circular(32),
                              color: Colors.white,
                              boxShadow: kElevationToShadow[10],
                              shape: BoxShape.circle),
                          child: Column(
                            children: [
                              Center(
                                child: Image.asset(values[index]),
                                //heightFactor: -5,
                              ),
                              Center(
                                child: Text(
                                    snapshot
                                        .data.documents[index].data['typeName'],
                                    style: TextStyle(
                                        color: Color(0xFF09C04F),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }),
        ),
      ),
    );
  }
}

class TileLists extends StatelessWidget {
  final String tileText;

  TileLists({this.tileText});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        tileText,
        style: kMealStyle,
      ),
      trailing: Icon(Icons.arrow_downward_outlined),
      onTap: () {},
    );
  }
}
