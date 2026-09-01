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

dynamic sendJsonData(
  List<String>? insurerid,
  List<String>? insurercode,
  List<String>? insurershortname,
  List<String>? insurername,
  List<String>? covertypeid,
  List<String>? covertypecode,
  List<String>? covertypename,
  List<String>? garagetypeid,
  List<String>? garagetypecode,
  List<String>? garagetypename,
  List<String>? productid,
  List<String>? packageid,
  List<String>? packagename,
  List<String>? suminsured,
  List<String>? roadsideassistance,
  List<String>? tpbiperson,
  List<String>? tpbiaccident,
  List<String>? tppd,
  List<String>? flood,
  List<String>? deductible,
  List<String>? pa,
  List<String>? me,
  List<String>? bb,
  List<String>? assessory,
  List<String>? seat,
  List<String>? netpremium,
  List<String>? vat,
  List<String>? stamp,
  List<String>? grosstotal,
  List<String>? contractProcessstate,
  List<String>? cc,
  List<String>? carLost,
  List<String>? motorAddOn,
  List<String>? driverBehavior,
  List<String>? inspectionExcept,
  List<String>? discountother,
  List<String>? discountpercent,
  List<String>? inspectionexceptpolicyfile,
  List<String>? inspectionexceptquotationtype,
) {
  List<Map<String, String>> jsonList = [];

// Iterate through the lists and create JSON objects
  for (int i = 0; i < insurerid!.length; i++) {
    Map<String, String> jsonObject = {
      'insurer_id': insurerid![i],
      'insurer_code': insurercode![i],
      'insurer_short_name': insurershortname![i],
      'insurer_name': insurername![i],
      'cover_type_id': covertypeid![i],
      'cover_type_code': covertypecode![i],
      'cover_type_name': covertypename![i],
      'garage_type_id': garagetypeid![i],
      'garage_type_code': garagetypecode![i],
      'garage_type_name': garagetypename![i],
      'product_id': productid![i],
      'package_id': packageid![i],
      'package_name': packagename![i],
      'sum_insured': suminsured![i],
      'roadside_assistance': roadsideassistance![i],
      'tpbi_person': tpbiperson![i],
      'tpbi_accident': tpbiaccident![i],
      'tppd': tppd![i],
      'flood': flood![i],
      'deductible': deductible![i],
      'pa': pa![i],
      'me': me![i],
      'bb': bb![i],
      'assessory': assessory![i],
      'seat': seat![i],
      'net_premium': netpremium![i],
      'vat': vat![i],
      'stamp': stamp![i],
      'gross_total': grosstotal![i],
      'contractProcessstate': contractProcessstate![i],
      'cc': cc![i],
      'car_lost': carLost![i],
      'motor_add_on': motorAddOn![i],
      'driver_behavior': driverBehavior![i],
      'inspection_except': inspectionExcept![i],
      'discount_other': discountother![i],
      'discount_percent': discountpercent![i],
      'inspection_except_policy_file': inspectionexceptpolicyfile![i],
      'inspection_except_quotation_type': inspectionexceptquotationtype![i],
    };
    jsonList.add(jsonObject);
  }

// Convert the list of JSON objects to a JSON array
  dynamic jsonString = jsonList;

  return jsonString;
}
