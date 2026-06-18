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

DateTime? changeYearBDtoAD(String? inputDate) {
  List<String> parts = inputDate!.split('/');

  // Extract day, month, and year from the parts
  int day = int.parse(parts[0]);
  int month = int.parse(parts[1]);
  int thaiYear = int.parse(parts[2]);

  // Convert the Thai Buddhist year to the common era year
  int year = thaiYear - 543;

  // Construct a new DateTime object with the parsed components
  return DateTime(year, month, day);
}
