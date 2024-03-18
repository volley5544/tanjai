import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'check_act_widget.dart' show CheckActWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CheckActModel extends FlutterFlowModel<CheckActWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for searchFirstname widget.
  FocusNode? searchFirstnameFocusNode1;
  TextEditingController? searchFirstnameController1;
  String? Function(BuildContext, String?)? searchFirstnameController1Validator;
  // State field(s) for searchFirstname widget.
  FocusNode? searchFirstnameFocusNode2;
  TextEditingController? searchFirstnameController2;
  String? Function(BuildContext, String?)? searchFirstnameController2Validator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchFirstnameFocusNode1?.dispose();
    searchFirstnameController1?.dispose();

    searchFirstnameFocusNode2?.dispose();
    searchFirstnameController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
