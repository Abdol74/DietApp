import 'package:flutter/material.dart';

class ChartBar {
  final int workoutTime;
  final String workoutDay;

  ChartBar({this.workoutTime, this.workoutDay});

  ChartBar.fromMap(Map<String, dynamic> map)
      : assert(map['WorkoutTime'] != null),
        assert(map['WorkoutDay'] != null),
        workoutTime = map['WorkoutTime'],
        workoutDay = map['WorkoutDay'];

  @override
  String toString() => "Record<$workoutTime:$workoutDay>";
}
