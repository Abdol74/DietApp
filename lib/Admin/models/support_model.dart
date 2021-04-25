import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class SupportModel {
  String _description;
  String _response;
  Map _status;
  String _time;
  String _uId;

  //getters//

  String get description => _description;
  String get response => _response;
  Map get status => _status;
  String get time => _time;
  String get uId => _uId;

  SupportModel.fromSnapshot(DocumentSnapshot snapshot) {
    _description = snapshot.data['description'];
    _response = snapshot.data['response'];
    _status = snapshot.data['status'];
    _time = snapshot.data['time'];
    _uId = snapshot.data['uId'];
  }
}
