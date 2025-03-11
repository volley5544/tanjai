import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'search7_renew1_widget.dart' show Search7Renew1Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Search7Renew1Model extends FlutterFlowModel<Search7Renew1Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for CusNameTextField widget.
  FocusNode? cusNameTextFieldFocusNode1;
  TextEditingController? cusNameTextFieldTextController1;
  String? Function(BuildContext, String?)?
      cusNameTextFieldTextController1Validator;
  // State field(s) for CusNameTextField widget.
  FocusNode? cusNameTextFieldFocusNode2;
  TextEditingController? cusNameTextFieldTextController2;
  String? Function(BuildContext, String?)?
      cusNameTextFieldTextController2Validator;
  // State field(s) for CusNameTextField widget.
  FocusNode? cusNameTextFieldFocusNode3;
  TextEditingController? cusNameTextFieldTextController3;
  String? Function(BuildContext, String?)?
      cusNameTextFieldTextController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textFieldTextController;
  String? Function(BuildContext, String?)? textFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    cusNameTextFieldFocusNode1?.dispose();
    cusNameTextFieldTextController1?.dispose();

    cusNameTextFieldFocusNode2?.dispose();
    cusNameTextFieldTextController2?.dispose();

    cusNameTextFieldFocusNode3?.dispose();
    cusNameTextFieldTextController3?.dispose();

    textFieldFocusNode?.dispose();
    textFieldTextController?.dispose();
  }
}
