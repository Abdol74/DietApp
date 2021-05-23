import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_tracker_diet_app/User/models/clients_model.dart';
import 'package:flutter/material.dart';

saveClientData(
    ClientsModel client, String currentUserId, double calories) async {
  CollectionReference reference = Firestore.instance.collection('Clients');
  DocumentReference documentReference = await reference.add(client.toMap());
  client.clientId = currentUserId;
  client.caloriesRequired = calories;
  await documentReference.setData(client.toMap(), merge: true);
}
