// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';

Future<String> getFirebaseServerTime() async {
  // Add your function code here!
  final HttpsCallable callable =
      FirebaseFunctions.instance.httpsCallable('getServerTimestamp');
  final response = await callable.call();
  final timestamp = (response.data as Map)['timestamp'] as Timestamp;
  final dateTime = timestamp.toDate();
  print('Server date and time: $dateTime');
  return '$dateTime';
}
