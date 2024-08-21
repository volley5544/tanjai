import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'text_field_component_widget.dart' show TextFieldComponentWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class TextFieldComponentModel
    extends FlutterFlowModel<TextFieldComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for CarryPurposeTextField widget.
  FocusNode? carryPurposeTextFieldFocusNode1;
  TextEditingController? carryPurposeTextFieldTextController1;
  String? Function(BuildContext, String?)?
      carryPurposeTextFieldTextController1Validator;
  // State field(s) for CarryPurposeTextField widget.
  FocusNode? carryPurposeTextFieldFocusNode2;
  TextEditingController? carryPurposeTextFieldTextController2;
  String? Function(BuildContext, String?)?
      carryPurposeTextFieldTextController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    carryPurposeTextFieldFocusNode1?.dispose();
    carryPurposeTextFieldTextController1?.dispose();

    carryPurposeTextFieldFocusNode2?.dispose();
    carryPurposeTextFieldTextController2?.dispose();
  }
}
