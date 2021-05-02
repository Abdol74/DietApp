import 'package:flutter/material.dart';

class TableRow extends StatelessWidget {
  TableRow({this.ID, this.NAME});
  final NAME;
  final ID;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.5),
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
            const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '$ID',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                ),
                Text(
                  '$NAME',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Color(0xFF09B44D),
                  ),
                  height: 20.0,
                  child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      'Delete',
                      style: TextStyle(
                          fontSize: 10.0, color: Colors.grey.shade300),
                    ),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
