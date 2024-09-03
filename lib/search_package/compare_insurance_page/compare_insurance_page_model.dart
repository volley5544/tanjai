import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import '/flutter_flow/custom_functions.dart' as functions;
import 'compare_insurance_page_widget.dart' show CompareInsurancePageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CompareInsurancePageModel
    extends FlutterFlowModel<CompareInsurancePageWidget> {
  ///  Local state fields for this page.

  int? indexDataCompare = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getDateTimeAPI)] action in Button widget.
  ApiCallResponse? getServerDateTime;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
