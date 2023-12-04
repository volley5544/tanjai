import '/backend/api_requests/api_calls.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_address_widget.dart' show AddAddressWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddAddressModel extends FlutterFlowModel<AddAddressWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (GetAddressMaster)] action in AddAddress widget.
  ApiCallResponse? getAddressMaster;
  // State field(s) for address2 widget.
  FocusNode? address2FocusNode;
  TextEditingController? address2Controller;
  String? Function(BuildContext, String?)? address2ControllerValidator;
  // State field(s) for address3 widget.
  FocusNode? address3FocusNode;
  TextEditingController? address3Controller;
  String? Function(BuildContext, String?)? address3ControllerValidator;
  // State field(s) for addressAtIdCard widget.
  bool? addressAtIdCardValue;
  // State field(s) for addressForDoc widget.
  bool? addressForDocValue;
  // State field(s) for address4 widget.
  FocusNode? address4FocusNode;
  TextEditingController? address4Controller;
  String? Function(BuildContext, String?)? address4ControllerValidator;
  // State field(s) for address5 widget.
  FocusNode? address5FocusNode;
  TextEditingController? address5Controller;
  String? Function(BuildContext, String?)? address5ControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    address2FocusNode?.dispose();
    address2Controller?.dispose();

    address3FocusNode?.dispose();
    address3Controller?.dispose();

    address4FocusNode?.dispose();
    address4Controller?.dispose();

    address5FocusNode?.dispose();
    address5Controller?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
