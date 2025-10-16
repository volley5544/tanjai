import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/in_package_insurance/battery_infomation_form_component/battery_infomation_form_component_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_battery_page_widget.dart' show AddBatteryPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddBatteryPageModel extends FlutterFlowModel<AddBatteryPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BatteryInfomationFormComponent component.
  late BatteryInfomationFormComponentModel batteryInfomationFormComponentModel;

  @override
  void initState(BuildContext context) {
    batteryInfomationFormComponentModel =
        createModel(context, () => BatteryInfomationFormComponentModel());
  }

  @override
  void dispose() {
    batteryInfomationFormComponentModel.dispose();
  }
}
