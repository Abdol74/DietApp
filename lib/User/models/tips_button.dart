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
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                    fontFamily: "ROPOTO"
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:5.0),
                child: Icon(
                  Icons.chevron_right_sharp,
                  color: Colors.grey[700],
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
