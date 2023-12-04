import '/backend/api_requests/api_calls.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'insurance_info_page5_widget.dart' show InsuranceInfoPage5Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class InsuranceInfoPage5Model
    extends FlutterFlowModel<InsuranceInfoPage5Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getDateTimeAPI)] action in insuranceInfoPage5 widget.
  ApiCallResponse? getDateTimeOutput;
  // Stores action output result for [Backend Call - API (insuranceRequestGetInsurerAPI)] action in insuranceInfoPage5 widget.
  ApiCallResponse? getInsurer;
  // Stores action output result for [Backend Call - API (ibsApplicationsDetail)] action in insuranceInfoPage5 widget.
  ApiCallResponse? applicationDetailOutput;
  // Stores action output result for [Backend Call - API (getInsurancePolicyApi)] action in insuranceInfoPage5 widget.
  ApiCallResponse? getPolicy;
  // Stores action output result for [Backend Call - API (getDateTimeAPI)] action in Icon widget.
  ApiCallResponse? getDateTimeOutput2;
  // Stores action output result for [Backend Call - API (getInsurancePolicyApi)] action in Icon widget.
  ApiCallResponse? getPolicyRefreshButton;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
