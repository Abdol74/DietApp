import 'package:daily_tracker_diet_app/User/helpers/workout_disease_noun_brain.dart';
import 'package:daily_tracker_diet_app/User/screens/step2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
                    margin: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
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
                      child: new TextFormField(
                        keyboardType: TextInputType.number,
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
                              borderSide: new BorderSide(color: Colors.green)),
                          hintText: "0",
                        ),
                        onChanged: (value) {
                          timeSec = double.parse(value);
                        },
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 80,
            ),

               Row(
                children:[
                  SizedBox(width: 150,),
                  RaisedButton(
                  color:  Color(0xFF09C04F),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(8.0),
                  ),
                  child: Text("Calculate", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),),
                  onPressed: () {
                   // if (_formKey.currentState.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                     // ScaffoldMessenger.of(context).showSnackBar(
                       //   SnackBar(content: Text('Processing Data')));
                    //}
                    WorkoutDiseaseBrain wDiseaseBrain = WorkoutDiseaseBrain(
                        runningType: selectedRunning,
                        weight: widget.weight,
                        duration: timeMin);
                    double calories = wDiseaseBrain.caloriesBurned();
                    print(calories.round());
                  },
                ),
                        ],
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
