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

String? showNumberWithCommaWithoutDot(String? number) {
  // Check if the input is null or empty
  if (number == null || number.isEmpty) {
    return '';
  }

  // Format the double as a string with two decimal places
  //String formattedNumber = parsedNumber.toStringAsFixed(2);

  // Use regular expression to add commas
  List<String> parts = number.split('.');

  // Format the part before the decimal point with commas
  String formattedBeforeDecimal = formatWithCommas(parts[0]);

  // Format the part after the decimal point with two decimal places
  String formattedAfterDecimal =
      parts.length > 1 ? formatDecimal(parts[1]) : '00';

  // Combine the formatted parts
  String result = '$formattedBeforeDecimal.$formattedAfterDecimal';

  return (result);
}

String formatWithCommas(String input) {
  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String Function(Match) mathFunc = (Match match) => '${match[1]},';
  return input.replaceAllMapped(reg, mathFunc);
}

String formatDecimal(String input) {
  if (input.length >= 2) {
    return input.substring(0, 2);
  } else if (input.isNotEmpty) {
    return input.padRight(2, '0');
  } else {
    return '00';
  }
}
