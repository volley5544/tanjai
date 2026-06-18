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

List<bool>? createCarFileUploadedBoolList(
  FFUploadedFile? imageFront,
  FFUploadedFile? imageRightFront,
  FFUploadedFile? imageRight,
  FFUploadedFile? imageRightRear,
  FFUploadedFile? imageRear,
  FFUploadedFile? imageLeftRear,
  FFUploadedFile? imageLeft,
  FFUploadedFile? imageLeftFront,
  FFUploadedFile? imageRoof,
) {
  List<bool> fileList = [];

  if (imageFront!.name != null) {
    fileList.add(true);
  } else {
    fileList.add(false);
  }
  if (imageRightFront!.name != null) {
    fileList.add(true);
  } else {
    fileList.add(false);
  }
  if (imageRight!.name != null) {
    fileList.add(true);
  } else {
    fileList.add(false);
  }
  if (imageRightRear!.name != null) {
    fileList.add(true);
  } else {
    fileList.add(false);
  }
  if (imageRear!.name != null) {
    fileList.add(true);
  } else {
    fileList.add(false);
  }
  if (imageLeftRear!.name != null) {
    fileList.add(true);
  } else {
    fileList.add(false);
  }
  if (imageLeft!.name != null) {
    fileList.add(true);
  } else {
    fileList.add(false);
  }
  if (imageLeftFront!.name != null) {
    fileList.add(true);
  } else {
    fileList.add(false);
  }
  if (imageRoof!.name != null) {
    fileList.add(true);
  } else {
    fileList.add(false);
  }

  return fileList!;
}
