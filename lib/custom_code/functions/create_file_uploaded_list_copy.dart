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

List<FFUploadedFile>? createFileUploadedListCopy(
  FFUploadedFile? image1,
  FFUploadedFile? image2,
  FFUploadedFile? image3,
  FFUploadedFile? image4,
  FFUploadedFile? image5,
  FFUploadedFile? image6,
) {
  List<FFUploadedFile> fileList = [];

  if (image1!.name != null) {
    fileList.add(image1!);
    if (image2!.name != null) {
      fileList.add(image2!);
      if (image3!.name != null) {
        fileList.add(image3!);
        if (image4!.name != null) {
          fileList.add(image4!);
          if (image5!.name != null) {
            fileList.add(image5!);
            if (image6!.name != null) {
              fileList.add(image6!);
            }
          }
        }
      }
    }
  }

  return fileList!;
}
