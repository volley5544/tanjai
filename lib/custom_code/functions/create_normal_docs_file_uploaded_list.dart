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

List<FFUploadedFile>? createNormalDocsFileUploadedList(
  FFUploadedFile? imageBlueBook,
  FFUploadedFile? imageIdCard,
  FFUploadedFile? imageOther1,
  FFUploadedFile? imageOther2,
  FFUploadedFile? imageOther3,
  FFUploadedFile? imageOther4,
  FFUploadedFile? imageOther5,
) {
  List<FFUploadedFile> fileList = [];

  if (imageBlueBook!.name != null) {
    fileList.add(imageBlueBook!);
  }
  if (imageIdCard!.name != null) {
    fileList.add(imageIdCard!);
  }
  if (imageOther1!.name != null) {
    fileList.add(imageOther1!);
  }
  if (imageOther2!.name != null) {
    fileList.add(imageOther2!);
  }
  if (imageOther3!.name != null) {
    fileList.add(imageOther3!);
  }
  if (imageOther4!.name != null) {
    fileList.add(imageOther4!);
  }
  if (imageOther5!.name != null) {
    fileList.add(imageOther5!);
  }

  return fileList!;
}
