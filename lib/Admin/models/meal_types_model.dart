import 'package:cloud_firestore/cloud_firestore.dart';

class MealTypeModel {
  String _typeName;

  //getter//

  String get typeName => _typeName;

  MealTypeModel.fromSnapshot(DocumentSnapshot snapshot) {
    _typeName = snapshot.data['typeName'];
  }
}
