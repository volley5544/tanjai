import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/components/custom_dialog_component_copy_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import '/pages/super_app/components/make_insurance_type_color/make_insurance_type_color_widget.dart';
import '/pages/super_app/components/none_package_show_status_component/none_package_show_status_component_widget.dart';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'make_insurance_list_page_widget.dart' show MakeInsuranceListPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MakeInsuranceListPageModel
    extends FlutterFlowModel<MakeInsuranceListPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getBuildVersion1] action in MakeInsuranceListPage widget.
  String? getBuildVersion;
  // Stores action output result for [Custom Action - getBuildNumber] action in MakeInsuranceListPage widget.
  int? deviceBuildNumber;
  // Stores action output result for [Firestore Query - Query a collection] action in MakeInsuranceListPage widget.
  BuildVersionRecord? buildVersionQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in MakeInsuranceListPage widget.
  AuthorizationRecord? adminVersionQuery;
  // State field(s) for searchFirstname widget.
  FocusNode? searchFirstnameFocusNode;
  TextEditingController? searchFirstnameTextController;
  String? Function(BuildContext, String?)?
      searchFirstnameTextControllerValidator;
  // Stores action output result for [Backend Call - API (getFileVmiApi)] action in Button widget.
  ApiCallResponse? getFileVmiButton;
  // Stores action output result for [Backend Call - API (getFileCmiApi )] action in Button widget.
  ApiCallResponse? getFileCmiOutput;
  // Stores action output result for [Backend Call - API (getNonePackageHistoryAPI)] action in Button widget.
  ApiCallResponse? getHistory;
  // Stores action output result for [Backend Call - API (getFileVmiApi)] action in Button widget.
  ApiCallResponse? getFileVmi;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchFirstnameFocusNode?.dispose();
    searchFirstnameTextController?.dispose();
  }
}
