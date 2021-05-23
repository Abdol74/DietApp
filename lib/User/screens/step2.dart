import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_tracker_diet_app/User/models/clients_model.dart';
import 'package:daily_tracker_diet_app/User/screens/calender_screen.dart';
import 'package:flutter/material.dart';
import 'package:daily_tracker_diet_app/User/helpers/calories_brain.dart';

enum Gender { male, female }
String activityLevelValue;
String goalValue;
Gender selectedGender;

class StepTwo extends StatefulWidget {
  static String id = 'StepTwoState';
  final String currentClientId;
  final String clientName;

  StepTwo({this.currentClientId, this.clientName});
  @override
  _StepTwoState createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwo> {
  DateTime _datetime;
  static String id = 'StepTwoState';

  double height = 170;
  double weight = 60;
  double age = 20;
  double numberOfCalories;

  Color inActiveColor = Colors.grey[200];
  Color activeColor = Colors.lightGreenAccent;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final blockVertical = mediaQuery.size.height / 100;
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Container(
                padding: EdgeInsets.only(right: 100),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.pushNamed(context, WelcomeScreen.id);
                  },
                  child: Image.asset(
                    "assets/images/icons/background.png",
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
              image: AssetImage('assets/images/croppedbackground2.png'),
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
                                      _datetime == null
                                          ? '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}'
                                          : '${_datetime.day}/${_datetime.month}/${_datetime.year}',
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
                                      setState(() {
                                        height = double.parse(value);
                                      });
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
                                      setState(() {
                                        weight = double.parse(value);
                                      });
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
                                "age",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 140),
                                  child: TextField(
                                    onChanged: (value) {
                                      age = double.parse(value);
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
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 6),
                                child: Material(
                                  color: selectedGender == Gender.male
                                      ? activeColor
                                      : inActiveColor,
                                  elevation: 4.0,
                                  borderRadius: BorderRadius.circular(12.0),
                                  shadowColor: Colors.grey,
                                  child: InkWell(
                                    splashColor: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(16.0),
                                    child: Container(
                                      height: blockVertical * 5.5,
                                      child: Center(
                                          child: Text(
                                        "Male",
                                      )),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        selectedGender = Gender.male;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 4),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 6),
                                child: Material(
                                  color: selectedGender == Gender.female
                                      ? activeColor
                                      : inActiveColor,
                                  elevation: 4.0,
                                  borderRadius: BorderRadius.circular(12.0),
                                  shadowColor: Colors.grey,
                                  child: InkWell(
                                    splashColor: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(16.0),
                                    child: Container(
                                      height: blockVertical * 5.5,
                                      child: Center(
                                          child: Text(
                                        "Female",
                                      )),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        selectedGender = Gender.female;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              child: StreamBuilder<QuerySnapshot>(
                                stream: Firestore.instance
                                    .collection('ActivityLevel')
                                    .snapshots(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (!snapshot.hasData) return Container();

                                  return Container(
                                    margin: EdgeInsets.symmetric(vertical: 40),
                                    height: 35,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey[400],
                                            blurRadius: 20,
                                          )
                                        ]),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: Text(
                                            "Choose Activity",
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: DropdownButton(
                                            elevation: 16,
                                            style: TextStyle(
                                                color: Colors.grey[800],
                                                fontSize: 20.0),
                                            dropdownColor: Colors.grey[200],
                                            icon: Icon(
                                              Icons.add,
                                              color: Color(0xFF09C04F),
                                              size: 30,
                                            ),
                                            value: activityLevelValue,
                                            isExpanded: false,
                                            items: snapshot.data.documents
                                                .map((value) {
                                              return DropdownMenuItem(
                                                value: value.data['levelName'],
                                                child: Text(
                                                    '${value.data['levelName']}'),
                                              );
                                            }).toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                activityLevelValue = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Container(
                              child: StreamBuilder<QuerySnapshot>(
                                stream: Firestore.instance
                                    .collection('Goals')
                                    .snapshots(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (!snapshot.hasData) return Container();

                                  return Container(
                                    margin: EdgeInsets.symmetric(vertical: 40),
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey[400],
                                            blurRadius: 20,
                                          )
                                        ]),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: Text(
                                            "Choose Activity",
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: DropdownButton(
                                            elevation: 16,
                                            style: TextStyle(
                                                color: Colors.grey[800],
                                                fontSize: 20.0),
                                            dropdownColor: Colors.grey[200],
                                            icon: Icon(
                                              Icons.add,
                                              color: Color(0xFF09C04F),
                                              size: 30,
                                            ),
                                            value: goalValue,
                                            isExpanded: false,
                                            items: snapshot.data.documents
                                                .map((value) {
                                              return DropdownMenuItem(
                                                value: value.data['goalName'],
                                                child: Text(
                                                    '${value.data['goalName']}'),
                                              );
                                            }).toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                goalValue = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            // Container(
                            //   margin: EdgeInsets.only(top: 2.5),
                            //   height: 30,
                            //   width: 250,
                            //   decoration: BoxDecoration(
                            //     boxShadow: [
                            //       BoxShadow(
                            //           color: Color.fromRGBO(128, 128, 128, 1),
                            //           blurRadius: 30.0,
                            //           offset: Offset(0, 20)),
                            //     ],
                            //     borderRadius: BorderRadius.circular(70),
                            //     gradient: LinearGradient(colors: [
                            //       Color.fromRGBO(9, 180, 78, 1),
                            //       Color.fromRGBO(9, 180, 78, 1),
                            //     ]),
                            //   ),
                            //   child: Center(
                            //     child: GestureDetector(
                            //       onTap: () {
                            //         // Navigator.pushNamed(context, StepThree.id);
                            //
                            //
                            //       },
                            //       child: Text(
                            //         "Next",
                            //         style: TextStyle(
                            //             color: Colors.white,
                            //             fontWeight: FontWeight.bold),
                            //       ),
                            //     ),
                            //   ),
                            // ),

                            FloatingActionButton(onPressed: () async {
                              CalculatorBrain calc = CalculatorBrain(
                                  age: age,
                                  height: height,
                                  weight: weight,
                                  activityLevelValue: activityLevelValue,
                                  goalValue: goalValue,
                                  selectedGender: selectedGender);
                              numberOfCalories = calc.totalCalories();

                              await Firestore.instance
                                  .collection('Clients')
                                  .add({
                                'clientId': widget.currentClientId,
                                'clientName': widget.clientName,
                                'caloriesRequired': numberOfCalories,
                                'height': height,
                                'weight': weight,
                                'age': age,
                                'activityLevelValue': activityLevelValue,
                                'goalName': goalValue,
                                'birthday': _datetime,
                              });

                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return calenderScreen(
                                  numberOfCalories: numberOfCalories,
                                );
                              }));

                              // await saveClientData(_currentClient,
                              //     widget.currentClientId, numberOfCalories);

                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => StepThree(
                              //       totalCalories: calc.totalCalories(),
                              //       carbs: calc.carb(),
                              //       protein: calc.protein(),
                              //       fats: calc.fat(),
                              //       bmi: calc.bmi(),
                              //       tdee: calc.tdee(),
                              //     ),
                              //   ),
                              // );
                            }),
                          ],
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

class MyContainerTile extends StatelessWidget {
  const MyContainerTile({this.child, this.height});

  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(1, 3),
            blurRadius: 4.0,
          ),
        ],
      ),
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: child,
    );
  }
}
