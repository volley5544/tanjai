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

List<String>? coverTypeCodeToId(List<String>? coverTypeCode) {
  List<String> result = [];
  for (int i = 0; i < coverTypeCode!.length; i++) {
    if (coverTypeCode[i] == 'VMI1') {
      result.add('1');
    } else if (coverTypeCode[i] == 'VMI2') {
      result.add('2');
    } else if (coverTypeCode[i] == 'VMI2+') {
      result.add('3');
    } else if (coverTypeCode[i] == 'VMI3') {
      result.add('4');
    } else {
      result.add('5');
    }
  }
  return result;
}
