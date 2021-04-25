import 'package:flutter/material.dart';

class tip extends StatelessWidget {
  tip({this.title, this.ontap});
  final String title;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 10.0),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    color: Color(0xFF09B44D),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.chevron_right_sharp,
                color: Color(0xFF09B44D),
                size: 25.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
