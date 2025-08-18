import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'search_old_vmi_widget.dart' show SearchOldVmiWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SearchOldVmiModel extends FlutterFlowModel<SearchOldVmiWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for searchCar widget.
  FocusNode? searchCarFocusNode;
  TextEditingController? searchCarTextController;
  String? Function(BuildContext, String?)? searchCarTextControllerValidator;
  // State field(s) for searchFire widget.
  FocusNode? searchFireFocusNode;
  TextEditingController? searchFireTextController;
  late MaskTextInputFormatter searchFireMask;
  String? Function(BuildContext, String?)? searchFireTextControllerValidator;
  // Stores action output result for [Backend Call - API (searchOldVmiApi)] action in Button widget.
  ApiCallResponse? searchVmiOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchCarFocusNode?.dispose();
    searchCarTextController?.dispose();

    searchFireFocusNode?.dispose();
    searchFireTextController?.dispose();
  }
}
