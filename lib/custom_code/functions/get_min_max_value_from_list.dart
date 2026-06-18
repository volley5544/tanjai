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

String? getMinMaxValueFromList(
  List<String>? inputList,
  String? type,
) {
  double minValue = 0;
  double maxValue = 0;

  if (type == 'min') {
    if (inputList!.length == 1) {
      return removeCommaFromNumText(inputList![0]);
    } else {
      for (int i = 0; i < inputList!.length; i++) {
        if (i == 0) {
          minValue = double.parse(removeCommaFromNumText(inputList![i]));
        } else {
          if (double.parse(removeCommaFromNumText(inputList![i])) < minValue) {
            minValue = double.parse(removeCommaFromNumText(inputList![i]));
          }
        }
      }
    }
    return '${minValue}';
  } else {
    if (inputList!.length == 1) {
      return removeCommaFromNumText(inputList![0]);
    } else {
      for (int i = 0; i < inputList!.length; i++) {
        if (i == 0) {
          maxValue = double.parse(removeCommaFromNumText(inputList![i]));
        } else {
          if (double.parse(removeCommaFromNumText(inputList![i])) > maxValue) {
            maxValue = double.parse(removeCommaFromNumText(inputList![i]));
          }
        }
      }
    }
    return '${maxValue}';
  }
}
