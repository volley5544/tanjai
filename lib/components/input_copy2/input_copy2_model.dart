import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'input_copy2_widget.dart' show InputCopy2Widget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InputCopy2Model extends FlutterFlowModel<InputCopy2Widget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for reasonCancel widget.
  FocusNode? reasonCancelFocusNode;
  TextEditingController? reasonCancelController;
  String? Function(BuildContext, String?)? reasonCancelControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    reasonCancelFocusNode?.dispose();
    reasonCancelController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
