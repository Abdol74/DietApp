import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:daily_tracker_diet_app/User/screens/workout_disease.dart';
import 'package:daily_tracker_diet_app/User/screens/workout_heart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:daily_tracker_diet_app/User/helpers/calories_brain.dart';

enum Gender { male, female }
String activityLevelValue;
String diseaseValue;
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
  Color activeColor = Color(0xFF09C04F);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final blockVertical = mediaQuery.size.height / 100;
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        body: ListView(
          children: <Widget>[
            Container(
              height: 400,
              width: 700,
              color: Color(0xFF09C04F),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
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
                          width: 105,
                        ),
                        Text(
                          "STEP 2 of 2",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          "Birthday",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
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
                                  setState(
                                    () {
                                      _datetime = date;
                                    },
                                  );
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
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          "Height",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(left: 190),
                            child: TextField(
                              cursorColor: Colors.white,
                              cursorWidth: 4,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  height = double.parse(value);
                                });
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "0.0cm",
                                  hintStyle: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          "Weight",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(left: 185),
                            child: TextField(
                              cursorColor: Colors.green,
                              keyboardType: TextInputType.number,
                              cursorWidth: 4,
                              onChanged: (value) {
                                setState(() {
                                  weight = double.parse(value);
                                });
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "0.0kg",
                                  hintStyle: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          "age",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(left: 215),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              cursorColor: Colors.white,
                              cursorWidth: 4,
                              onChanged: (value) {
                                age = double.parse(value);
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "0.0 year",
                                  hintStyle: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  /////////////////////////////
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 12, horizontal: 6),
                          child: Material(
                            color: selectedGender == Gender.male
                                ? activeColor
                                : inActiveColor,
                            elevation: 4.0,
                            borderRadius: BorderRadius.circular(12.0),
                            shadowColor: Colors.green,
                            child: InkWell(
                              splashColor: Color(0xFF09C04F),
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
                          margin:
                              EdgeInsets.symmetric(vertical: 12, horizontal: 6),
                          child: Material(
                            color: selectedGender == Gender.female
                                ? activeColor
                                : inActiveColor,
                            elevation: 4.0,
                            borderRadius: BorderRadius.circular(12.0),
                            shadowColor: Colors.grey,
                            child: InkWell(
                              splashColor: Color(0xFF09C04F),
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
                ],
              ),
            ),
            ///////////////////////////////////////
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/back1.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: <Widget>[
                      Column(
                        children: [
                          Text(
                            "Your Goal is",
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.bold),
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
                                  margin: EdgeInsets.symmetric(horizontal: 0),
                                  height: 50,
                                  width: 250,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 2),
                                        child: DropdownButton(
                                          hint: Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              "Add GOAL",
                                              style: TextStyle(
                                                  color: Colors.green),
                                            ),
                                          ),
                                          elevation: 10,
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold),
                                          dropdownColor: Colors.grey[200],
                                          icon: Icon(
                                            Icons.add,
                                            color: Colors.black,
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
                        ],
                      ),
                      Container(
                        height: 200,
                        width: 130,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/goal.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ///////////////////
            Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 20,
              color: Colors.green,
            ),
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/back1.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: <Widget>[
                      Column(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Do you suffer from any disease ?",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            child: StreamBuilder<QuerySnapshot>(
                              stream: Firestore.instance
                                  .collection('Diseases')
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (!snapshot.hasData) return Container();

                                return Container(
                                  margin: EdgeInsets.symmetric(vertical: 40),
                                  height: 35,
                                  width: 200,
                                  child: Row(
                                    children: <Widget>[
                                      DropdownButton(
                                        hint: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            "select Disease",
                                            style:
                                                TextStyle(color: Colors.green),
                                          ),
                                        ),
                                        elevation: 16,
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                        dropdownColor: Colors.grey[200],
                                        icon: Icon(
                                          Icons.add,
                                          color: Colors.black,
                                          size: 30,
                                        ),
                                        value: diseaseValue,
                                        isExpanded: false,
                                        items: snapshot.data.documents
                                            .map((value) {
                                          return DropdownMenuItem(
                                            value: value.data['diseaseType'],
                                            child: Text(
                                                '${value.data['diseaseType']}'),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            diseaseValue = value;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 200,
                        width: 160,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/mrd.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            /////////////////////////////
            Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 20,
              color: Colors.green,
            ),
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/back1.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: <Widget>[
                      Column(
                        children: [
                          Text(
                            "Activity level is",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            child: StreamBuilder<QuerySnapshot>(
                              stream: Firestore.instance
                                  .collection('ActivityLevel')
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (!snapshot.hasData) return Container();

                                return Container(
                                  margin: EdgeInsets.symmetric(vertical: 20),
                                  height: 35,
                                  width: 200,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 3.0),
                                      ),
                                      DropdownButton(
                                        hint: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            "choose level",
                                            style:
                                                TextStyle(color: Colors.green),
                                          ),
                                        ),
                                        elevation: 0,
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                        dropdownColor: Colors.grey[200],
                                        icon: Icon(
                                          Icons.add,
                                          color: Colors.black,
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
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 200,
                        width: 140,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/activity.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton(
                child: Text('START'),
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF09C04F),
                    padding: EdgeInsets.all(20),
                    textStyle:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                onPressed: () async {
                  CalculatorBrain calc = CalculatorBrain(
                      age: age,
                      height: height,
                      weight: weight,
                      activityLevelValue: activityLevelValue,
                      goalValue: goalValue,
                      selectedGender: selectedGender);
                  numberOfCalories = calc.totalCalories();

                  await Firestore.instance.collection('Clients').add({
                    'clientId': widget.currentClientId,
                    'clientName': widget.clientName,
                    'caloriesRequired': numberOfCalories,
                    'height': height,
                    'weight': weight,
                    'age': age,
                    'activityLevelValue': activityLevelValue,
                    'goalName': goalValue,
                    'birthday': _datetime,
                    'diseaseStatus': diseaseValue
                  });

                  if (diseaseValue == 'Heart Disease') {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return workout_heart(
                        age: age,
                        gender: selectedGender,
                        weight: weight,
                        diseaseValue: diseaseValue,
                      );
                    }));
                  }
                  if (diseaseValue == 'Diabetes' ||
                      diseaseValue == 'Hypertension' ||
                      diseaseValue == 'None') {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return WorkoutDisease(
                        diseaseValue: diseaseValue,
                        weight: weight,
                        age: age,
                      );
                    }));
                  }
                }),
          ],
        ),
      ),
    );
  }
}

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
      padding: EdgeInsets.all(2),
      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 1),
      child: child,
    );
  }
}
