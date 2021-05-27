import 'package:daily_tracker_diet_app/User/helpers/workout_heart_brain.dart';
import 'package:daily_tracker_diet_app/User/screens/step2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

double distance;
double timeMin;
double timeSec;
double heartRate;

class workout_heart extends StatefulWidget {
  final String diseaseValue;
  final double age;
  final double weight;
  final Gender gender;
  workout_heart({this.diseaseValue, this.age, this.weight, this.gender});
  @override
  _workout_heartState createState() => _workout_heartState();
}

class _workout_heartState extends State<workout_heart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: new Container(
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
            Padding(
                padding: EdgeInsets.only(left: 40.0, right: 80, top: 20.0),
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      "Heart Rate",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    new Flexible(
                      child: new TextField(
                        decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.green)),
                          hintText: "0.0",
                        ),
                        onChanged: (value) {
                          setState(() {
                            heartRate = double.parse(value);
                          });
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(left: 40.0, right: 80, top: 20.0),
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      "Distance",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    new Flexible(
                      child: new TextField(
                        decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.green)),
                          hintText: "0.0",
                        ),
                        onChanged: (value) {
                          setState(() {
                            distance = double.parse(value);
                          });
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                )),
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
                      child: new TextField(
                        decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.green)),
                          hintText: "0",
                        ),
                        onChanged: (value) {
                          setState(() {
                            timeMin = double.parse(value);
                          });
                        },
                        keyboardType: TextInputType.number,
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
                        decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                              borderSide:
                                  new BorderSide(color: Colors.greenAccent)),
                          hintText: "0",
                        ),
                        onChanged: (value) {
                          setState(() {
                            timeSec = double.parse(value);
                          });
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 130),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF09C04F),
              ),
              child: Center(
                child: RaisedButton(
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                        color: Colors.grey[200],
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                  onPressed: () {
                    WorkoutHeartDisease workoutCalories = WorkoutHeartDisease(
                        age: widget.age,
                        weight: widget.weight,
                        gender: widget.gender,
                        distance: distance,
                        time: timeMin,
                        heartRate: heartRate);
                    print(widget.weight);
                    print(widget.gender);
                    print(timeMin);
                    print(widget.age);
                    print(heartRate);
                    double calculatedCaloirs = workoutCalories.caloriesBurned();
                    print(calculatedCaloirs.round());
                  },
                ),
              ),
            ),
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
