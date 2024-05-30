import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/driver_infomation_form_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_driver_page_widget.dart' show AddDriverPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddDriverPageModel extends FlutterFlowModel<AddDriverPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for DriverInfomationFormComponent component.
  late DriverInfomationFormComponentModel driverInfomationFormComponentModel1;
  // Model for DriverInfomationFormComponent component.
  late DriverInfomationFormComponentModel driverInfomationFormComponentModel2;
  // Model for DriverInfomationFormComponent component.
  late DriverInfomationFormComponentModel driverInfomationFormComponentModel3;
  // Model for DriverInfomationFormComponent component.
  late DriverInfomationFormComponentModel driverInfomationFormComponentModel4;
  // Model for DriverInfomationFormComponent component.
  late DriverInfomationFormComponentModel driverInfomationFormComponentModel5;

  @override
  void initState(BuildContext context) {
    driverInfomationFormComponentModel1 =
        createModel(context, () => DriverInfomationFormComponentModel());
    driverInfomationFormComponentModel2 =
        createModel(context, () => DriverInfomationFormComponentModel());
    driverInfomationFormComponentModel3 =
        createModel(context, () => DriverInfomationFormComponentModel());
    driverInfomationFormComponentModel4 =
        createModel(context, () => DriverInfomationFormComponentModel());
    driverInfomationFormComponentModel5 =
        createModel(context, () => DriverInfomationFormComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    driverInfomationFormComponentModel1.dispose();
    driverInfomationFormComponentModel2.dispose();
    driverInfomationFormComponentModel3.dispose();
    driverInfomationFormComponentModel4.dispose();
    driverInfomationFormComponentModel5.dispose();
  }
}
