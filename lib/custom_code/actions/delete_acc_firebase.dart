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

import 'package:firebase_auth/firebase_auth.dart';

Future<bool> deleteAccFirebase() async {
  // Add your function code here!
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user = _auth.currentUser;
  bool result = false;
  try {
    await user!.delete();
    result = true;
  } catch (e) {
    result = false;
  }
  return result;
}