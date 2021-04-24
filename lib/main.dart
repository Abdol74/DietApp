import 'package:daily_tracker_diet_app/screens/add_meal_screen.dart';
import 'package:daily_tracker_diet_app/screens/admin_home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Profile.id,
      routes: {
        AddMeal.id: (context) => AddMeal(),
        Profile.id: (context) => Profile(),
      },
    );
  }
}
