import 'package:cloud_firestore/cloud_firestore.dart';

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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => AddNote()));
        },
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('MealTypes').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount:
                    snapshot.hasData ? snapshot.data.documents.length : 0,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MealCategories(
                                    mealType: snapshot
                                        .data.documents[index].documentID,
                                  )));
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 150,
                      color: Colors.blueGrey,
                      child: Column(
                        children: [
                          Text(snapshot.data.documents[index].data['typeName']),
                        ],
                      ),
                    ),
                  );
                });
          }),
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
