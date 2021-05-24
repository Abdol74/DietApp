import 'package:flutter/material.dart';

class WorkoutColumn extends StatelessWidget {
  const WorkoutColumn(this.colName, this.fontSize, this.colVal);
  final String colName;
  final double fontSize;
  final String colVal;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '$colName',
          style: TextStyle(
              color: Color(0xFF09B44D),
              fontWeight: FontWeight.bold,
              fontSize: fontSize),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          '$colVal',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15.0),
        ),
      ],
    );
  }
}
