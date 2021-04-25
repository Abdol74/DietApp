import 'package:flutter/material.dart';

class popup extends StatelessWidget {
  popup({this.title, this.dialog});
  final String title;
  final String dialog;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.grey.shade300,
      child: Container(
        width: 200.0,
        height: 300.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF09B44D),
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                dialog,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
