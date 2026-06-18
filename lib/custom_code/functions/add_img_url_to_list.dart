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

List<String>? addImgUrlToList(
  String? img1,
  String? img2,
  String? img3,
  String? img4,
  String? img5,
  String? img6,
) {
  List<String>? result = [];
  if (img1! != '') {
    result.add(img1);
  }
  if (img2! != '') {
    result.add(img2);
  }
  if (img3! != '') {
    result.add(img3);
  }
  if (img4! != '') {
    result.add(img4);
  }
  if (img5! != '') {
    result.add(img5);
  }
  if (img6! != '') {
    result.add(img6);
  }
  return result;
}
