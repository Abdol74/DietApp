import 'package:flutter/material.dart';

class home_page extends StatelessWidget{
  static String id = 'home_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        child: new Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/green cover.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: new ListView(
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[600],
                        blurRadius: 40,
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
                          size: 35.0,
                        ),
                        SizedBox(
                          width: 90,
                        ),
                        Column(
                          children:<Widget> [
                            Container(
                              width: 100,
                              height: 80,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/logo.png'),
                                ),
                              ),
                            ),
                            Text(
                              "User Name",
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 90,
                        ),
                        Icon(
                          Icons.notifications,
                          color: Color(0xFF09C04F),
                          size: 35.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 70,),
              Row(
                children: [
                  SizedBox(width: 50,),
                  Container(
                    height: 110,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[800],
                            blurRadius: 40,
                          )
                        ]),
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Container(
                          width: 80,
                          height: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/h8.png'),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "Meal",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 60,),
                  Container(
                    height: 110,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[800],
                            blurRadius: 40,
                          )
                        ]),
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Container(
                          width: 80,
                          height: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/h7.png'),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "Workout",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  SizedBox(width: 50,),
                  Container(
                    height: 110,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[800],
                            blurRadius: 40,
                          )
                        ]),
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Container(
                          width: 80,
                          height: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/h6.png'),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "WEIGHT",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 60,),
                  Container(
                    height: 110,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[800],
                            blurRadius: 40,
                          )
                        ]),
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Container(
                          width: 80,
                          height: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/h5.png'),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "TIPS",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  SizedBox(width: 50,),
                  Container(
                    height: 110,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[800],
                            blurRadius: 40,
                          )
                        ]),

                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Container(
                          width: 80,
                          height: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/h1.png'),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "Charts",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 60,),
                  Container(
                    height: 110,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[800],
                            blurRadius: 40,
                          )
                        ]),
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Container(
                          width: 80,
                          height: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/h4.png'),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "Support",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  SizedBox(width: 50,),
                  Container(
                    height: 110,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[800],
                            blurRadius: 40,
                          )
                        ]),
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Container(
                          width: 80,
                          height: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/h3.png'),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "Home",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 60,),
                  Container(
                    height: 110,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[800],
                            blurRadius: 40,
                          )
                        ]),
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Container(
                          width: 80,
                          height: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/h2.png'),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "Update profile",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
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
