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

String? showNumberWithCommaWithoutDot2(String? number) {
  if (number == null || number.isEmpty) {
    return '';
  }

  // Format the double as a string with two decimal places
  //String formattedNumber = parsedNumber.toStringAsFixed(2);

  // Use regular expression to add commas
  List<String> parts = number!.split('.');

  // Check if the input is null or empty
  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String Function(Match) mathFunc = (Match match) => '${match[1]},';
  String result = parts[0].replaceAllMapped(reg, mathFunc);

  return result;
}
