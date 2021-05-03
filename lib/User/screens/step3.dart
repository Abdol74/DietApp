
import 'step4.dart';
import 'welcome_screen.dart';
import 'package:flutter/material.dart';



class StepThree extends StatelessWidget {
  static String id = 'StepThree ';
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
                child:
                GestureDetector(
                  onTap: (){
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
                  "Step 3 of 4",
                  style: TextStyle(color: Colors.green, fontSize: 20),
                ),
              ),

            ],
          ),
        ),
        body:
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/croppedbackground2.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[

              Container(

                child: Center(
                  child: Text(
                    "Body Shape",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                        fontSize: 30),
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text("Busts size",
                              style: TextStyle(fontSize: 20 , color: Colors.grey[700] , fontWeight: FontWeight.bold),
                            ),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.only(left: 170),
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "0.0",
                                      hintStyle: TextStyle(fontSize: 20 , color: Colors.green)

                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text("Waist size",
                              style: TextStyle(fontSize: 20 , color: Colors.grey[700],fontWeight: FontWeight.bold),
                            ),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.only(left: 170),
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "0.0",
                                      hintStyle: TextStyle(fontSize: 20 , color: Colors.green)

                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text("Hips size",
                              style: TextStyle(fontSize: 20 , color: Colors.grey[700],fontWeight: FontWeight.bold),
                            ),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.only(left: 180),
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "0.0",
                                      hintStyle: TextStyle(fontSize: 20 , color: Colors.green)

                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),

              Expanded(
                flex: 3,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Image(
                        width: 370,
                        height: 210,
                        image: AssetImage(
                          'assets/images/step3.png',
                        ),
                      ),
                    )
                  ],
                ),

              ),
              Container(
                margin: EdgeInsets.only(bottom: 170),
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
                    onTap: (){
                      Navigator.pushNamed(context, StepFour.id);
                    },
                    child: Text(
                      "Next",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
