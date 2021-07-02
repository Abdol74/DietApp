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
  final userId = _firestore.collection('Users').document('id');
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

  Stream<QuerySnapshot> getDocs(BuildContext context) async* {
    final userId = _firestore.collection('Users').document('id');
    print(userId);
    yield* Firestore.instance
        .collection('Clients')
        .where("clientId", isEqualTo: userId)
        .snapshots();
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
                    // ignore: missing_return
                    final Users = snapshot.data.documents;
                    List<ClientTable> clientTables = [];
                    for (var User in Users) {
                      final UserName = User.data['FirstName'];
                      final id = User.documentID;
                      final userid = User.data['id'];
                      print(id);
                      // ignore: missing_return
                      final clientTable = ClientTable(
                        Name: UserName,
                        clientid: id,

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
      ),
    );
  }
}

class ClientTable extends StatelessWidget {
  ClientTable({this.Name, this.clientid, this.Buttonclr, this.onPress});

  final Name;
  final clientid;
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
        this.NAME,
        this.color,
        this.btnText,
        this.clientid,
        this.Buttonclr,
        this.onPress});
  final NAME;
  final ID;
  final color;
  final btnText;
  final String clientid;
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
                        child: FlatButton(
                          onPressed: () async {
                            await _firestore
                                .collection('Users')
                                .document('$clientid')
                                .delete();

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
      ),
    );
  }
}

