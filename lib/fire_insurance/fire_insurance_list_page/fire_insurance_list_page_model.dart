import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
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
import 'fire_insurance_list_page_widget.dart' show FireInsuranceListPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class FireInsuranceListPageModel
    extends FlutterFlowModel<FireInsuranceListPageWidget> {
  ///  Local state fields for this page.

  FireGetLeadsStruct? getFireLead;
  void updateGetFireLeadStruct(Function(FireGetLeadsStruct) updateFn) {
    updateFn(getFireLead ??= FireGetLeadsStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getBuildVersion1] action in fireInsuranceListPage widget.
  String? getBuildVersion;
  // Stores action output result for [Custom Action - getBuildNumber] action in fireInsuranceListPage widget.
  int? deviceBuildNumber;
  // Stores action output result for [Firestore Query - Query a collection] action in fireInsuranceListPage widget.
  BuildVersionRecord? buildVersionQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in fireInsuranceListPage widget.
  AuthorizationRecord? adminVersionQuery;
  // Stores action output result for [Backend Call - API (FireGetLeadsApi)] action in fireInsuranceListPage widget.
  ApiCallResponse? fireGetLeads;
  // State field(s) for searchFirstname widget.
  FocusNode? searchFirstnameFocusNode;
  TextEditingController? searchFirstnameTextController;
  String? Function(BuildContext, String?)?
      searchFirstnameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchFirstnameFocusNode?.dispose();
    searchFirstnameTextController?.dispose();
  }
}
