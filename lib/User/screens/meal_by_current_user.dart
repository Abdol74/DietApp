import 'package:daily_tracker_diet_app/Admin/Provider/meal_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealUser extends StatefulWidget {
  // final String mealTypeId;
  // final String userId;
  // MealUser({this.userId, this.mealTypeId});
  @override
  _MealUserState createState() => _MealUserState();
}

class _MealUserState extends State<MealUser> {
  @override
  void initState() {
    // TODO: implement initState
    MealProvider mealProvider =
        Provider.of<MealProvider>(context, listen: false);
    // mealProvider.loadMealsByUserAndType(
    //     userId: widget.userId, mealTypeId: widget.mealTypeId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MealProvider mealProvider = Provider.of<MealProvider>(context);
    return Scaffold(
      body: Container(
        child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: mealProvider.mealsByUserAndType.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () async {},
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 150,
                  color: Colors.blueGrey,
                  child: Column(
                    children: [
                      Text(mealProvider.mealsByUserAndType[index]
                                  .mealComponentName ==
                              null
                          ? 'MealName'
                          : mealProvider
                              .mealsByUserAndType[index].mealComponentName),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
