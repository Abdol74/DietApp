import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_tracker_diet_app/Admin/Provider/meal_provider.dart';
import 'package:daily_tracker_diet_app/Admin/models/meal_components_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';

getMeals(MealProvider mealProvider) async {
  QuerySnapshot snapshot =
      await Firestore.instance.collection('MealComponents').getDocuments();

  List<MealComponentsModel> _meals = [];

  snapshot.documents.forEach((document) {
    MealComponentsModel mealComponentsModel =
        MealComponentsModel.fromMap(document.data);
    _meals.add(mealComponentsModel);
  });

  mealProvider.mealList = _meals;
}

uploadMealAndImage(MealComponentsModel meal, bool isUpdating, File localFile,
    Function mealUpdated) async {
  if (localFile != null) {
    print("uploading image");

    var fileExtension = path.extension(localFile.path);
    print(fileExtension);

    var uuid = Uuid().v4();

    final StorageReference firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('foods/images/$uuid$fileExtension');

    await firebaseStorageRef
        .putFile(localFile)
        .onComplete
        .catchError((onError) {
      print(onError);
      return false;
    });

    String url = await firebaseStorageRef.getDownloadURL();
    print("download url: $url");
    _uploadMeal(meal, isUpdating, mealUpdated, imageUrl: url);
  } else {
    print('...skipping image upload');
    _uploadMeal(meal, isUpdating, mealUpdated);
  }
}

_uploadMeal(MealComponentsModel meal, bool isUpdating, Function mealUpdated,
    {String imageUrl}) async {
  CollectionReference reference =
      Firestore.instance.collection('MealComponents');
  if (imageUrl != null) {
    meal.imageUrl = imageUrl;
  }

  if (isUpdating) {
    await reference.document(meal.id).updateData(meal.toMap());
    mealUpdated(meal);
  } else {
    DocumentReference documentReference = await reference.add(meal.toMap());
    meal.id = documentReference.documentID;
    await documentReference.setData(meal.toMap(), merge: true);
    mealUpdated(meal);
  }
}
