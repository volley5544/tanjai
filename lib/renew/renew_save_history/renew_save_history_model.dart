import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import 'dart:convert';
import '/flutter_flow/custom_functions.dart' as functions;
import 'renew_save_history_widget.dart' show RenewSaveHistoryWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class RenewSaveHistoryModel extends FlutterFlowModel<RenewSaveHistoryWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (renewMasterGetCallStatus)] action in renewSaveHistory widget.
  ApiCallResponse? masterAPIOutput;
  // State field(s) for DropDownMain widget.
  String? dropDownMainValue;
  FormFieldController<String>? dropDownMainValueController;
  // State field(s) for DropDownSub widget.
  String? dropDownSubValue;
  FormFieldController<String>? dropDownSubValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (renewCallStatusSave)] action in Button widget.
  ApiCallResponse? callStatusSaveAPIOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
