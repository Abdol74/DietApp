import 'package:flutter/material.dart';
import 'package:daily_tracker_diet_app/User/models/Workout_Column.dart';

class workoutFrame extends StatelessWidget {
  const workoutFrame({this.workoutName, this.workoutTime, this.burnedCal});
  final String workoutName;
  final num workoutTime;
  final int burnedCal;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(
            left: 15.0, right: 15.0, top: 10.0, bottom: 15.0),
        child: Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 5.0,
                    spreadRadius: 0.5,
                    offset: Offset(0, 5))
              ]),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 25, bottom: 25, left: 10, right: 10),
            child: Row(
              children: <Widget>[
                WorkoutColumn('Workout', 15.0, '$workoutName'),
                VerticalDivider(
                  thickness: 1.0,
                  width: 2.0,
                  color: Colors.grey.shade400,
                ),
                Expanded(
                  child: WorkoutColumn('workout(int)', 15.0, '$workoutTime'),
                ),
                VerticalDivider(
                  thickness: 1.0,
                  width: 2.0,
                  color: Colors.grey.shade400,
                ),
                Expanded(
                  child: WorkoutColumn('Calories', 15.0, '$burnedCal'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
