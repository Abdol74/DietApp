import 'package:daily_tracker_diet_app/User/helpers/workout_disease_noun_brain.dart';
import 'package:daily_tracker_diet_app/User/screens/step2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';


double distance;
double timeMin;
double timeSec;

enum RunningType { General, Track }

RunningType selectedRunning;

class WorkoutDisease extends StatefulWidget {
  static String id = "workoutDisease";
  final String diseaseValue;
  final double age;
  final double weight;
  WorkoutDisease({this.diseaseValue, this.age, this.weight});
  @override
  _WorkoutDiseaseState createState() => _WorkoutDiseaseState();
}

class _WorkoutDiseaseState extends State<WorkoutDisease> {
  int minMin = 20;
  int maxMin = 60;
  Color inActiveColor = Colors.grey[200];
  Color activeColor = Color(0xFF09C04F);
  final _formKey = GlobalKey<FormState>();
  final StopWatchTimer _stopWatchTimer=StopWatchTimer();
  final _isHours=true;



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
                        Icon(
                          Icons.arrow_back,
                          color: Color(0xFF09C04F),
                          size: 30.0,
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
              Padding(
                  padding: EdgeInsets.only(left: 40.0, right: 40, top: 30.0),
                  child: new Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        "Time",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      new Flexible(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.green)),
                            hintText: "0",
                          ),
                          onChanged: (value) {
                            setState(() {
                              timeMin = double.tryParse(value);
                            });
                          },
                          validator: (String value) {
                            double time = double.tryParse(value);
                            if (widget.diseaseValue == 'Diabetes' ||
                                widget.diseaseValue == 'Hypertension') {
                              if (time == null || time > minMin) {
                                return "MAX 20";
                              }
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        ":",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      new Flexible(
                        child: new TextField(
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.green)),
                            hintText: "0",
                          ),
                          onChanged: (value) {
                            timeSec = double.parse(value);
                          },
                        ),
                      ),
                    ],
                  )),
              SizedBox(height: 40,),
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
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        WorkoutDiseaseBrain wDiseaseBrain = WorkoutDiseaseBrain(
                            runningType: selectedRunning,
                            weight: widget.weight,
                            duration: timeMin);
                        double calories = wDiseaseBrain.caloriesBurned();
                        print(calories.round());
                      } else {
                        Text("erorr");
                      }
                    },
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
                      border: Border.all(width: 4,
                          color: Color(0xFF09C04F)),
                        borderRadius:BorderRadius.circular(200),
                  ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("STOP WATCH",style: TextStyle(color: Colors.green,fontSize: 22,fontWeight: FontWeight.bold)),
              SizedBox(height: 20,),
              StreamBuilder<int>(
                  stream: _stopWatchTimer.rawTime,
                  initialData: _stopWatchTimer.rawTime.value,
                  builder: (context,snapshot) {
                final value=snapshot.data;
                final displaytime=StopWatchTimer.getDisplayTime(value,hours: _isHours);
                return Text(displaytime ,
                  style: const TextStyle(fontSize: 40,fontWeight:FontWeight.bold,
                      color:Colors.grey),
                );
                  }
              ),
                  SizedBox(height: 20,),
                          Row(
                    children: <Widget>[
                      SizedBox(width: 80,),
                      RaisedButton(
                        onPressed: () {
                          _stopWatchTimer.onExecute.add(StopWatchExecute.start);
                        },
                        child: Text('start',style: TextStyle(color: Colors.white)),
                        color: Colors.green,
                      ),
                      SizedBox(width: 15,),
                      RaisedButton(
                        onPressed: () {
                          _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
                        },
                        child: Text('Stop',style: TextStyle(color: Colors.white)),
                        color: Colors.red,
                          ),
                      SizedBox(width: 15,),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 90,),
                      ElevatedButton(
                        onPressed: () {
                          return(_stopWatchTimer.onExecute.add(StopWatchExecute.reset));
                        },
                        child: Text('Reset'),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      ElevatedButton(
                        onPressed: () {
                          return(_stopWatchTimer.rawTime.listen((value) => print('rawTime $value ${StopWatchTimer.getDisplayTime(value)}')));
                        },
                        child: Text('Commit'),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
        ),
              SizedBox(height: 50,),
            ],
          ),
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
