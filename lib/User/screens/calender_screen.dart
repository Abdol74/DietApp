import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:daily_tracker_diet_app/User/models/bottom_navigation_bar.dart';

class calenderScreen extends StatefulWidget {
  static const String id = 'calender_screen';
  final double numberOfCalories;
  calenderScreen({this.numberOfCalories});
  @override
  _calenderScreenState createState() => _calenderScreenState();
}

class _calenderScreenState extends State<calenderScreen> {
  CalendarController _controller1 = CalendarController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
            Image.asset(
              'images/calendar-grid-61.png',
              width: 30.0,
              height: 30.0,
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
      body: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(
            top: 0.0,
          )),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Container(
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
                  padding: const EdgeInsets.only(
                      top: 25, bottom: 25, left: 20, right: 20),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Workout',
                              style: TextStyle(
                                  color: Color(0xFF09B44D),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              '00',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0),
                            )
                          ],
                        ),
                      ),
                      VerticalDivider(
                        thickness: 1.0,
                        width: 2.0,
                        color: Colors.grey.shade400,
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Time(min)',
                              style: TextStyle(
                                  color: Color(0xFF09B44D),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              '00.00',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0),
                            ),
                          ],
                        ),
                      ),
                      VerticalDivider(
                        thickness: 1.0,
                        width: 2.0,
                        color: Colors.grey.shade400,
                      ),
                      Expanded(
                          child: Column(children: <Widget>[
                        Text(
                          '${widget.numberOfCalories}',
                          style: TextStyle(
                              color: Color(0xFF09B44D),
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '00',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0),
                        ),
                      ])),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                child: Container(
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
                  child: TableCalendar(
                    initialCalendarFormat: CalendarFormat.twoWeeks,
                    headerStyle: HeaderStyle(
                      titleTextStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    calendarStyle: CalendarStyle(
                      unavailableStyle: TextStyle(
                        color: Color(0xFF09B44D),
                      ),
                      selectedColor: Color(0xFF09B44D),
                      todayColor: Color(0xFF09B44D),
                    ),
                    calendarController: _controller1,
                  ),
                ),
              )),
          bottomNavigationBar(
            backgroundcolor: Color(0xFF09B44D),
            selecteditemcolor: Colors.white,
            unselecteditemColor: Colors.white.withOpacity(.60),
          ),
        ],
      ),
    );
  }
}
