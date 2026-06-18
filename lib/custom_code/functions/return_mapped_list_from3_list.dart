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

List<String> returnMappedListFrom3List(
  List<String>? somethingList1,
  List<String>? somethingList2,
  String? searchValue,
  List<String>? vehicleGroupList,
  String? vehicleGroupSearch,
  List<String>? carGroupDetailList,
  String? carTypeContain,
  List<String>? carDoorList,
  String? carTypeDoors,
) {
  //Map<String, String> mappedList =
  //  Map.fromIterables(somethingList1!, somethingList2!);

  //List<String> keysWithSearchValue = mappedList.entries
  //   .where((entry) => entry.value == searchValue!)
  // .map((entry) => entry.key)
  //.toList();

  List<String> mappedList = [];

  for (int i = 0; i < somethingList1!.length; i++) {
    if (searchValue! == somethingList2![i] &&
        vehicleGroupList![i].contains(vehicleGroupSearch!) &&
        carTypeContain! == carGroupDetailList![i] &&
        (carTypeDoors! == carDoorList![i] || carDoorList![i] == '-')) {
      mappedList.add(somethingList1![i]);
    }
  }

  return mappedList;
}
