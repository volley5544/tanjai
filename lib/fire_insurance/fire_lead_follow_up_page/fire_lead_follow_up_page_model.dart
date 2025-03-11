import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
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
import '/index.dart';
import 'fire_lead_follow_up_page_widget.dart' show FireLeadFollowUpPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class FireLeadFollowUpPageModel
    extends FlutterFlowModel<FireLeadFollowUpPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getBuildVersion1] action in fireLeadFollowUpPage widget.
  String? getBuildVersion;
  // Stores action output result for [Custom Action - getBuildNumber] action in fireLeadFollowUpPage widget.
  int? deviceBuildNumber;
  // Stores action output result for [Firestore Query - Query a collection] action in fireLeadFollowUpPage widget.
  BuildVersionRecord? buildVersionQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in fireLeadFollowUpPage widget.
  AuthorizationRecord? adminVersionQuery;
  // Stores action output result for [Backend Call - API (GetListFireApi)] action in fireLeadFollowUpPage widget.
  ApiCallResponse? getListFireApi;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
