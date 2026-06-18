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

dynamic sendJsonDataAddress(
  List<String>? addresstype,
  List<String>? addressline1,
  List<String>? subdistrictid,
  List<String>? subdistrictname,
  List<String>? districtid,
  List<String>? districtname,
  List<String>? provinceid,
  List<String>? provincename,
  List<String>? zipcode,
  List<String>? keyword,
) {
  List<Map<String, String>> jsonList = [];

// Iterate through the lists and create JSON objects
  for (int i = 0; i < addresstype!.length; i++) {
    Map<String, String> jsonObject = {
      'address_type': addresstype![i],
      'address_line1': addressline1![i],
      'subdistrict_id': subdistrictid![i],
      'subdistrict_name': subdistrictname![i],
      'district_id': districtid![i],
      'district_name': districtname![i],
      'province_id': provinceid![i],
      'province_name': provincename![i],
      'zip_code': zipcode![i],
      'keyword': keyword![i],
    };
    jsonList.add(jsonObject);
  }

// Convert the list of JSON objects to a JSON array
  dynamic jsonString = jsonList;

  return jsonString;
}
