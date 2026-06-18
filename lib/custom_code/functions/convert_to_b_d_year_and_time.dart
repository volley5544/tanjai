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

String? convertToBDYearAndTime(String? inputDate) {
  final gregorianDate = DateTime.parse(inputDate!);
  final buddhaYear = gregorianDate.year +
      543; // Add 543 to the Gregorian year for the Buddhist year
  final buddhaDate = DateTime(
      buddhaYear,
      gregorianDate.month,
      gregorianDate.day,
      gregorianDate.hour,
      gregorianDate.minute,
      gregorianDate.second);

  final formattedDate =
      "${buddhaDate.year}-${buddhaDate.month.toString().padLeft(2, '0')}-${buddhaDate.day.toString().padLeft(2, '0')} ${buddhaDate.hour.toString().padLeft(2, '0')}:${buddhaDate.minute.toString().padLeft(2, '0')}:${buddhaDate.second.toString().padLeft(2, '0')}";

  return formattedDate;
}
