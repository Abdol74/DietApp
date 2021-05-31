import 'add_meal_screen.dart';
import 'package:daily_tracker_diet_app/Admin/models/requested_meal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;

class ApproveMeal extends StatefulWidget {
  static const String id = 'ApproveMeal';
  @override
  _ApproveMealState createState() => _ApproveMealState();
}

class _ApproveMealState extends State<ApproveMeal> {
  final _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  deleteMeal(id) async {
    await _firestore.collection('MealComponentsTemp').document('$id').delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.green),
        title: Text(
          "Requested Meals",
          style: TextStyle(
              color: Color(0xFF09C04F),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: new Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/am1.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection("MealComponentsTemp").snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Color(0xFF09B44D),
                    ),
                  );
                }
                // ignore: missing_return
                final reqMeals = snapshot.data.documents;
                List<MealBubble> mealBubbles = [];
                for (var reqMeal in reqMeals) {
                  // final mealImage = reqMeal.data['image'];
                  final mealName = reqMeal.data['mealName'];
                  final calories = reqMeal.data['caloriesNumber'];
                  final fats = reqMeal.data['fats'];
                  final carb = reqMeal.data['carb'];
                  final protein = reqMeal.data['protein'];
                  final desc = reqMeal.data['description'];
                  final mealImage = reqMeal.data['image'];
                  final id = reqMeal.documentID;

                  ;
                  // ignore: missing_return
                  final mealBubble = MealBubble(
                    //  mealImage: mealImage,
                    mealName: mealName,
                    desc: desc,
                    protein: protein,
                    calories: calories,
                    fat: fats,
                    carb: carb,
                    mealImage: mealImage,
                    id: id,
                  );
                  mealBubbles.add(mealBubble);
                }
                ;

                return Expanded(
                    child: ListView(
                  children: mealBubbles,
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
