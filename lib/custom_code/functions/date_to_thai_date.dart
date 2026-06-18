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

String? dateToThaiDate(String? date) {
  // Parse the input date string to a DateTime object
  DateTime inputDate = DateFormat('dd-MM-yyyy').parse(date!);

  // Create a DateFormat instance for the desired format
  final thaiDateFormat = DateFormat('dd MMM yyyy', 'th');

  // Format the DateTime object to the desired format
  String formattedDate = thaiDateFormat.format(inputDate);

  return formattedDate;
}
