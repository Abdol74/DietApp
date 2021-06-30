import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class category extends StatelessWidget{
  static String id = 'category';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: new Container(
        child: new ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 50,
              width: 20,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25)),
                  boxShadow: [BoxShadow(
                    color: Colors.grey[400],
                    blurRadius: 20,
                  )]
              ),
              child: Column(
                children:<Widget> [
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 20,top: 50)),
                      Icon(
                        Icons.list_sharp,
                        color:Color(0xFF09C04F),
                        size: 40,
                      ),
                      SizedBox(width: 20,),
                      Text("Categories",style: TextStyle(color: Color(0xFF09C04F),fontSize: 25,
                          fontWeight: FontWeight.bold),),
                      SizedBox(width: 140,),
                      Icon(
                        Icons.arrow_forward,
                        color:Color(0xFF09C04F),
                        size: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 20)),
                Column(
                  children:<Widget>[
                    Text("Nutrition",style: TextStyle(color: Colors.grey[600],fontSize: 50,
                        fontWeight: FontWeight.bold),),
                    Text("eat more fruits & vegtables",style: TextStyle(color: Color(0xFF09C04F),fontSize:15,
                        fontWeight: FontWeight.bold),),
                    Text("eat smaller portions",style: TextStyle(color: Color(0xFF09C04F),fontSize:15,
                        fontWeight: FontWeight.bold),),
                  ],
                ),
                Image(
                  image:AssetImage("assets/images/c8.png"),
                  width: 150,
                  height: 130,
                ),
              ],
            ),
            SizedBox(height:20,),
            Row(
              children:<Widget> [
                Container(
                    margin: EdgeInsets.only(left: 35),
                    height: 120,
                    width: 150,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Color(0xFF61D27C),
                      boxShadow:kElevationToShadow[6],
                    ),
                    child:    IconButton(
                      icon: Image.asset('assets/images/c1.png',
                      ),
                      onPressed: () {},
                    )
                ),
                Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 120,
                    width: 150,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Color(0xFF61D27C),
                      boxShadow:kElevationToShadow[6],
                    ),
                    child:    IconButton(
                      icon: Image.asset('assets/images/c2.png',
                      ),
                      onPressed: () {},
                    )
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children:<Widget> [
                Container(
                    margin: EdgeInsets.only(left: 35),
                    height: 120,
                    width: 150,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Color(0xFF61D27C),
                      boxShadow:kElevationToShadow[6],
                    ),
                    child:    IconButton(
                      icon: Image.asset('assets/images/c3.png',
                        width: 200,
                      ),
                      onPressed: () {},
                    )
                ),
                Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 120,
                    width: 150,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Color(0xFF61D27C),
                      boxShadow:kElevationToShadow[6],
                    ),
                    child:    IconButton(
                      icon: Image.asset('assets/images/c4.png',
                      ),
                      onPressed: () {},
                    )
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children:<Widget> [
                Container(
                    margin: EdgeInsets.only(left: 35),
                    height: 120,
                    width: 150,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Color(0xFF61D27C),
                      boxShadow:kElevationToShadow[6],
                    ),
                    child:    IconButton(
                      icon: Image.asset('assets/images/c5.png',
                      ),
                      onPressed: () {},
                    )
                ),
                Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 120,
                    width: 150,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Color(0xFF61D27C),
                      boxShadow:kElevationToShadow[6],
                    ),
                    child:    IconButton(
                      icon: Image.asset('assets/images/c6.png',
                      ),
                      onPressed: () {},
                    )
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children:<Widget> [
                Container(
                    margin: EdgeInsets.only(left: 35),
                    height: 120,
                    width: 150,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Color(0xFF61D27C),
                      boxShadow:kElevationToShadow[6],
                    ),
                    child:    IconButton(
                      icon: Image.asset('assets/images/c9.png',
                      ),
                      onPressed: () {},
                    )
                ),
                Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 120,
                    width: 150,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Color(0xFF61D27C),
                      boxShadow:kElevationToShadow[6],
                    ),
                    child:    IconButton(
                      icon: Image.asset('assets/images/c10.png',
                      ),
                      onPressed: () {},
                    )
                ),
                SizedBox(height: 10,),
              ],
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}