import 'package:flutter/material.dart';
import 'package:daily_tracker_diet_app/User/screens/SupportAdmin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Support extends StatefulWidget {
  @override
  _SupportState createState() => _SupportState();
}
class _SupportState extends State<Support>{

  String email = ' ', problem = ' ';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final fireStore = Firestore.instance;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Color(0xFF09B44D)
        ),
        leading: Icon(Icons.arrow_back),
        title: const Text('Support',
            style: TextStyle(
              fontFamily: 'Roboto',
              color: Color(0xFF09B44D),
            )),
        actions: [
          Icon(Icons.notifications),
          Padding(
            padding: EdgeInsets.symmetric(horizontal:16),
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
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Text(
                      'What do you need from us?',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        color: const Color(0xff707070),
                        fontWeight: FontWeight.w700,
                      )
                  ),),
                Container(
                  padding: const EdgeInsets.only(top: 40.0),
                  alignment: Alignment.center,
                  child: Container(
                    width: 335.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                            width: 1, color: Color(0xFF707070), style: BorderStyle.solid)),
                    child: TextField(
                      autofocus: false,
                      keyboardType: TextInputType. emailAddress,
                      onChanged: (text){
                        setState(() => email = text);
                      },

                      minLines: 1,
                      decoration: InputDecoration(
                          hintText: 'Enter your email address',
                          contentPadding: EdgeInsets.all(15),
                          border: InputBorder.none),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 40.0),
                  alignment: Alignment.center,
                  child: Container(
                    width: 335.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                            width: 1, color: Color(0xFF707070), style: BorderStyle.solid)),
                    child: TextField(
                      onChanged: (text){
                        setState(() => problem = text);
                      },
                      autofocus: false,
                      minLines: 10,
                      maxLines: 15,
                      decoration: InputDecoration(
                          hintText: 'Type your problem',
                          contentPadding: EdgeInsets.all(15),
                          border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300.0,
                  height: 50.0,
                  child: RaisedButton(
                    color: Color(0xFF09B44D),
                    child: Text("Send", style: TextStyle(fontFamily: 'Roboto', fontSize: 18, color: const Color(0xffffffff),),),
                    onPressed: () async {
                      fireStore.collection('Support').add({
                        'email': email,
                        'problem': problem,
                      });
                    },
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                )
              ],
            )
          ],

        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF09B44D),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          // Respond to item press.
        },
        items: [
          BottomNavigationBarItem(
            title: Text('Favorites'),
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('Places'),
            icon: Icon(Icons.location_on),
          ),
          BottomNavigationBarItem(
            title: Text('News'),
            icon: Icon(Icons.library_books),
          ),
        ],
      ),


    );
  }
}
