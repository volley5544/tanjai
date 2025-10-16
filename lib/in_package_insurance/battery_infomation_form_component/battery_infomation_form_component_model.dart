import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'battery_infomation_form_component_widget.dart'
    show BatteryInfomationFormComponentWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BatteryInfomationFormComponentModel
    extends FlutterFlowModel<BatteryInfomationFormComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for BatteryNumberTextfield widget.
  FocusNode? batteryNumberTextfieldFocusNode;
  TextEditingController? batteryNumberTextfieldTextController;
  String? Function(BuildContext, String?)?
      batteryNumberTextfieldTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for BatteryPriceTextfield widget.
  FocusNode? batteryPriceTextfieldFocusNode;
  TextEditingController? batteryPriceTextfieldTextController;
  String? Function(BuildContext, String?)?
      batteryPriceTextfieldTextControllerValidator;
  // State field(s) for BatterySumInsuredTextfield widget.
  FocusNode? batterySumInsuredTextfieldFocusNode;
  TextEditingController? batterySumInsuredTextfieldTextController;
  String? Function(BuildContext, String?)?
      batterySumInsuredTextfieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    batteryNumberTextfieldFocusNode?.dispose();
    batteryNumberTextfieldTextController?.dispose();

    batteryPriceTextfieldFocusNode?.dispose();
    batteryPriceTextfieldTextController?.dispose();

    batterySumInsuredTextfieldFocusNode?.dispose();
    batterySumInsuredTextfieldTextController?.dispose();
  }
}
