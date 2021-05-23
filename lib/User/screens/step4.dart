// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:daily_tracker_diet_app/User/screens/calender_screen.dart';
// import 'package:daily_tracker_diet_app/User/screens/step2.dart';
//
// import 'register.dart';
// import 'welcome_screen.dart';
// import 'package:flutter/material.dart';
//
// class StepFour extends StatelessWidget {
//   static String id = 'StepFour';
//   final String currentClientId;
//   final String clientName;
//   StepFour({this.currentClientId, this.clientName});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           title: Row(
//             children: [
//               Container(
//                 padding: EdgeInsets.only(right: 100),
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.pushNamed(context, WelcomeScreen.id);
//                   },
//                   child: Image.asset(
//                     "assets/images/icons/arrow.png",
//                     height: 55,
//                     width: 20,
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.only(right: 20),
//                 child: Text(
//                   "Step 4 of 4",
//                   style: TextStyle(color: Colors.green, fontSize: 20),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         body: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('assets/images/croppedbackground2.png'),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: StreamBuilder(
//             stream: Firestore.instance.collection('Goals').snapshots(),
//             builder:
//                 (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//               if (!snapshot.hasData) {
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//               return ListView.builder(
//                 itemCount:
//                     snapshot.hasData ? snapshot.data.documents.length : 0,
//                 itemBuilder: (context, index) {
//                   return RaisedButton(
//                     child: Container(
//                       margin: EdgeInsets.only(bottom: 10),
//                       height: 50,
//                       width: 250,
//                       decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(
//                               color: Color.fromRGBO(128, 128, 128, 1),
//                               blurRadius: 30.0,
//                               offset: Offset(0, 20)),
//                         ],
//                         borderRadius: BorderRadius.circular(70),
//                         gradient: LinearGradient(colors: [
//                           Color.fromRGBO(255, 255, 255, 1),
//                           Color.fromRGBO(255, 250, 250, 2)
//                         ]),
//                       ),
//                       child: Center(
//                         child: Text(
//                           snapshot.data.documents[index].data['goalName'],
//                           style: TextStyle(
//                               color: Colors.green, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                     onPressed: () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) {
//                         return StepTwo(
//                           currentClientId: currentClientId,
//                           clientName: clientName,
//                         );
//                       }));
//                     },
//                   );
//                 },
//               );
//             },
//           ),
//           // Container(
//           //   child: Center(
//           //     child: Text(
//           //       "Your Goal is",
//           //       style: TextStyle(
//           //           fontWeight: FontWeight.bold,
//           //           color: Colors.grey[700],
//           //           fontSize: 35),
//           //     ),
//           //   ),
//           // ),
//           // Container(
//           //       margin: EdgeInsets.only(bottom: 30),
//           //       height: 50,
//           //       width: 250,
//           //       decoration: BoxDecoration(
//           //         boxShadow: [
//           //           BoxShadow(
//           //               color: Color.fromRGBO(128, 128, 128, 1),
//           //               blurRadius: 30.0,
//           //               offset: Offset(0, 20)),
//           //         ],
//           //         borderRadius: BorderRadius.circular(70),
//           //         gradient: LinearGradient(colors: [
//           //           Color.fromRGBO(9, 180, 78, 1),
//           //           Color.fromRGBO(9, 180, 78, 1)
//           //         ]),
//           //       ),
//           //       child: Center(
//           //         child: GestureDetector(
//           //           onTap: () {
//           //             Navigator.pushNamed(context, calenderScreen.id);
//           //           },
//           //           child: Text(
//           //             "Next",
//           //             style: TextStyle(
//           //                 color: Colors.white, fontWeight: FontWeight.bold),
//           //           ),
//           //         ),
//           //       ),
//           //     ),
//         ),
//       ),
//     );
//   }
// }
