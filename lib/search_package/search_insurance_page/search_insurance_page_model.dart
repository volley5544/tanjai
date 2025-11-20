import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'search_insurance_page_widget.dart' show SearchInsurancePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SearchInsurancePageModel
    extends FlutterFlowModel<SearchInsurancePageWidget> {
  ///  Local state fields for this page.

  DataListRecord? masterDataDoc;

  bool driverFlag = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getBuildVersion1] action in SearchInsurancePage widget.
  String? getBuildVersion;
  // Stores action output result for [Custom Action - getBuildNumber] action in SearchInsurancePage widget.
  int? deviceBuildNumber;
  // Stores action output result for [Firestore Query - Query a collection] action in SearchInsurancePage widget.
  BuildVersionRecord? buildVersionQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in SearchInsurancePage widget.
  AuthorizationRecord? adminVersionQuery;
  // Stores action output result for [Backend Call - API (teleGetBrandMCAPI)] action in SearchInsurancePage widget.
  ApiCallResponse? getBrandMCAPI;
  // Stores action output result for [Backend Call - API (teleGetModelMCAPI )] action in SearchInsurancePage widget.
  ApiCallResponse? getModelMCAPI;
  // Stores action output result for [Backend Call - API (teleGetCoverTypeAPI)] action in SearchInsurancePage widget.
  ApiCallResponse? getCoverTypeMCAPI;
  // Stores action output result for [Backend Call - API (insuranceRequestGetVehicleAPI)] action in SearchInsurancePage widget.
  ApiCallResponse? getVehicleUsedTypeMCAPI;
  // Stores action output result for [Backend Call - API (teleGetProvinceAPI)] action in SearchInsurancePage widget.
  ApiCallResponse? getProvinceMC;
  // Stores action output result for [Backend Call - API (teleGetBrandAPI)] action in SearchInsurancePage widget.
  ApiCallResponse? getBrandAPI;
  // Stores action output result for [Backend Call - API (teleGetModelAPI )] action in SearchInsurancePage widget.
  ApiCallResponse? getModelAPI;
  // Stores action output result for [Backend Call - API (teleGetCoverTypeAPI)] action in SearchInsurancePage widget.
  ApiCallResponse? getCoverTypeAPI;
  // Stores action output result for [Backend Call - API (insuranceRequestGetVehicleAPI)] action in SearchInsurancePage widget.
  ApiCallResponse? getVehicleUsedTypeAPI;
  // Stores action output result for [Backend Call - API (teleGetProvinceAPI)] action in SearchInsurancePage widget.
  ApiCallResponse? getProvince;
  // Stores action output result for [Backend Call - Read Document] action in SearchInsurancePage widget.
  DataListRecord? masterDataQueryAction;
  // Stores action output result for [Backend Call - API (teleGetBrandAPI)] action in SearchInsurancePage widget.
  ApiCallResponse? getBrandEVAPI;
  // Stores action output result for [Backend Call - API (teleGetModelAPI )] action in SearchInsurancePage widget.
  ApiCallResponse? getModelEVAPI;
  // Stores action output result for [Backend Call - API (teleGetCoverTypeAPI)] action in SearchInsurancePage widget.
  ApiCallResponse? getCoverTypeEVAPI;
  // Stores action output result for [Backend Call - API (insuranceRequestGetVehicleAPI)] action in SearchInsurancePage widget.
  ApiCallResponse? getVehicleUsedTypeEVAPI;
  // Stores action output result for [Backend Call - API (teleGetProvinceAPI)] action in SearchInsurancePage widget.
  ApiCallResponse? getProvince2;
  // Stores action output result for [Backend Call - Read Document] action in SearchInsurancePage widget.
  DataListRecord? masterDataQueryActionEV;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  DataListRecord? masterDataQueryActionDriver;
  // Stores action output result for [Backend Call - API (GetOccupation)] action in Container widget.
  ApiCallResponse? getOccuAPIOutput;
  DateTime? datePicked;
  // State field(s) for Slider widget.
  double? sliderValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
