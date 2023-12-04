import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/components/qr_code_show_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'my_account_page_widget.dart' show MyAccountPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MyAccountPageModel extends FlutterFlowModel<MyAccountPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - getBuildVersion1] action in MyAccountPage widget.
  String? getBuildVersion;
  // Stores action output result for [Custom Action - deleteAccFirebase] action in Button widget.
  bool? deleteAccOutput;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
