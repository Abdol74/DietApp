import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_tracker_diet_app/User/screens/notfications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:daily_tracker_diet_app/User/models/tips_button.dart';
import 'package:daily_tracker_diet_app/User/screens/popup_screen.dart';

class tipsScreen extends StatefulWidget {
  static const String id = 'tips_screen';
  @override
  _tipsScreenState createState() => _tipsScreenState();
}

class _tipsScreenState extends State<tipsScreen> {
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
          ),
        ),
        title: Row(
          children: <Widget>[
            Image.asset(
              'assets/images/bulb-63.png',
              width: 30.0,
              height: 30.0,
            ),
            SizedBox(
              width: 10.0,
            ),
            const Text('Tips',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF09B44D),
                )),
            SizedBox(width: 180,),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, notfications.id);
                },
                child: Icon(
                  Icons.notifications,
                  size: 30,
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
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back1.png'),
            fit: BoxFit.fill,
          ),
        ),      child:Column(
        children: <Widget>[
          SizedBox(height: 20,),
          Expanded(
            child: FutureBuilder(
                future: getTips(),
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Text('Loading ....'),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: <Widget>[
                              tip(
                                title: snapshot.data[index].data["tipName"],
                                ontap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return popup(
                                            title: snapshot
                                                .data[index].data["tipName"],
                                            dialog: snapshot.data[index]
                                                .data["description"]);
                                      });
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0),
                                child: SizedBox(
                                  width: 400,
                                  child: Divider(
                                    color: Colors.grey[300],
                                    thickness: 3.0,
                                  ),
                                ),
                              ),
                            ],
                          );
                        });
                  }
                }),
          ),
          Divider(
            height: 10.0,
            thickness: 4.0,
            color: Colors.grey[400],
          ),
        ],
      ),
      ),
    );
  }
}
