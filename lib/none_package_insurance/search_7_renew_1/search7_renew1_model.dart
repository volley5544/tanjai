import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'search7_renew1_widget.dart' show Search7Renew1Widget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Search7Renew1Model extends FlutterFlowModel<Search7Renew1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for CusNameTextField widget.
  FocusNode? cusNameTextFieldFocusNode1;
  TextEditingController? cusNameTextFieldController1;
  String? Function(BuildContext, String?)? cusNameTextFieldController1Validator;
  // State field(s) for CusNameTextField widget.
  FocusNode? cusNameTextFieldFocusNode2;
  TextEditingController? cusNameTextFieldController2;
  String? Function(BuildContext, String?)? cusNameTextFieldController2Validator;
  // State field(s) for CusNameTextField widget.
  FocusNode? cusNameTextFieldFocusNode3;
  TextEditingController? cusNameTextFieldController3;
  String? Function(BuildContext, String?)? cusNameTextFieldController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textFieldController;
  String? Function(BuildContext, String?)? textFieldControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    cusNameTextFieldFocusNode1?.dispose();
    cusNameTextFieldController1?.dispose();

    cusNameTextFieldFocusNode2?.dispose();
    cusNameTextFieldController2?.dispose();

    cusNameTextFieldFocusNode3?.dispose();
    cusNameTextFieldController3?.dispose();

    textFieldFocusNode?.dispose();
    textFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
