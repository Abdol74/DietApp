import 'dart:io';
import 'package:daily_tracker_diet_app/Admin/models/meal_components_model.dart';
import 'package:daily_tracker_diet_app/Admin/Provider/meal_provider.dart';
import 'package:daily_tracker_diet_app/Admin/screens/view_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:math' as math;
import 'package:daily_tracker_diet_app/Admin/helpers/meal_api.dart';
import 'package:provider/provider.dart';

class UpdateMeal extends StatefulWidget {
  final bool isUpdating;
  UpdateMeal({this.isUpdating});
  @override
  _UpdateMealState createState() => _UpdateMealState();
}

class _UpdateMealState extends State<UpdateMeal> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final CollectionReference _collectionReference =
      Firestore.instance.collection('MealComponents');
  var category;
  File _imageFile;
  String _imageUrl;
  MealComponentsModel _currentMeal;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MealProvider mealProvider =
        Provider.of<MealProvider>(context, listen: false);
    if (mealProvider.currentMeal != null) {
      _currentMeal = mealProvider.currentMeal;
    } else {
      _currentMeal = MealComponentsModel();
    }
    _imageUrl = _currentMeal.imageUrl;
    _currentMeal.measure = 100;
  }

  _showImage() {
    if (_imageFile == null && _imageUrl == null) {
      return Column(
        children:<Widget> [
        Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.grey[400], blurRadius: 20,)]
        ),
        child:Padding(
          padding:EdgeInsets.only(top: 10) ,
          child:  Text("Image placeholder",  style: TextStyle(
            color: Colors.green,
            fontSize: 18,
            fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        )
      ),
        ),
        ],
      );
    } else if (_imageFile != null) {
      print('showing image from local file');

      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Image.file(
            _imageFile,
            fit: BoxFit.cover,
            height: 150,
          ),
          FlatButton(
            padding: EdgeInsets.all(16),
            color: Colors.black54,
            child: Text(
              'Change Image',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w400),
            ),
            onPressed: () => _getLocalImage(),
          )
        ],
      );
    } else if (_imageUrl != null) {
      print('showing image from url');

      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Image.network(
            _imageUrl,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitHeight,
            height: 200,

          ),
          Container(
            height: 45,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFF09C04F),
            ),
            child: TextButton(
              onPressed: () => _getLocalImage(),
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      );
    }
  }

  Widget _buildMealNameField() {
    return Column(
      children:<Widget> [
        SizedBox(height: 40,),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child:TextFormField(
            cursorWidth: 4,
            cursorColor: Colors.green,
            decoration: InputDecoration(labelText: 'Name', labelStyle:TextStyle(color:Colors.black, fontSize: 20),
              fillColor: Colors.white.withOpacity(0.6),
              filled: true,
              border: new OutlineInputBorder(

                borderRadius: const BorderRadius.all(

                  const Radius.circular(8.0),
                ),
                borderSide: new BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
              ),
            ),
            initialValue: _currentMeal.mealName,
            keyboardType: TextInputType.text,
            style: TextStyle(fontSize: 15,color: Colors.green),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Name is required';
              }

              if (value.length < 3 || value.length > 20) {
                return '';
              }

              return null;
            },
            onSaved: (String value) {
              _currentMeal.mealName = value;
            },
          ),
        ),
      ],
    );
  }
  /////////////////////////////
  Widget _buildMealCaloriesField() {
    return Column(
      children:<Widget> [
        SizedBox(height: 10,),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child:TextFormField(
            cursorWidth: 4,
            cursorColor: Colors.green,
            decoration: InputDecoration(labelText: 'calories', labelStyle:TextStyle(color:Colors.black, fontSize: 20),
              fillColor: Colors.white.withOpacity(0.6),
              filled: true,
              border: new OutlineInputBorder(

                borderRadius: const BorderRadius.all(

                  const Radius.circular(8.0),
                ),
                borderSide: new BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
              ),
            ),
            initialValue: _currentMeal.caloriesNumber.toString(),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              WhitelistingTextInputFormatter.digitsOnly
            ],
            style: TextStyle(fontSize: 15,color: Colors.green),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Calories is required';
              }
              if (value.length < 3 || value.length > 20) {
                return '';
              }
              return null;
            },
            onSaved: (String value) {
              _currentMeal.caloriesNumber = int.parse(value);
            },
          ),
        ),
      ],
    );
  }
  //////////////////////////////
  Widget _buildMealProteinField() {
    return Column(
      children:<Widget> [
        SizedBox(height: 10,),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child:TextFormField(
            cursorWidth: 4,
            cursorColor: Colors.green,
            decoration: InputDecoration(labelText: 'protein', labelStyle:TextStyle(color:Colors.black, fontSize: 20),
              fillColor: Colors.white.withOpacity(0.6),
              filled: true,
              border: new OutlineInputBorder(

                borderRadius: const BorderRadius.all(

                  const Radius.circular(8.0),
                ),
                borderSide: new BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
              ),
            ),
            initialValue: _currentMeal.protein.toString(),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              WhitelistingTextInputFormatter.digitsOnly
            ],
            style: TextStyle(fontSize: 15,color: Colors.green),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Protein is required';
              }
              if (value.length < 3 || value.length > 20) {
                return '';
              }
              return null;
            },
            onSaved: (String value) {
              _currentMeal.protein = int.parse(value);
            },
          ),
        ),
      ],
    );
  }
  //////////////////////////////////////////
  Widget _buildMealFatsField() {
    return Column(
      children:<Widget> [
        SizedBox(height: 10,),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child:TextFormField(
            cursorWidth: 4,
            cursorColor: Colors.green,
            decoration: InputDecoration(labelText: 'Fats', labelStyle:TextStyle(color:Colors.black, fontSize: 20),
              fillColor: Colors.white.withOpacity(0.6),
              filled: true,
              border: new OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(8.0),
                ),
                borderSide: new BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
              ),
            ),
            initialValue: _currentMeal.fats.toString(),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              WhitelistingTextInputFormatter.digitsOnly
            ],
            style: TextStyle(fontSize: 15,color: Colors.green),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Fats is required';
              }
              if (value.length < 3 || value.length > 20) {
                return '';
              }
              return null;
            },
            onSaved: (String value) {
              _currentMeal.fats = int.parse(value);
            },
          ),
        ),
      ],
    );
  }
  ////////////////////////////////
  Widget _buildMealCarbField() {
    return Column(
      children:<Widget> [
        SizedBox(height: 10,),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child:TextFormField(
            cursorWidth: 4,
            cursorColor: Colors.green,
            decoration: InputDecoration(labelText: 'Carb', labelStyle:TextStyle(color:Colors.black, fontSize: 20),
              fillColor: Colors.white.withOpacity(0.6),
              filled: true,
              border: new OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(8.0),
                ),
                borderSide: new BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
              ),
            ),
            initialValue: _currentMeal.carb.toString(),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              WhitelistingTextInputFormatter.digitsOnly
            ],
            style: TextStyle(fontSize: 15,color: Colors.green),
            validator: (String value) {
              if (value.isEmpty) {
                return 'carb is required';
              }
              if (value.length < 3 || value.length > 20) {
                return '';
              }
              return null;
            },
            onSaved: (String value) {
              _currentMeal.carb = int.parse(value);
            },
          ),
        ),
      ],
    );
  }
  /////////////////////////////////
  _getLocalImage() async {
    File imageFile = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50, maxWidth: 400);

    if (imageFile != null) {
      setState(() {
        _imageFile = imageFile;
      });
    }
  }

  Widget  _buildDescriptionField() {
    return Column(
      children:<Widget> [
        SizedBox(height: 10,),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child:TextFormField(
            cursorWidth: 4,
            cursorColor: Colors.green,
            decoration: InputDecoration(labelText: 'Description', labelStyle:TextStyle(color:Colors.black, fontSize: 20),
              fillColor: Colors.white.withOpacity(0.6),
              filled: true,
              border: new OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(8.0),
                ),
                borderSide: new BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
              ),
            ),
            initialValue: _currentMeal.mealDescription,
            keyboardType: TextInputType.text,
            maxLines: 3,
            style: TextStyle(fontSize: 15,color: Colors.green),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Description is required';
              }
              if (value.length < 3 || value.length > 20) {
                return '';
              }
              return null;
            },
            onSaved: (String value) {
              _currentMeal.mealDescription = value;
            },
          ),
        ),
      ],
    );
  }

  _saveMeal() {
    print('saveFood Called');
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();

    print('form saved');

    uploadMealAndImage(_currentMeal, widget.isUpdating, _imageFile);

    print("name: ${_currentMeal.mealName}");
    print("category: ${_currentMeal.mealDescription}");
    print("_imageFile ${_imageFile.toString()}");
    print("_imageUrl $_imageUrl");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Color(0xFF09B44D)
        ),
        leading: Icon(Icons.arrow_back),
        title: const Text('welcome Admin',
            style: TextStyle(
              color: Color(0xFF09B44D),
            )),
        toolbarHeight: 60.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(40.0),
              bottomLeft: Radius.circular(40.0),
            )),
        backgroundColor: Colors.white,
      ),
      body:
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: new Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/images/am1.png'),
        fit: BoxFit.fill,
        ),
        ),
      child:SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: Column(children: <Widget>[
            _showImage(),
            SizedBox(height: 16),
            Text(
              widget.isUpdating ? "Edit Meal" : "Add Meal",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 16),
            _imageFile == null && _imageUrl == null
                ? Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.symmetric(horizontal: 70),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFF09C04F),
                        ),
                    child: TextButton(
                      onPressed: () => _getLocalImage(),
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  )
                : SizedBox(height: 0),
            _buildMealNameField(),
            _buildMealCaloriesField(),
            _buildMealCarbField(),
            _buildMealFatsField(),
            _buildMealProteinField(),
            _buildDescriptionField(),
            StreamBuilder<QuerySnapshot>(
              stream:
                  Firestore.instance.collection('MealCategories').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) return Container();

                return Container(
                  margin: EdgeInsets.symmetric(vertical: 40),
                  height: 35,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [BoxShadow(
                        color: Colors.grey[400],
                        blurRadius: 20,
                      )]
                  ),
                  child:Row(
                  children:<Widget> [
                          Container(
                          margin: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text("Choose category Meal",
                          style: TextStyle(color: Colors.green,
                          fontSize: 14,),),
                          ),
                          Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: DropdownButton(
                          elevation: 16,
                          style: TextStyle(color: Colors.grey[800], fontSize: 20.0),
                          dropdownColor: Colors.grey[200],
                          icon: Icon(
                          Icons.add,
                          color: Color(0xFF09C04F),
                          size: 30,
                          ),
                          value: _currentMeal.mealCategoryId,
                          isExpanded: false,
                          items: snapshot.data.documents.map((value) {
                          return DropdownMenuItem(
                          value: value.documentID,
                          child: Text('${value.data['categoryName']}'),
                          );
                          }).toList(),
                          onChanged: (value) {
                          setState(() {
                          _currentMeal.mealCategoryId = value;
                          });
                          },
                          ),
                          ),
                  ],
                  ),
                );
              },
            ),
          ],
          ),

        ),
      ),
        ),

      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF09C04F),
        onPressed: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _saveMeal();
          Navigator.pop(context);
        },
      child: Container(
                height: 40,
                width: 50,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(color: Colors.grey[400], blurRadius:80,)]
      ),
                    child: Icon(
                      Icons.save_alt,
                      color: Colors.white,
                      size: 30.0,
                    ),
      ),
      ),
    );
  }
}
