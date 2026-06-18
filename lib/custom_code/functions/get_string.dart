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

String? getString() {
  return "ความคุ้มครองเพิ่มเติม :\n1. ค่าเช่าที่อยู่อาศัยชั่วคราว / สูญเสียค่าเช่า (วงเงิน 2,500 ต่อวัน / ไม่เกิน 30 วัน)\n2. ค่าใช้จ่ายในการดับเพลิง (วงเงิน 10,000 บาทต่อครั้ง และไม่เกิน 50,000 บาทตลอดระยะเวลาเอาประกันภัย)\n3. ค่าใช้จ่ายในการขนย้ายซากทรัพย์สิน (วงเงิน 10,000 บาทต่อครั้ง และไม่เกิน 50,000 บาทตลอดระยะเวลาเอาประกันภัย)\n4. ค่าใช้จ่ายค่าวิชาชีพ (วงเงิน 10,000 บาทต่อครั้ง และไม่เกิน 50,000 บาทตลอดระยะเวลาเอาประกันภัย)\n5. ค่าใช้จ่ายของตัวล็อกและกุญแจที่จัดหามาทดแทน และค่าใช้จ่ายในการติดตั้งต่อประตูและหรือหน้าต่างด้านนอก (วงเงิน 5,000 บาทต่อครั้งและตลอดระยะเลาเอาประกันภัย)\n6. ค่าใช้จ่ายเพื่อการทดแทนอาหารและเครื่องดื่มที่เน่าเปื่อยหรือเสียหาย (วงเงิน 5,000 บาทต่อครั้งและตลอดระยะเลาเอาประกันภัย)\n7. ค่าใช้จ่ายการตกแต่งภูมิทัศน์ (วงเงิน 5,000 บาทต่อต้น ไม่เกิน 100,000 บาทต่อครั้งและตลอดระยะเลาเอาประกันภัย)";
}
