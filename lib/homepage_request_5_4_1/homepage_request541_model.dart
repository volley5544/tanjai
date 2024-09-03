import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import 'dart:convert';
import 'dart:ui';
import 'homepage_request541_widget.dart' show HomepageRequest541Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class HomepageRequest541Model
    extends FlutterFlowModel<HomepageRequest541Widget> {
  ///  Local state fields for this page.

  String? eventName;

  String? eventId;

  String? eventData;

  String? eventRetry;

  dynamic eventJson;

  bool isConnecting = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (timerApi)] action in Homepage_Request_5_4_1 widget.
  ApiCallResponse? timerApiOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
