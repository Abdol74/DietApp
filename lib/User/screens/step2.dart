import 'package:daily_tracker_diet_app/User/screens/step3.dart';
import 'package:daily_tracker_diet_app/User/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class StepTwo extends StatefulWidget {
  static String id = 'StepTwoState';
  @override
  _StepTwoState createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwo> {
  DateTime birthdate;
  String height, weight, goalWieght;
  bool gender;

  DateTime _datetime;
  static String id = 'StepTwoState';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Container(
                padding: EdgeInsets.only(right: 100),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, WelcomeScreen.id);
                  },
                  child: Image.asset(
                    "assets/images/icons/arrow.png",
                    height: 55,
                    width: 20,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  "Step 2 of 4",
                  style: TextStyle(color: Colors.green, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/croppedbackground.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Center(
                      child: Text(
                        "Personal Details ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                            fontSize: 40),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 200),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Birthday",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 150),
                                  child: RaisedButton(
                                    child: Text(
                                      "X/XX/XXXX",
                                      style: TextStyle(color: Colors.green),
                                    ),
                                    color: Colors.white,
                                    onPressed: () {
                                      showDatePicker(
                                              context: context,
                                              initialDate: _datetime == null
                                                  ? DateTime.now()
                                                  : _datetime,
                                              firstDate: DateTime(1996),
                                              lastDate: DateTime(2025))
                                          .then((date) {
                                        setState(() {
                                          _datetime = date;
                                        });
                                      });
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Height",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 185),
                                  child: TextField(
                                    onChanged: (value) {
                                      height = value;
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "0.0cm",
                                        hintStyle: TextStyle(
                                            fontSize: 20, color: Colors.green)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Weight",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 185),
                                  child: TextField(
                                    onChanged: (value) {
                                      height = value;
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "0.0kg",
                                        hintStyle: TextStyle(
                                            fontSize: 20, color: Colors.green)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Goal Weight",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 140),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "0.0kg",
                                        hintStyle: TextStyle(
                                            fontSize: 20, color: Colors.green)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Gender",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold),
                              ),
                              Flexible(
                                child: Padding(
                                    padding: EdgeInsets.only(left: 140),
                                    child: ToggleSwitch(
                                      labels: ["Male", "Female"],
                                      fontSize: 12,
                                      minWidth: 60,
                                      minHeight: 40,
                                      activeBgColors: [
                                        Colors.green,
                                        Colors.green,
                                      ],
                                      activeBgColor: Colors.white,
                                      inactiveBgColor: Colors.white,
                                    )),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          height: 50,
                          width: 250,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(128, 128, 128, 1),
                                  blurRadius: 30.0,
                                  offset: Offset(0, 20)),
                            ],
                            borderRadius: BorderRadius.circular(70),
                            gradient: LinearGradient(colors: [
                              Color.fromRGBO(9, 180, 78, 1),
                              Color.fromRGBO(9, 180, 78, 1),
                            ]),
                          ),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, StepThree.id);
                              },
                              child: Text(
                                "Next",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//border: Border(
//bottom: BorderSide(color: Colors.grey[100]),)
