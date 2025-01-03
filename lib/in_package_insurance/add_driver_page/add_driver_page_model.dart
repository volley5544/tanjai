import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/driver_infomation_form_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_driver_page_widget.dart' show AddDriverPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddDriverPageModel extends FlutterFlowModel<AddDriverPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for DriverInfomationFormComponent component.
  late DriverInfomationFormComponentModel driverInfomationFormComponentModel;

  @override
  void initState(BuildContext context) {
    driverInfomationFormComponentModel =
        createModel(context, () => DriverInfomationFormComponentModel());
  }

  @override
  void dispose() {
    driverInfomationFormComponentModel.dispose();
  }
}
