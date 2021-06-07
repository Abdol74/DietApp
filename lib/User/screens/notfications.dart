import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_tracker_diet_app/User/screens/popup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

DateTime _now = DateTime.now();
DateTime _start = DateTime(_now.year, _now.month, _now.day, 0, 0);
DateTime _end = DateTime(_now.year, _now.month, _now.day, 23, 59, 59);

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
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance
                      .collection('Tips')
                      .where('date', isGreaterThanOrEqualTo: _start)
                      .where('date', isLessThanOrEqualTo: _end)
                      .orderBy('date')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: Text('Loading ....'),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot data =
                            snapshot.data.documents[index];
                            Map getDocs = data.data;
                            return

                              popup(
                                  title: data["tipName"],
                                  dialog: data["description"]);


                          });
                    }
                  }))
        ],
      ),
    );
  }
}
