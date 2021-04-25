import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class view_user extends StatelessWidget {
  static const String id = 'view_user';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF09B44D)),
        leading: Icon(
          Icons.arrow_back,
        ),
        title: Row(
          children: <Widget>[
            SizedBox(
              width: 1.0,
            ),
            const Text('View User',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF09B44D),
                )),
          ],
        ),
        actions: [
          Icon(Icons.notifications),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search),
          ),
        ],
        toolbarHeight: 80.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(40.0),
          bottomLeft: Radius.circular(40.0),
        )),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 5.0,
                    spreadRadius: 0.5,
                    offset: Offset(0, 5))
              ]),
              margin: EdgeInsets.all(20.0),
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(9),
                },
                border: TableBorder.all(
                  color: Colors.grey.shade200,
                  style: BorderStyle.solid,
                  width: 2.0,
                ),
                children: [
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'ID',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Color(0xFF09B44D),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'User Name',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Color(0xFF09B44D),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 9.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '00',
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'FirstName SecondName',
                              style: TextStyle(color: Colors.grey.shade600),
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
                                      fontSize: 10.0,
                                      color: Colors.grey.shade300),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 9.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '00',
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'FirstName SecondName',
                              style: TextStyle(color: Colors.grey.shade600),
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
                                      fontSize: 10.0,
                                      color: Colors.grey.shade300),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
