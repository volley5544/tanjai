import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'search_insurance_page_widget.dart' show SearchInsurancePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SearchInsurancePageModel
    extends FlutterFlowModel<SearchInsurancePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - getBuildVersion1] action in SearchInsurancePage widget.
  String? getBuildVersion;
  // Stores action output result for [Firestore Query - Query a collection] action in SearchInsurancePage widget.
  BuildVersionRecord? buildVersionQuery;
  // Stores action output result for [Backend Call - API (teleGetBrandAPI)] action in SearchInsurancePage widget.
  ApiCallResponse? getBrandAPI;
  // Stores action output result for [Backend Call - API (teleGetModelAPI )] action in SearchInsurancePage widget.
  ApiCallResponse? getModelAPI;
  // Stores action output result for [Backend Call - API (teleGetCoverTypeAPI)] action in SearchInsurancePage widget.
  ApiCallResponse? getCoverTypeAPI;
  // Stores action output result for [Backend Call - API (insuranceRequestGetVehicleAPI)] action in SearchInsurancePage widget.
  ApiCallResponse? getVehicleUsedTypeAPI;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
