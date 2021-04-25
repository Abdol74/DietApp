import 'add_meal_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:daily_tracker_diet_app/Admin/screens/view_user.dart';

class Profile extends StatelessWidget {
  static const String id = 'AdminHome';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.green),
        title: Text(
          "Home",
          style: TextStyle(
              color: Color(0xFF09C04F),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Container(
        width: 250,
        height: 500,
        child: Drawer(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                color: Colors.grey[200],
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.only(top: 30),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/images/logo.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, view_user.id);
                },
                leading: Icon(
                  Icons.account_box,
                  size: 30,
                  color: Color(0xFF09C04F),
                ),
                title: Text(
                  "View Users",
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AddMeal.id);
                  },
                  child: Icon(
                    Icons.add,
                    size: 30,
                    color: Color(0xFF09C04F),
                  ),
                ),
                title: Text(
                  "Add Meal",
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFF09C04F),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Logout",
                    style: TextStyle(
                        color: Colors.grey[100],
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: new Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/am1.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: new ListView(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: 50,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Colors.teal.shade50,
                boxShadow: kElevationToShadow[6],
              ),
              child: TextField(
                cursorColor: Color(0xFF09C04F),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 13, left: 20),
                  hintText: "search Meal",
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 20,
                  ),
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.search,
                    color: Colors.grey[400],
                    size: 30,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            //////////////////////////////////////////////////////////////////////////////////////////////////////////
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 90,
                      height: 100,
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: new DecorationImage(
                          image: AssetImage("assets/images/a4.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        Text(
                          "Grilled steak",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "1 person per plate",
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Container(
                      width: 80,
                      height: 80,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 40, left: 12),
                        child: Text(
                          "Calories",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 250,
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: new BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.grey,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 26, left: 5),
                        child: Text(
                          "protein",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: new BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.grey,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 25, left: 08),
                        child: Text(
                          "Carp",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: new BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.grey,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 25, left: 08),
                        child: Text(
                          "Fat",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: SizedBox(
                width: 10,
                child: Divider(
                  color: Colors.black12,
                  thickness: 5.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
