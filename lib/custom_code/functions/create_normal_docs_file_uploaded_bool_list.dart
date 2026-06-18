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

List<bool>? createNormalDocsFileUploadedBoolList(
  FFUploadedFile? imageBlueBook,
  FFUploadedFile? imageIdCard,
  FFUploadedFile? imageOther1,
  FFUploadedFile? imageOther2,
  FFUploadedFile? imageOther3,
  FFUploadedFile? imageOther4,
  FFUploadedFile? imageOther5,
) {
  List<bool> fileList = [];

  if (imageBlueBook!.name != null) {
    fileList.add(true);
  } else {
    fileList.add(false);
  }
  if (imageIdCard!.name != null) {
    fileList.add(true);
  } else {
    fileList.add(false);
  }
  if (imageOther1!.name != null) {
    fileList.add(true);
  } else {
    fileList.add(false);
  }
  if (imageOther2!.name != null) {
    fileList.add(true);
  } else {
    fileList.add(false);
  }
  if (imageOther3!.name != null) {
    fileList.add(true);
  } else {
    fileList.add(false);
  }
  if (imageOther4!.name != null) {
    fileList.add(true);
  } else {
    fileList.add(false);
  }
  if (imageOther5!.name != null) {
    fileList.add(true);
  } else {
    fileList.add(false);
  }

  return fileList!;
}
