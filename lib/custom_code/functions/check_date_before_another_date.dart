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

bool? checkDateBeforeAnotherDate(
  int? days,
  DateTime? date,
) {
  DateTime currentDate = DateTime.now();

  // Add 180 days to the current date
  DateTime futureDate = currentDate.add(Duration(days: days!));

  // Check if the date to check is less than or equal to the future date
  if (date!.isBefore(futureDate) || date!.isAtSameMomentAs(futureDate)) {
    return true;
  } else {
    return false;
  }
}
