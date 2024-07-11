import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'save_contract_c_m_i_widget.dart' show SaveContractCMIWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SaveContractCMIModel extends FlutterFlowModel<SaveContractCMIWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for searchFirstname widget.
  FocusNode? searchFirstnameFocusNode;
  TextEditingController? searchFirstnameTextController;
  String? Function(BuildContext, String?)?
      searchFirstnameTextControllerValidator;
  // Stores action output result for [Backend Call - API (apiCmiSaveContract)] action in Button widget.
  ApiCallResponse? saveContractCmiOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchFirstnameFocusNode?.dispose();
    searchFirstnameTextController?.dispose();
  }
}
