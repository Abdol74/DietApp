import 'package:daily_tracker_diet_app/Admin/Provider/catogery_provider.dart';
import 'package:daily_tracker_diet_app/Admin/Provider/meal_provider.dart';
import 'package:daily_tracker_diet_app/Admin/screens/add_meal_screen.dart';
import 'package:daily_tracker_diet_app/Admin/screens/admin_home.dart';
import 'package:daily_tracker_diet_app/Admin/screens/meal_home.dart';
import 'package:flutter/material.dart';
import 'package:daily_tracker_diet_app/Admin/screens/view_user.dart';
import 'package:provider/provider.dart';
import 'package:daily_tracker_diet_app/Admin/screens/login_screen.dart';

import 'User/screens/register.dart';
import 'User/screens/step1.dart';
import 'User/screens/step2.dart';
import 'User/screens/step3.dart';
import 'User/screens/step4.dart';
import 'User/screens/welcome_screen.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MealProvider(),
        ),
      ],
      child: MyApp(),
    ));

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
      initialRoute: WelcomeScreen.id, routes: {
      WelcomeScreen.id:(context)=>WelcomeScreen(),
      LoginScreen.id:(context)=>LoginScreen(),
      StepOne.id:(context)=>StepOne(),
      StepTwo.id:(context)=>StepTwo(),
      StepThree.id:(context)=>StepThree(),
      StepFour.id:(context)=>StepFour(),
      Register.id:(context)=>Register(),
        AddMeal.id: (context) => AddMeal(),
        Profile.id: (context) => Profile(),
        view_user.id: (context) => view_user(),
        ProfileMeal.id: (context) => ProfileMeal(),
        LoginScreen.id: (context) => LoginScreen(),
      },
    );
  }
}
