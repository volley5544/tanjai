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

bool? checkDatePage5(
  String? apiCompleteDate,
  String? currentDate,
) {
  DateTime CompleteDate = DateTime.parse(apiCompleteDate!);
  DateTime DateNow = DateTime.parse(currentDate!);

  if (CompleteDate.year == (DateNow.year + 543) &&
      CompleteDate.month == DateNow.month &&
      CompleteDate.day == DateNow.day) {
    // Dates are equal
    return true;
  } else {
    // Dates are not equal
    return false;
  }
}
