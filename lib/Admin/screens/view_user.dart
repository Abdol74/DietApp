import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_tracker_diet_app/Admin/screens/meal_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;

// ignore: camel_case_types
class view_user extends StatefulWidget {
  static const String id = 'view_user';

  @override
  _view_userState createState() => _view_userState();
}

// ignore: camel_case_types
class _view_userState extends State<view_user> {
  final clientdataController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String clientName;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  void messagesStream() async {
    await for (var snapshot in _firestore.collection('Clients').snapshots()) {
      for (var Client in snapshot.documents) {
        print(Client.data);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF09B44D)),
        leading: GestureDetector(
          onTap: () {
            Navigator.popAndPushNamed(context, ProfileMeal.id);
          },
          child: Icon(
            Icons.arrow_back,
          ),
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
        actions: [],
        toolbarHeight: 80.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(40.0),
          bottomLeft: Radius.circular(40.0),
        )),
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage("assets/images/back1.png"),
                fit: BoxFit.fill)),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                TableRow(
                  NAME: 'UserName',
                  color: Color(0xFF09B44D),
                  btnText: 'Delete All',
                  Buttonclr: Colors.white,
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: _firestore.collection('Users').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Color(0xFF09B44D),
                        ),
                      );
                    }
                    // ignore: missing_return, non_constant_identifier_names
                    final Users = snapshot.data.documents;
                    List<ClientTable> clientTables = [];
                    for (var User in Users) {
                      // ignore: non_constant_identifier_names
                      final UserName = User.data['FirstName'];
                      final id = User.documentID;
                      final userid = User.data['id'];
                      print(id);
                      // ignore: missing_return
                      final clientTable = ClientTable(
                        Name: UserName,
                        clientid: id,
                        onPress: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Center(
                                  child: Container(
                                    width: 300,
                                    height: 300,
                                    child: Column(
                                      children: <Widget>[
                                        StreamBuilder<QuerySnapshot>(
                                            stream: _firestore
                                                .collection('Clients')
                                                .where("clientId",
                                                    isEqualTo: userid)
                                                .snapshots(),
                                            builder: (context, snapshot) {
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    backgroundColor:
                                                        Color(0xFF09B44D),
                                                  ),
                                                );
                                              }
                                              final details =
                                                  snapshot.data.documents;
                                              // ignore: non_constant_identifier_names
                                              List<DetailsFrame> DetailsFrames =
                                                  [];
                                              for (var detail in details) {
                                                final detName =
                                                    detail.data['clientName'];
                                                final age = detail.data['age']
                                                    .toString();
                                                final birthday = detail
                                                    .data['birthday']
                                                    .toString();
                                                final goalName =
                                                    detail.data['goalName'];
                                                final deseasestts = detail
                                                    .data['diseaseStatus'];
                                                final activityLevel = detail
                                                    .data['activityLevelValue'];
                                                final calreq = detail
                                                    .data['caloriesRequired']
                                                    .toString();

                                                final detailframe =
                                                    DetailsFrame(
                                                  ClientName: detName,
                                                  Age: age,
                                                  Birthday: birthday,
                                                  goalName: goalName,
                                                  ActivityLevel: activityLevel,
                                                  diseaseStatus: deseasestts,
                                                  caloriesReq: calreq,
                                                );
                                                DetailsFrames.add(detailframe);
                                              }
                                              return Expanded(
                                                  child: ListView(
                                                children: DetailsFrames,
                                              ));
                                            })
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                      );
                      clientTables.add(clientTable);
                    }

                    return Expanded(
                        child: ListView(
                      children: clientTables,
                    ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ClientTable extends StatelessWidget {
  ClientTable({this.Name, this.clientid, this.Buttonclr, this.onPress});

  // ignore: non_constant_identifier_names
  final Name;
  final clientid;
  // ignore: non_constant_identifier_names
  final Buttonclr;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return TableRow(
      NAME: Name,
      color: Colors.black,
      btnText: 'Delete',
      clientid: clientid,
      Buttonclr: Color(0xFF09B44D),
      onPress: onPress,
    );
  }
}

class TableRow extends StatelessWidget {
  TableRow(
      {this.ID,
      // ignore: non_constant_identifier_names
      this.NAME,
      this.color,
      this.btnText,
      this.clientid,
      // ignore: non_constant_identifier_names
      this.Buttonclr,
      this.onPress});
  final NAME;
  // ignore: non_constant_identifier_names
  final ID;
  final color;
  final btnText;
  final String clientid;
  // ignore: non_constant_identifier_names
  final Buttonclr;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
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
                    '$NAME',
                    style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Buttonclr,
                    ),
                    height: 20.0,
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      onPressed: () async {
                        await _firestore
                            .collection('Users')
                            .document('$clientid')
                            .delete();
                      },
                      child: Text(
                        '$btnText',
                        style: TextStyle(fontSize: 10.0, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsFrame extends StatelessWidget {
  const DetailsFrame(
      // ignore: non_constant_identifier_names
      {this.ActivityLevel,
      // ignore: non_constant_identifier_names
      this.Age,
      // ignore: non_constant_identifier_names
      this.Birthday,
      this.caloriesReq,
      // ignore: non_constant_identifier_names
      this.ClientName,
      this.goalName,
      this.diseaseStatus});
  // ignore: non_constant_identifier_names
  final ClientName;
  // ignore: non_constant_identifier_names
  final Age;
  final Birthday;
  final goalName;
  final diseaseStatus;
  // ignore: non_constant_identifier_names
  final ActivityLevel;
  final caloriesReq;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      width: 300,
      height: 250,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0, top: 20.0, bottom: 5.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'UserName :',
                    style: TextStyle(
                        color: Color(0xFF09B44D), fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(ClientName),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0, bottom: 5.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'Age :',
                    style: TextStyle(
                        color: Color(0xFF09B44D), fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(Age),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0, bottom: 30.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'BirthDate :',
                    style: TextStyle(
                        color: Color(0xFF09B44D), fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(Birthday),
                ]),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: Colors.green,
                    ),
                    child: Center(
                      child: Text(
                        'Goal :',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                        height: 30.0,
                        decoration: BoxDecoration(
                          color: Colors.green.shade200,
                        ),
                        child: Center(child: Text(goalName)))),
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: Colors.green.shade200,
                    ),
                    child: Center(
                      child: Text(
                        'Disease :',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                        height: 30.0,
                        decoration: BoxDecoration(
                          color: Colors.green,
                        ),
                        child: Center(child: Text(diseaseStatus)))),
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: Colors.green,
                    ),
                    child: Center(
                      child: Text(
                        'Activity Level :',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                        height: 30.0,
                        decoration: BoxDecoration(
                          color: Colors.green.shade200,
                        ),
                        child: Center(child: Text(ActivityLevel)))),
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: Colors.green.shade200,
                    ),
                    child: Center(
                      child: Text(
                        'Calories Req :',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                        height: 30.0,
                        decoration: BoxDecoration(
                          color: Colors.green,
                        ),
                        child: Center(child: Text(caloriesReq)))),
              ]),
        ],
      ),
    );
  }
}
