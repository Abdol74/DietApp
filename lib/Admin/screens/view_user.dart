import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;

class view_user extends StatefulWidget {
  static const String id = 'view_user';

  @override
  _view_userState createState() => _view_userState();
}

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
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              TableRow(
                ID: 'ID',
                NAME: 'UserName',
                color: Color(0xFF09B44D),
                btnText: 'Delete All',
              ),
              StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('Clients').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Color(0xFF09B44D),
                      ),
                    );
                  }
                  // ignore: missing_return
                  final Clients = snapshot.data.documents;
                  List<ClientTable> clientTables = [];
                  for (var Client in Clients) {
                    final clientId = Client.data['id'];
                    final clientName = Client.data['clientName'];
                    // ignore: missing_return
                    final clientTable = ClientTable(
                      Id: clientId,
                      Name: clientName,
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

class ClientTable extends StatelessWidget {
  ClientTable({this.Id, this.Name});
  final Id;
  final Name;
  @override
  Widget build(BuildContext context) {
    return TableRow(
      ID: Id,
      NAME: Name,
      color: Colors.black,
      btnText: 'Delete',
    );
  }
}

class TableRow extends StatelessWidget {
  TableRow({this.ID, this.NAME, this.color, this.btnText});
  final NAME;
  final ID;
  final color;
  final btnText;
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
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                ),
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
                    color: Color(0xFF09B44D),
                  ),
                  height: 20.0,
                  child: FlatButton(
                    onPressed: () async {
                      await ID.collection('Clients').doc('$NAME').delete();
                    },
                    child: Text(
                      '$btnText',
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
