import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import 'dart:convert';
import '/flutter_flow/custom_functions.dart' as functions;
import 'renew_detail_page_widget.dart' show RenewDetailPageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class RenewDetailPageModel extends FlutterFlowModel<RenewDetailPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getDataRenew)] action in renewDetailPage widget.
  ApiCallResponse? getDataRenewAPIOutput;
  // State field(s) for addressCheck widget.
  bool? addressCheckValue;
  // State field(s) for actCheck widget.
  bool? actCheckValue;
  // Stores action output result for [Backend Call - API (renewSave)] action in Button widget.
  ApiCallResponse? renewSaveAPIQuotationBtn;
  // Stores action output result for [Backend Call - API (renewSave)] action in Button widget.
  ApiCallResponse? renewSaveAPIOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
