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

bool? checkPackageInRangePage2Copy(
  List<String>? insurerShortNameList,
  List<String>? priceList,
  String? selectedInsurerShortName,
  String? minValue,
  String? maxValue,
  String? selectedCoverType,
  List<String>? coverTypeList,
) {
  //loop for all package
  for (int i = 0; i < insurerShortNameList!.length; i++) {
    //check price is between max min
    if (selectedInsurerShortName! == insurerShortNameList![i]) {
      if (selectedCoverType!.contains('1')) {
        if (coverTypeList![i].contains('1')) {
          if (double.parse(removeCommaFromNumText(minValue!)) <=
                  double.parse(removeCommaFromNumText(priceList![i])) &&
              double.parse(removeCommaFromNumText(maxValue!)) >=
                  double.parse(removeCommaFromNumText(priceList![i]))) {
            return true;
          }
        }
      } else {
        if (!coverTypeList![i].contains('1')) {
          if (double.parse(removeCommaFromNumText(minValue!)) <=
                  double.parse(removeCommaFromNumText(priceList![i])) &&
              double.parse(removeCommaFromNumText(maxValue!)) >=
                  double.parse(removeCommaFromNumText(priceList![i]))) {
            return true;
          }
        }
      }
    }
  }
  return false;
}
