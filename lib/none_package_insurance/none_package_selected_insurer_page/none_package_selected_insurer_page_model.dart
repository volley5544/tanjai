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
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'none_package_selected_insurer_page_widget.dart'
    show NonePackageSelectedInsurerPageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class NonePackageSelectedInsurerPageModel
    extends FlutterFlowModel<NonePackageSelectedInsurerPageWidget> {
  ///  Local state fields for this page.

  bool flagActStateVariable = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for netPremium widget.
  FocusNode? netPremiumFocusNode;
  TextEditingController? netPremiumTextController;
  String? Function(BuildContext, String?)? netPremiumTextControllerValidator;
  // State field(s) for actAmount widget.
  FocusNode? actAmountFocusNode;
  TextEditingController? actAmountTextController;
  String? Function(BuildContext, String?)? actAmountTextControllerValidator;
  // State field(s) for accessoryTotal widget.
  FocusNode? accessoryTotalFocusNode;
  TextEditingController? accessoryTotalTextController;
  String? Function(BuildContext, String?)?
      accessoryTotalTextControllerValidator;
  // Stores action output result for [Backend Call - API (saveInsurerAPI)] action in Button widget.
  ApiCallResponse? saveInirer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    netPremiumFocusNode?.dispose();
    netPremiumTextController?.dispose();

    actAmountFocusNode?.dispose();
    actAmountTextController?.dispose();

    accessoryTotalFocusNode?.dispose();
    accessoryTotalTextController?.dispose();
  }
}
