import 'package:flutter/material.dart';
import 'package:daily_tracker_diet_app/User/screens/Support.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SupportAdmin extends StatefulWidget {
  //String email = '';
  //String problem = '';
  @override
  _SupportAdminState createState() => _SupportAdminState();
}
class _SupportAdminState extends State<SupportAdmin>{
  //SupportAdmin({this.email, this.problem});
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Color(0xFF09B44D)
        ),
        leading: Icon(Icons.arrow_back),
        title: const Text('Support messages',
            style: TextStyle(
              fontFamily: 'Roboto',
              color: Color(0xFF09B44D),
            )),
        actions: [],
        toolbarHeight: 80.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(40.0),
              bottomLeft: Radius.circular(40.0),
            )),
        backgroundColor: Colors.white,
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('Support').snapshots(),
        builder: (BuildContext context, AsyncSnapshot <QuerySnapshot> snapshot){
          if (!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data.documents.map((document){
              return Center (
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: 32.0,
                    horizontal: 20.0,
                  ),
                  margin: EdgeInsets.only(
                    bottom: 24.0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                          width: 2, color: Color(0xFF09B44D), style: BorderStyle.solid)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text ("email: " + document ['email'],
                        style: TextStyle(color: Color(0xFF707070), fontSize: 20.0, fontFamily: 'Cairo',),
                        ),
                        Padding(padding: EdgeInsets.only(top:10.0,),
                          child: Text ("problem: " + document ['problem'],
                            style: TextStyle(color: Color(0xFF707070), fontSize: 20.0, fontFamily: 'Cairo',),
                          ),
                        )
                      ],
                    )

                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

