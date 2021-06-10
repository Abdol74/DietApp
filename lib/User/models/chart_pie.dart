import 'package:flutter/material.dart';

class ChartPie {
  final int caloriesNumber;
  final String workoutDay;

  ChartPie({this.caloriesNumber, this.workoutDay});

  ChartPie.fromMap(Map<String, dynamic> map)
      : assert(map['caloriesNumber'] != null),
        assert(map['WorkoutDay'] != null),
        caloriesNumber = map['caloriesNumber'],
        workoutDay = map['WorkoutDay'];

  @override
  String toString() => "Record<$caloriesNumber:$workoutDay>";
}
