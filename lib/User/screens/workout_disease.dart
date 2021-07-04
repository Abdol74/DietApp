import 'package:daily_tracker_diet_app/User/helpers/workout_disease_noun_brain.dart';
import 'package:daily_tracker_diet_app/User/screens/step2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

final _firestore = Firestore.instance;

double timeSec = double.tryParse(values[2]);
double timemin = double.tryParse(values[1]) * 60;
DateTime day = DateTime.now();

String workoutDate = DateFormat('dd/MM/yyyy').format(day).toString();
var displaytime;
String a1 = displaytime.toString();
var split_time = a1.split(":");
Map<int, String> values = {
  for (int i = 0; i < split_time.length; i++) i: split_time[i]
};
enum RunningType { General, Track }

RunningType selectedRunning;

class WorkoutDisease extends StatefulWidget {
  static String id = "workoutDisease";
  final String diseaseValue;
  final double age;
  final double weight;
  String workoutid;
  WorkoutDisease({this.diseaseValue, this.age, this.weight, this.workoutid});
  @override
  _WorkoutDiseaseState createState() => _WorkoutDiseaseState();
}

class _WorkoutDiseaseState extends State<WorkoutDisease> {
  String workoutid;
  int minMin = 20;
  int maxMin = 60;
  Color inActiveColor = Colors.grey[200];
  Color activeColor = Color(0xFF09C04F);
  final _formKey = GlobalKey<FormState>();
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final _isminute = true;
  @override
  void dispose() {
    super.dispose();
    _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: new Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/back1.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: new ListView(
            children: <Widget>[
              new Container(
                height: 50,
                width: 20,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[400],
                        blurRadius: 20,
                      )
                    ]),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(left: 20, top: 50)),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Color(0xFF09C04F),
                            size: 30.0,
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          "Workout",
                          style: TextStyle(
                              color: Color(0xFF09C04F),
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 150,
                        ),
                        Icon(
                          Icons.notifications,
                          color: Color(0xFF09C04F),
                          size: 30.0,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/run.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 15),
                      child: Material(
                        color: selectedRunning == RunningType.General
                            ? activeColor
                            : inActiveColor,
                        elevation: 16.0,
                        borderRadius: BorderRadius.circular(12.0),
                        shadowColor: Colors.grey[800],
                        child: InkWell(
                          splashColor: Color(0xFF09C04F),
                          borderRadius: BorderRadius.circular(16.0),
                          child: Container(
                            height: 40,
                            child: Center(
                                child: Text(
                              "Running General",
                            )),
                          ),
                          onTap: () {
                            setState(() {
                              selectedRunning = RunningType.General;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 4),
                  Expanded(
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                      child: Material(
                        color: selectedRunning == RunningType.Track
                            ? activeColor
                            : inActiveColor,
                        elevation: 20.0,
                        borderRadius: BorderRadius.circular(12.0),
                        shadowColor: Colors.grey,
                        child: InkWell(
                          splashColor: Color(0xFF09C04F),
                          borderRadius: BorderRadius.circular(16.0),
                          child: Container(
                            height: 40,
                            child: Center(
                                child: Text(
                              "Running Track",
                            )),
                          ),
                          onTap: () {
                            setState(() {
                              selectedRunning = RunningType.Track;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: const EdgeInsets.all(15.0),
                height: 300,
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  border: Border.all(width: 4, color: Color(0xFF09C04F)),
                  borderRadius: BorderRadius.circular(200),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("STOP WATCH",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 20,
                    ),
                    StreamBuilder<int>(
                        stream: _stopWatchTimer.rawTime,
                        initialData: _stopWatchTimer.rawTime.value,
                        builder: (context, snapshot) {
                          final value = snapshot.data;
                          displaytime = StopWatchTimer.getDisplayTime(value,
                              hours: _isminute);
                          return Text(
                            displaytime,
                            style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          );
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 80,
                        ),
                        RaisedButton(
                          onPressed: () {
                            _stopWatchTimer.onExecute
                                .add(StopWatchExecute.start);
                          },
                          child: Text('start',
                              style: TextStyle(color: Colors.white)),
                          color: Colors.green,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        RaisedButton(
                          onPressed: () {
                            _stopWatchTimer.onExecute
                                .add(StopWatchExecute.stop);
                          },
                          child: Text('Stop',
                              style: TextStyle(color: Colors.white)),
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 90,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            return (_stopWatchTimer.onExecute
                                .add(StopWatchExecute.reset));
                          },
                          child: Text('Reset'),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
//                          return(_stopWatchTimer.rawTime.listen((value) => print('rawTime $value ${StopWatchTimer.getDisplayTime(value)}')));
                            print(timemin + timeSec);
                          },
                          child: Text('Commit'),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 150,
                  ),
                  RaisedButton(
                    color: Color(0xFF09C04F),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      "Calculate",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        WorkoutDiseaseBrain wDiseaseBrain = WorkoutDiseaseBrain(
                            runningType: selectedRunning,
                            weight: widget.weight,
                            duration: timeSec + timemin);

                        int calories = wDiseaseBrain.caloriesBurned().toInt();
                        print(calories);
                        DocumentReference docref =
                            await _firestore.collection("UserWorkouts").add({
                          'caloriesNumber': calories,
                          'WorkoutDay': workoutDate,
                          'WorkoutTime': timemin.toInt(),
                          'WorkoutName': selectedRunning.toString(),
                        });
                        workoutid = docref.documentID;
                      } else {
                        Text("erorr");
                      }
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
