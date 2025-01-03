import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'email1_widget.dart' show Email1Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class Email1Model extends FlutterFlowModel<Email1Widget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - enoughEmail] action in Email_1 widget.
  List<String>? subjectEmailOutput;
  // Stores action output result for [Custom Action - enoughEmail] action in Email_1 widget.
  List<String>? contentEmailOutput;
  // Stores action output result for [Custom Action - enoughEmail] action in Email_1 widget.
  List<String>? fromEmailOutput;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
