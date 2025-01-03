import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'fire_paywith_q_rcode_widget.dart' show FirePaywithQRcodeWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class FirePaywithQRcodeModel extends FlutterFlowModel<FirePaywithQRcodeWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - capQrCode] action in Button widget.
  String? cap;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
