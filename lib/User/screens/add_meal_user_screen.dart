import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:math' as math;

class AddMealUser extends StatefulWidget {
  static String id = 'AddMealUser';
  @override
  _AddMealUserState createState() => _AddMealUserState();
}

class _AddMealUserState extends State<AddMealUser> {
  final CollectionReference _collectionReference =
      Firestore.instance.collection("MealComponentsTemp");
  final mealNameController = TextEditingController();
  final caloriesController = TextEditingController();
  final proteinController = TextEditingController();
  final carbController = TextEditingController();
  final fatsController = TextEditingController();
  final descController = TextEditingController();
  var category;
  String filePath;
  File file;
  String mediaUrl;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      var imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        filePath = imageFile.path.split('/')[6];
        file = imageFile;
      });
    }

    Future uploadImage(imageFile) async {
      final StorageReference storageReference =
          FirebaseStorage.instance.ref().child(filePath);
      StorageUploadTask storageUploadTask = storageReference.putFile(file);
      StorageTaskSnapshot snapshot = await storageUploadTask.onComplete;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      setState(() {
        mediaUrl = downloadUrl;
      });
    }

    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: new Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/am1.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: new ListView(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
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
                            width: 30,
                          ),
                          Text(
                            "Add Meal",
                            style: TextStyle(
                                color: Color(0xFF09C04F),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 180,
                          ),
                          Icon(
                            Icons.notifications,
                            color: Color(0xFF09C04F),
                            size: 30.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: new Stack(
                    fit: StackFit.loose,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            child: new Container(
                              width: 140.0,
                              height: 140.0,
                              child: (file != null)
                                  ? Image(image: FileImage(file))
                                  : Image(
                                      image: AssetImage(
                                          "assets/images/person.png")),
                            ),
                            onTap: () {
                              getImage();
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 100, right: 120),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 25.0,
                              child: new Icon(
                                Icons.camera_alt,
                                color: Color(0xFF09C04F),
                                size: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //kda klsna el md5lat
                SizedBox(
                  height: 30,
                ),
                MealDetails(
                  hintName: 'Meal Name',
                  textEditingController: mealNameController,
                  type: TextInputType.text,
                ),

                SizedBox(
                  height: 20,
                ),
                MealDetails(
                  hintName: 'Calories',
                  textEditingController: caloriesController,
                ),

                SizedBox(
                  height: 30,
                ),
                MealDetails(
                  hintName: 'Protein',
                  textEditingController: proteinController,
                ),
                SizedBox(
                  height: 30,
                ),
                MealDetails(
                  hintName: 'Carb',
                  textEditingController: carbController,
                ),
                SizedBox(
                  height: 30,
                ),

                MealDetails(
                  hintName: 'Fats',
                  textEditingController: fatsController,
                ),
                SizedBox(
                  height: 30,
                ),

                SizedBox(
                  height: 30,
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30.0),
                  height: 200,
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
                    padding: EdgeInsets.only(left: 30),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter details';
                        }
                        return null;
                      },
                      controller: descController,
                      maxLines: 8,
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Description",
                        hintStyle: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance
                      .collection("MealCategories")
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) return Container();

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 20.0),
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
                        child: Row(children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 40.0),
                            child: Text(
                              "Choose category Meal",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Center(
                            child: DropdownButton(
                              icon: Icon(
                                Icons.add,
                                color: Colors.teal,
                              ),
                              value: category,
                              isExpanded: false,
                              items: snapshot.data.documents.map((value) {
                                return DropdownMenuItem(
                                  value: value.documentID,
                                  child: Text('${value.data['categoryName']}'),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  category = value;
                                });
                              },
                            ),
                          ),
                        ]),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 30,
                ),

                Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 70),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xFF09C04F),
                  ),
                  child: Center(
                    child: FlatButton(
                      child: Text(
                        "Add Meal",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          await uploadImage(file);
                          await _collectionReference.add({
                            'mealName': mealNameController.text,
                            'caloriesNumber': carbController.text,
                            'carb': carbController.text,
                            'fats': fatsController.text,
                            'protein': proteinController.text,
                            'mealCategoryId': category,
                            'image': mediaUrl,
                            'description': descController.text
                          });
                        }
                      },
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

class MealDetails extends StatelessWidget {
  final String hintName;
  final TextEditingController textEditingController;
  final TextInputType type;

  MealDetails({this.hintName, this.textEditingController, this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0),
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[400],
              blurRadius: 20,
            )
          ]),
      child: Padding(
        padding: EdgeInsets.only(left: 30),
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter some text';
            }
            return null;
          },
          keyboardType: type,
          controller: textEditingController,
          maxLines: 1,
          cursorColor: Colors.green,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintName,
            hintStyle: TextStyle(color: Colors.grey[600]),
          ),
        ),
      ),
    );
  }
}
