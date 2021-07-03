import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

DateTime _now = DateTime.now();
DateTime _start = DateTime(_now.year, _now.month, _now.day, 0, 0);
DateTime _end = DateTime(_now.year, _now.month, _now.day, 23, 59, 59);

var stream1 = Firestore.instance
    .collection('Tips')
    .where('date', isGreaterThanOrEqualTo: _start)
    .where('date', isLessThanOrEqualTo: _end)
    .orderBy('date')
    .snapshots();
var stream2 = Firestore.instance
    .collection('Tips')
    .where('date', isLessThan: DateTime.now())
    .orderBy('date')
    .snapshots();

class notfications extends StatefulWidget {
  static const String id = 'notfications ';
  @override
  _notficationsState createState() => _notficationsState();
}

class _notficationsState extends State<notfications> {
  Future getTips() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("Tips").getDocuments();
    return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color(0xFF09B44D)),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              size: 25,
            ),
          ),
          title: Row(
            children: <Widget>[
              SizedBox(
                width: 50.0,
              ),
              Icon(Icons.notifications),
              const Text('Notifcations',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF09B44D),
                  )),
            ],
          ),
          toolbarHeight: 50.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40.0),
            bottomLeft: Radius.circular(40.0),
          )),
          backgroundColor: Colors.white,
        ),
        body: Container(
          color: Colors.green,
          child: Column(children: <Widget>[
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: stream1,
                  builder: (context, snapshot1) {
                    return StreamBuilder<QuerySnapshot>(
                        stream: stream2,
                        builder: (context, snapshot2) {
                          return Container(
                            child: ListView.builder(
                                itemCount: snapshot1.data.documents.length,
                                itemBuilder: (context, index) {
                                  DocumentSnapshot data =
                                      snapshot1.data.documents[index];
                                  DocumentSnapshot data2 =
                                      snapshot2.data.documents[index];
                                  Map getDocs = data.data;
                                  Map getDocs2 = data2.data;
                                  return Column(children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 35.0, vertical: 10.0),
                                      child: Text(
                                        "Recent",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    ListTile(
                                      title: Text(
                                         data['tipName'],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    Divider(
                                      height: 10.0,
                                      endIndent: 35.0,
                                      indent: 35.0,
                                      thickness: 2.0,
                                      color: Colors.grey.shade300,
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: 2),
                                          child: Text(
                                            "Earlier",
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                                color: Colors.white,
                                                fontSize: 17.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        ListTile(
                                          title: Text(
                                           data2['tipName'],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]);
                                }),
                          );
                        });
                  }),
            )
          ]),
        ));
  }
}
