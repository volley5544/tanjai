import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_leads_page_widget.dart' show AddLeadsPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddLeadsPageModel extends FlutterFlowModel<AddLeadsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for firstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameController;
  String? Function(BuildContext, String?)? firstNameControllerValidator;
  // State field(s) for lastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameController;
  String? Function(BuildContext, String?)? lastNameControllerValidator;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberController;
  final phoneNumberMask = MaskTextInputFormatter(mask: '###-###-####');
  String? Function(BuildContext, String?)? phoneNumberControllerValidator;
  // State field(s) for remark widget.
  FocusNode? remarkFocusNode;
  TextEditingController? remarkController;
  String? Function(BuildContext, String?)? remarkControllerValidator;
  // Stores action output result for [Backend Call - API (GetTokenLeadManagement)] action in Button widget.
  ApiCallResponse? getToken;
  // Stores action output result for [Backend Call - API (LeadManagementCheckDuplicate)] action in Button widget.
  ApiCallResponse? checkDupApi;
  // Stores action output result for [Backend Call - API (LeadManagementSave)] action in Button widget.
  ApiCallResponse? saveLeadApi;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    firstNameFocusNode?.dispose();
    firstNameController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberController?.dispose();

    remarkFocusNode?.dispose();
    remarkController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
