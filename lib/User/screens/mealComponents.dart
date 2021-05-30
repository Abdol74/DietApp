import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;

class mealComponents extends StatefulWidget {
  static const String id = 'mealComponents';

  @override
  _view_userState createState() => _view_userState();
}

class _view_userState extends State<mealComponents> {
  final clientdataController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String pubComponentId;
  double caloriesNumber;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
    messagesStream();
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
    await for (var snapshot
        in _firestore.collection('MealComponents').snapshots()) {
      for (var Component in snapshot.documents) {
        print(Component.data);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF09B44D)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
        ),
        title: Row(
          children: <Widget>[
            SizedBox(
              width: 1.0,
            ),
            const Text('Meal Components',
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
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('MealComponents').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Color(0xFF09B44D),
                      ),
                    );
                  }
                  // ignore: missing_return
                  final Components = snapshot.data.documents;
                  List<ClientTable> clientTables = [];
                  for (var component in Components) {
                    final caloriesNO = component.data['caloriesNumber'];
                    final compName = component.data['mealName'];
                    final carbs = component.data['carb'];
                    final fats = component.data['fats'];
                    final measure = component.data['measure'];
                    final protein = component.data['protein'];
                    final componentId = component.data['id'];
                    final compDescription = component.data['mealDescription'];
                    ComponentID = componentId;
                    // ignore: missing_return
                    final clientTable = ClientTable(
                      calNo: caloriesNO,
                      cName: compName,
                      carb: carbs,
                      fats: fats,
                      measure: measure,
                      protein: protein,
                      description: compDescription,
                    );
                    clientTables.add(clientTable);
                  }
                  ;
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
    );
  }
}

String ComponentID;

class ClientTable extends StatelessWidget {
  ClientTable(
      {this.calNo,
      this.cName,
      this.carb,
      this.fats,
      this.measure,
      this.protein,
      this.compId,
      this.description});
  final calNo;
  final cName;
  final carb;
  final protein;
  final fats;
  final measure;
  final compId;
  final description;
  @override
  Widget build(BuildContext context) {
    return TableRow(
      COLNO: calNo,
      CNAME: cName,
      CRAB: carb,
      PROTEIN: protein,
      MEASURE: measure,
      COMPONENTID: compId,
      FATS: fats,
      color: Colors.black,
      btnText: 'Add',
    );
  }
}

class TableRow extends StatefulWidget {
  TableRow(
      {this.COLNO,
      this.CNAME,
      this.CRAB,
      this.color,
      this.btnText,
      this.FATS,
      this.MEASURE,
      this.PROTEIN,
      this.COMPONENTID,
      this.DESCRIPTION});
  final CNAME;
  final COLNO;
  final color;
  final btnText;
  final CRAB;
  final PROTEIN;
  final FATS;
  final MEASURE;
  final COMPONENTID;
  final DESCRIPTION;

  @override
  _TableRowState createState() => _TableRowState();
}

class _TableRowState extends State<TableRow> {
  double _n = 0.0;
  void add() {
    setState(() {
      if (_n < 1) {
        _n += .5;
      } else
        _n += .25;
    });
  }

  void minus() {
    setState(() {
      if (_n != 0) _n -= .25;
    });
  }

  final fireStore = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
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
      child: Column(children: <Widget>[
        Text(
          '${widget.CNAME}',
          style: TextStyle(
              color: widget.color, fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        Text(
          'Description: ${widget.DESCRIPTION}',
          style: TextStyle(
              color: widget.color, fontWeight: FontWeight.bold, fontSize: 15.0),
        ),
        Text(
          'Calories: ${widget.COLNO}',
          style: TextStyle(
              color: widget.color, fontWeight: FontWeight.bold, fontSize: 15.0),
        ),
        Text(
          'Crabs: ${widget.CRAB}',
          style: TextStyle(
              color: widget.color, fontWeight: FontWeight.bold, fontSize: 15.0),
        ),
        Text(
          'Protein: ${widget.PROTEIN}',
          style: TextStyle(
              color: widget.color, fontWeight: FontWeight.bold, fontSize: 15.0),
        ),
        Text(
          'Fats: ${widget.FATS}',
          style: TextStyle(
              color: widget.color, fontWeight: FontWeight.bold, fontSize: 15.0),
        ),
        Text(
          'Measure: ${widget.MEASURE}',
          style: TextStyle(
              color: widget.color, fontWeight: FontWeight.bold, fontSize: 15.0),
        ),
        new Container(
          child: new Center(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new FloatingActionButton(
                  onPressed: add,
                  child: new Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                  backgroundColor: Colors.white,
                ),
                new Text('$_n', style: new TextStyle(fontSize: 60.0)),
                new FloatingActionButton(
                  onPressed: minus,
                  child: new Icon(
                      const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                      color: Colors.black),
                  backgroundColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Color(0xFF09B44D),
          ),
          height: 20.0,
          child: FlatButton(
            onPressed: () async {
              final FirebaseUser user =
                  await FirebaseAuth.instance.currentUser();
              final String uid = user.uid.toString();

              fireStore.collection('UserMealComponents').add({
                'mealComponentCounts': _n,
                'mealComponentId': ComponentID,
                'UserID': uid,
                'userMealId': "BTulzDKvWPThOcjJWrKN"
              });
            },
            child: Text(
              'Add',
              style: TextStyle(fontSize: 10.0, color: Colors.grey.shade300),
            ),
          ),
        ),
      ]),
    );
  }
}
