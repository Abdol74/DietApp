import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ClientsModel {
  String _clientName;
  String _goalId;
  String _profilePicture;
  int _age;
  int _height;
  int _weight;

  //getters//

  int get age => _age;
  int get height => _height;
  int get weight => _weight;
  String get clientName => _clientName;
  String get goalId => _goalId;
  String get profilePicture => _profilePicture;

  ClientsModel.fromSnapshot(DocumentSnapshot snapshot) {
    _clientName = snapshot.data['clientName'];
    _goalId = snapshot.data['goalId'];
    _profilePicture = snapshot.data['profilePicture'];
    _age = snapshot.data['age'];
    _height = snapshot.data['height'];
    _weight = snapshot.data['weight'];
  }
}
