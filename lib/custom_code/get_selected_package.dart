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

List<PackageStruct>? getSelectedPackage(
  List<bool>? boolList,
  bool? searchValue,
  List<PackageStruct>? listData,
) {
  if (boolList == null || searchValue == null || listData == null) return null;

  List<PackageStruct> result = [];
  for (int i = 0; i < boolList.length; i++) {
    if (searchValue == boolList[i]) {
      result.add(listData[i]);
    }
  }
  return result;
}
