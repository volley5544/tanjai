import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'information_customer2_widget.dart' show InformationCustomer2Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class InformationCustomer2Model
    extends FlutterFlowModel<InformationCustomer2Widget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getBuildVersion1] action in informationCustomer2 widget.
  String? getBuildVersion;
  // Stores action output result for [Custom Action - getBuildNumber] action in informationCustomer2 widget.
  int? deviceBuildNumber;
  // Stores action output result for [Firestore Query - Query a collection] action in informationCustomer2 widget.
  BuildVersionRecord? buildVersionQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in informationCustomer2 widget.
  AuthorizationRecord? adminVersionQuery;
  // Stores action output result for [Backend Call - API (teleGetBrandAPI)] action in informationCustomer2 widget.
  ApiCallResponse? getBrandAPI;
  // Stores action output result for [Backend Call - API (teleGetModelAPI )] action in informationCustomer2 widget.
  ApiCallResponse? getModelAPI;
  // Stores action output result for [Backend Call - API (teleGetCoverTypeAPI)] action in informationCustomer2 widget.
  ApiCallResponse? getCoverTypeAPI;
  // Stores action output result for [Backend Call - API (insuranceRequestGetVehicleAPI)] action in informationCustomer2 widget.
  ApiCallResponse? getVehicleUsedTypeAPI;
  // State field(s) for firstname widget.
  FocusNode? firstnameFocusNode;
  TextEditingController? firstnameTextController;
  String? Function(BuildContext, String?)? firstnameTextControllerValidator;
  // State field(s) for lastname widget.
  FocusNode? lastnameFocusNode;
  TextEditingController? lastnameTextController;
  String? Function(BuildContext, String?)? lastnameTextControllerValidator;
  // State field(s) for phonenumber widget.
  FocusNode? phonenumberFocusNode;
  TextEditingController? phonenumberTextController;
  late MaskTextInputFormatter phonenumberMask;
  String? Function(BuildContext, String?)? phonenumberTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textFieldTextController;
  String? Function(BuildContext, String?)? textFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (cmiSaveLeads)] action in Button widget.
  ApiCallResponse? cmiSaveAPIOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    firstnameFocusNode?.dispose();
    firstnameTextController?.dispose();

    lastnameFocusNode?.dispose();
    lastnameTextController?.dispose();

    phonenumberFocusNode?.dispose();
    phonenumberTextController?.dispose();

    textFieldFocusNode?.dispose();
    textFieldTextController?.dispose();
  }
}
