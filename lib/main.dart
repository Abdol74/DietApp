import 'package:daily_tracker_diet_app/Admin/screens/add_meal_screen.dart';
import 'package:daily_tracker_diet_app/Admin/screens/admin_home.dart';
import 'package:flutter/material.dart';
import 'package:daily_tracker_diet_app/Admin/screens/view_user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xFF09B44D),
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: Profile.id,
      routes: {
        AddMeal.id: (context) => AddMeal(),
        Profile.id: (context) => Profile(),
        view_user.id: (context) => view_user(),
      },
    );
  }
}
