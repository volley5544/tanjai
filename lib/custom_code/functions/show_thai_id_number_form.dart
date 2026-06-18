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

String? showThaiIdNumberForm(String? thaiId) {
  return '${thaiId![0]}-${thaiId![1]}${thaiId![2]}${thaiId![3]}${thaiId![4]}-${thaiId![5]}${thaiId![6]}${thaiId![7]}${thaiId![8]}${thaiId![9]}-${thaiId![10]}${thaiId![11]}-${thaiId![12]}';
}
