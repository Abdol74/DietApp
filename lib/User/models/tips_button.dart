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
          padding: EdgeInsets.only(right: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: Text(
                  title,
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  softWrap: false,
                  style: TextStyle(
                      color: Color(0xFF09B44D),
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:10.0),
                child: Icon(
                  Icons.chevron_right_sharp,
                  color: Color(0xFF09B44D),
                  size: 25.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
