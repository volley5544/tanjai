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

bool? checkIdCard(String? idCard) {
  // Check if the ID card has the correct length (13 characters)
  if (idCard!.length != 13) {
    return false;
  }

  // Check if all characters are digits
  if (!RegExp(r'^\d{13}$').hasMatch(idCard)) {
    return false;
  }

  // Calculate and validate the checksum digit
  int sum = 0;
  for (int i = 0; i < 12; i++) {
    int digit = int.parse(idCard[i]);
    sum += digit * (13 - i);
  }

  int checksum = (11 - (sum % 11)) % 10;
  int lastDigit = int.parse(idCard[12]);

  return checksum == lastDigit;
}
