import 'package:flutter/material.dart';
import 'package:daily_tracker_diet_app/User/models/bottom_navigation_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:daily_tracker_diet_app/User/screens/workout_disease.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:daily_tracker_diet_app/User/models/workout_frame.dart';
import 'package:daily_tracker_diet_app/User/models/chart_bar.dart';
import 'package:daily_tracker_diet_app/User/models/data_card.dart';
import 'package:daily_tracker_diet_app/User/models/Data_card2.dart';
import 'package:daily_tracker_diet_app/User/models/chart_pie.dart';
import 'package:daily_tracker_diet_app/User/models/reusable_card.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

FirebaseUser loggedInUser;

DateTime day = DateTime.now();

String workoutDate = DateFormat('dd/MM/yyyy').format(day).toString();

WorkoutDisease wd = WorkoutDisease();
String dd = wd.workoutid;

// ignore: camel_case_types
class calenderScreen extends StatefulWidget {
  static const String id = 'history_screen';

  @override
  _calenderScreenState createState() => _calenderScreenState();
}

// ignore: camel_case_types
class _calenderScreenState extends State<calenderScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  final _auth = FirebaseAuth.instance;
  final _firestore =
      Firestore.instance.document('uid').collection("Clients").snapshots();
  final _firestore2 =
      Firestore.instance.collection("UserCurrentCalory").snapshots();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  Stream<QuerySnapshot> getDocs(BuildContext context) async* {
    yield* Firestore.instance
        .collection('UserWorkouts')
        .where("WorkoutDay", isEqualTo: workoutDate)
        .snapshots();
  }

  getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        final uid = user.uid.toString();
      }
    } catch (e) {
      print(e);
    }
  }

  List<ChartBar> data = [];
  List<ChartPie> dataPie = [];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final blockVertical = mediaQuery.size.height / 100;
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color(0xFF09B44D)),
          leading: Icon(
            Icons.arrow_back,
          ),
          title: Row(
            children: <Widget>[
              Image.asset(
                'assets/images/calendar-grid-61.png',
                width: 20.0,
                height: 20.0,
              ),
              SizedBox(
                width: 10.0,
              ),
              const Text('History',
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
        body: Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new AssetImage("assets/images/back1.png"),
                      fit: BoxFit.fill)),
            ),
            SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(
                      top: 0.0,
                    )),
                    Container(
                      width: 400.0,
                      height: 130.0,
                      decoration: BoxDecoration(
                          color: Color(0xFF09B44D),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25.0),
                              bottomRight: Radius.circular(25.0),
                              topRight: Radius.circular(25.0),
                              topLeft: Radius.circular(25.0)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade400,
                                blurRadius: 5.0,
                                spreadRadius: 0.5,
                                offset: Offset(0, 5))
                          ]),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            StreamBuilder<QuerySnapshot>(
                              stream: getDocs(context),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: CircularProgressIndicator(
                                      backgroundColor: Color(0xFF09B44D),
                                    ),
                                  );
                                }

                                // ignore: missing_return
                                final workouts = snapshot.data.documents;

                                List<workoutFrame> workoutFrames = [];
                                for (var workout in workouts) {
                                  final workoutName =
                                      workout.data['WorkoutName'];
                                  final calories =
                                      workout.data['caloriesNumber'];

                                  final workoutTime =
                                      workout.data['WorkoutTime'];

                                  // ignore: missing_return
                                  final workoutframe = workoutFrame(
                                    workoutName: workoutName,
                                    workoutTime: workoutTime,
                                    burnedCal: calories,
                                  );
                                  workoutFrames.add(workoutframe);
                                }

                                return Expanded(
                                    child: ListView(
                                  children: workoutFrames,
                                ));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Image.asset(
                                'assets/images/stretching.png',
                                width: 20.0,
                                height: 100.0,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 5.0),
                                child: Container(
                                    width: 200,
                                    height: 230,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.shade500,
                                              blurRadius: 5.0,
                                              spreadRadius: 0.5,
                                              offset: Offset(0, 5))
                                        ]),
                                    child: reusableCode(
                                        colour: Colors.white70,
                                        cardChild: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Image.asset(
                                              'assets/images/pie.png',
                                              width: 100.0,
                                              height: 100.0,
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            TypewriterAnimatedTextKit(
                                              text: ["Expand Piechart -->"],
                                              textStyle: TextStyle(
                                                fontSize: 17.0,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF09B44D),
                                              ),
                                            ),
                                          ],
                                        ),
                                        onPress: () {
                                          return showDialog(
                                              context: context,
                                              builder: (context) {
                                                return Center(
                                                  child: Material(
                                                    color: Colors.grey.shade300,
                                                    type: MaterialType.card,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Container(
                                                        height: 300,
                                                        width: 400,
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .grey.shade200,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade400,
                                                                  blurRadius:
                                                                      5.0,
                                                                  spreadRadius:
                                                                      0.5,
                                                                  offset:
                                                                      Offset(
                                                                          0, 5))
                                                            ]),
                                                        child: StreamBuilder<
                                                                QuerySnapshot>(
                                                            stream: Firestore
                                                                .instance
                                                                .collection(
                                                                    'UserWorkouts')
                                                                .snapshots(),
                                                            builder: (context,
                                                                snapshot) {
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return LinearProgressIndicator();
                                                              } else {
                                                                List<ChartPie>
                                                                    charttpie =
                                                                    snapshot
                                                                        .data
                                                                        .documents
                                                                        .map((documentSnapshot) =>
                                                                            ChartPie.fromMap(documentSnapshot.data))
                                                                        .toList();
                                                                dataPie =
                                                                    charttpie;
                                                              }
                                                              return Center(
                                                                  child:
                                                                      DataCardpie(
                                                                data: dataPie,
                                                              ));
                                                            }),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              });
                                        })),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 5.0),
                          child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(20.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade400,
                                        blurRadius: 5.0,
                                        spreadRadius: 0.5,
                                        offset: Offset(0, 5))
                                  ]),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.circular(20.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade500,
                                          blurRadius: 5.0,
                                          spreadRadius: 0.5,
                                          offset: Offset(0, 5))
                                    ]),
                                child: StreamBuilder<QuerySnapshot>(
                                  stream: Firestore.instance
                                      .collection('UserWorkouts')
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    if (!snapshot.hasData) {
                                      return LinearProgressIndicator();
                                    } else {
                                      List<ChartBar> charttbar = snapshot
                                          .data.documents
                                          .map((documentSnapshot) =>
                                              ChartBar.fromMap(
                                                  documentSnapshot.data))
                                          .toList();
                                      data = charttbar;
                                      return Center(
                                          child: DataCardbar(
                                        data: data,
                                      ));
                                    }
                                  },
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        bottomNavigationBar(
                          backgroundcolor: Color(0xFF09B44D),
                          selecteditemcolor: Colors.white,
                          unselecteditemColor: Colors.white.withOpacity(.60),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

