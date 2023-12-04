import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'none_package_selected_insurer_page_widget.dart'
    show NonePackageSelectedInsurerPageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class NonePackageSelectedInsurerPageModel
    extends FlutterFlowModel<NonePackageSelectedInsurerPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for netPremium widget.
  FocusNode? netPremiumFocusNode;
  TextEditingController? netPremiumController;
  String? Function(BuildContext, String?)? netPremiumControllerValidator;
  // State field(s) for actAmount widget.
  FocusNode? actAmountFocusNode;
  TextEditingController? actAmountController;
  String? Function(BuildContext, String?)? actAmountControllerValidator;
  // State field(s) for accessoryTotal widget.
  FocusNode? accessoryTotalFocusNode;
  TextEditingController? accessoryTotalController;
  String? Function(BuildContext, String?)? accessoryTotalControllerValidator;
  // Stores action output result for [Backend Call - API (saveInsurerAPI)] action in Button widget.
  ApiCallResponse? saveInirer;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    netPremiumFocusNode?.dispose();
    netPremiumController?.dispose();

    actAmountFocusNode?.dispose();
    actAmountController?.dispose();

    accessoryTotalFocusNode?.dispose();
    accessoryTotalController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
