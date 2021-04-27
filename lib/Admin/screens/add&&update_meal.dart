import 'dart:io';
import 'package:daily_tracker_diet_app/Admin/models/meal_components_model.dart';
import 'package:daily_tracker_diet_app/Admin/Provider/meal_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
      return Text("image placeholder");
    } else if (_imageFile != null) {
      print('showing image from local file');

      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Image.file(
            _imageFile,
            fit: BoxFit.cover,
            height: 250,
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
            fit: BoxFit.cover,
            height: 250,
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
    }
  }

  Widget _buildMealNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      initialValue: _currentMeal.mealName,
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is required';
        }

        if (value.length < 3 || value.length > 20) {
          return 'Name must be more than 3 and less than 20';
        }

        return null;
      },
      onSaved: (String value) {
        _currentMeal.mealName = value;
      },
    );
  }

  Widget _buildMealCaloriesField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'calories'),
      initialValue: _currentMeal.caloriesNumber.toString(),
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Calories is required';
        }

        return null;
      },
      onSaved: (value) {
        _currentMeal.caloriesNumber = int.parse(value);
      },
    );
  }

  Widget _buildMealProteinField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'calories'),
      initialValue: _currentMeal.protein.toString(),
      keyboardType: TextInputType.number,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Calories is required';
        }
        return null;
      },
      onSaved: (value) {
        _currentMeal.protein = int.parse(value);
      },
    );
  }

  Widget _buildMealFatsField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'calories'),
      initialValue: _currentMeal.fats.toString(),
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Calories is required';
        }

        return null;
      },
      onSaved: (value) {
        _currentMeal.fats = int.parse(value);
      },
    );
  }

  Widget _buildMealCarbField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'calories'),
      initialValue: _currentMeal.carb.toString(),
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Calories is required';
        }

        return null;
      },
      onSaved: (value) {
        _currentMeal.carb = int.parse(value);
      },
    );
  }

  _getLocalImage() async {
    File imageFile = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50, maxWidth: 400);

    if (imageFile != null) {
      setState(() {
        _imageFile = imageFile;
      });
    }
  }

  Widget _buildDescriptionField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Category'),
      initialValue: _currentMeal.mealDescription,
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Category is required';
        }

        if (value.length < 3 || value.length > 20) {
          return 'Category must be more than 3 and less than 20';
        }

        return null;
      },
      onSaved: (String value) {
        _currentMeal.mealDescription = value;
      },
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
      appBar: AppBar(title: Text('Food Form')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: Column(children: <Widget>[
            _showImage(),
            SizedBox(height: 16),
            Text(
              widget.isUpdating ? "Edit Food" : "Create Food",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 16),
            _imageFile == null && _imageUrl == null
                ? ButtonTheme(
                    child: RaisedButton(
                      onPressed: () => _getLocalImage(),
                      child: Text(
                        'Add Image',
                        style: TextStyle(color: Colors.white),
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

                return Center(
                  child: DropdownButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.teal,
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
                );
              },
            ),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _saveMeal();
          Navigator.pop(context);
        },
        child: Icon(Icons.save),
        foregroundColor: Colors.white,
      ),
    );
  }
}
