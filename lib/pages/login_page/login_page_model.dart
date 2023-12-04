import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'login_page_widget.dart' show LoginPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class LoginPageModel extends FlutterFlowModel<LoginPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - a11] action in LoginPage widget.
  String? getFCMToken;
  // Stores action output result for [Custom Action - getBuildVersion1] action in LoginPage widget.
  String? getBuildVersion;
  // Stores action output result for [Custom Action - a3] action in LoginPage widget.
  String? getAndroidImei;
  // Stores action output result for [Custom Action - a4] action in LoginPage widget.
  String? getIosImei;
  // State field(s) for UsernameTextField widget.
  FocusNode? usernameTextFieldFocusNode;
  TextEditingController? usernameTextFieldController;
  String? Function(BuildContext, String?)? usernameTextFieldControllerValidator;
  // State field(s) for PasswordTextField widget.
  FocusNode? passwordTextFieldFocusNode;
  TextEditingController? passwordTextFieldController;
  late bool passwordTextFieldVisibility;
  String? Function(BuildContext, String?)? passwordTextFieldControllerValidator;
  // Stores action output result for [Backend Call - API (authenAPI)] action in login_button widget.
  ApiCallResponse? authernApiOutput;
  // Stores action output result for [Backend Call - API (getUserProfileAPI)] action in login_button widget.
  ApiCallResponse? getUserProfileApiOutput;
  // Stores action output result for [Backend Call - API (getUserInsuranceLicense)] action in login_button widget.
  ApiCallResponse? getUserInsuranceLicense;
  // Stores action output result for [Custom Action - a13] action in login_button widget.
  String? customFirebaseAuthen;
  // Stores action output result for [Custom Action - a21] action in login_button widget.
  String? userUID;
  // Stores action output result for [Backend Call - Create Document] action in login_button widget.
  UserCustomRecord? createdUserCustom;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordTextFieldVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    usernameTextFieldFocusNode?.dispose();
    usernameTextFieldController?.dispose();

    passwordTextFieldFocusNode?.dispose();
    passwordTextFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
