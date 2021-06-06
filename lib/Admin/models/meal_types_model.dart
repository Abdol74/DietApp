import 'package:cloud_firestore/cloud_firestore.dart';

class MealTypeModel {
  String typeName;

  //getter//

  MealTypeModel.fromSnapshot(DocumentSnapshot snapshot) {
    typeName = snapshot.data['typeName'];
  }
}
