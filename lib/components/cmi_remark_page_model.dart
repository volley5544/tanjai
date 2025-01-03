import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'cmi_remark_page_widget.dart' show CmiRemarkPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CmiRemarkPageModel extends FlutterFlowModel<CmiRemarkPageWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for CarryPurposeTextField widget.
  FocusNode? carryPurposeTextFieldFocusNode;
  TextEditingController? carryPurposeTextFieldTextController;
  String? Function(BuildContext, String?)?
      carryPurposeTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    carryPurposeTextFieldFocusNode?.dispose();
    carryPurposeTextFieldTextController?.dispose();
  }
}
