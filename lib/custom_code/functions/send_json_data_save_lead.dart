import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/custom_functions.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

dynamic sendJsonDataSaveLead(
  List<String>? employeecoderefer,
  List<String>? employeefirstnamerefer,
  List<String>? employeelastnamerefer,
  List<String>? employeebranchrefer,
) {
  List<Map<String, String>> jsonList = [];
  dynamic jsonString = '';

// Iterate through the lists and create JSON objects
  for (int i = 0; i < employeecoderefer!.length; i++) {
    Map<String, String> jsonObject = {
      'employee_code_refer': employeecoderefer![i],
      'employee_firstname_refer': employeefirstnamerefer![i],
      'employee_lastname_refer': employeelastnamerefer![i],
      'employee_branch_refer': employeebranchrefer![i],
    };
    jsonList.add(jsonObject);
    jsonString = jsonObject;
  }

// Convert the list of JSON objects to a JSON array
  //dynamic jsonString = jsonObject;

  return jsonString;
}
