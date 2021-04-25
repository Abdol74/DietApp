import 'dart:ui';
import 'package:flutter/material.dart';

class inputCard extends StatelessWidget {
  inputCard({this.image, this.label});
  final Image image;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        image,
        SizedBox(
          height: 10.0,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF09B44D),
          ),
        ),
      ],
    );
  }
}
