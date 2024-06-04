import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/driver_infomation_form_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_driver_page_widget.dart' show AddDriverPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddDriverPageModel extends FlutterFlowModel<AddDriverPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for DriverInfomationFormComponent dynamic component.
  late FlutterFlowDynamicModels<DriverInfomationFormComponentModel>
      driverInfomationFormComponentModels;

  @override
  void initState(BuildContext context) {
    driverInfomationFormComponentModels =
        FlutterFlowDynamicModels(() => DriverInfomationFormComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    driverInfomationFormComponentModels.dispose();
  }
}
