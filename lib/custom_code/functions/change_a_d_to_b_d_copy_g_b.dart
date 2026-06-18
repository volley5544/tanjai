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

String? changeADToBDCopyGB(String? dateInGlobal) {
  // Convert the Gregorian date to a DateTime object
  DateFormat inputDateFormat = DateFormat('dd/MM/yyyy');

  // Parse the input Gregorian date string into a DateTime object
  DateTime dateTime = inputDateFormat.parse(dateInGlobal!);

  // Adjust the year to convert to the Buddhist calendar (add 543)

  DateTime buddhistDateTime =
      DateTime(dateTime!.year + 543, dateTime!.month, dateTime!.day);
  //DateTime(buddhistYear, dateTime.month, dateTime.day);

  // Format the date in the Buddhist calendar using Thai locale
  String buddhistDate =
      DateFormat('dd/MM/yyyy', 'th_TH').format(buddhistDateTime);

  return buddhistDate;
}
