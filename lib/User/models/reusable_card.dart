import 'package:flutter/material.dart';

// ignore: camel_case_types
class reusableCode extends StatelessWidget {
  reusableCode({@required this.colour, this.cardChild, this.onPress});
  final Color colour;
  final Widget cardChild;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
          child: cardChild,
          height: 100.0,
          width: 60.0,
          margin: EdgeInsets.only(
            left: 40.0,
            right: 40.0,
          ),
          padding: EdgeInsets.only(
            top: 10.0,
          ),
          decoration: BoxDecoration(
              color: colour, borderRadius: BorderRadius.circular(33.0))),
    );
  }
}
