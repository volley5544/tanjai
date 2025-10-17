import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'add_motor_page_widget.dart' show AddMotorPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddMotorPageModel extends FlutterFlowModel<AddMotorPageWidget> {
  ///  Local state fields for this page.

  int? motorAmount = 1;

  int? loopCount = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Motor1Textfield widget.
  FocusNode? motor1TextfieldFocusNode;
  TextEditingController? motor1TextfieldTextController;
  String? Function(BuildContext, String?)?
      motor1TextfieldTextControllerValidator;
  // State field(s) for Motor2Textfield widget.
  FocusNode? motor2TextfieldFocusNode;
  TextEditingController? motor2TextfieldTextController;
  String? Function(BuildContext, String?)?
      motor2TextfieldTextControllerValidator;
  // State field(s) for Motor3Textfield widget.
  FocusNode? motor3TextfieldFocusNode;
  TextEditingController? motor3TextfieldTextController;
  String? Function(BuildContext, String?)?
      motor3TextfieldTextControllerValidator;
  // State field(s) for Motor4Textfield widget.
  FocusNode? motor4TextfieldFocusNode;
  TextEditingController? motor4TextfieldTextController;
  String? Function(BuildContext, String?)?
      motor4TextfieldTextControllerValidator;
  // State field(s) for Motor5Textfield widget.
  FocusNode? motor5TextfieldFocusNode;
  TextEditingController? motor5TextfieldTextController;
  String? Function(BuildContext, String?)?
      motor5TextfieldTextControllerValidator;
  // State field(s) for Motor6extfield widget.
  FocusNode? motor6extfieldFocusNode;
  TextEditingController? motor6extfieldTextController;
  String? Function(BuildContext, String?)?
      motor6extfieldTextControllerValidator;
  // State field(s) for Motor7Textfield widget.
  FocusNode? motor7TextfieldFocusNode;
  TextEditingController? motor7TextfieldTextController;
  String? Function(BuildContext, String?)?
      motor7TextfieldTextControllerValidator;
  // State field(s) for Motor8Textfield widget.
  FocusNode? motor8TextfieldFocusNode;
  TextEditingController? motor8TextfieldTextController;
  String? Function(BuildContext, String?)?
      motor8TextfieldTextControllerValidator;
  // State field(s) for Motor9Textfield widget.
  FocusNode? motor9TextfieldFocusNode;
  TextEditingController? motor9TextfieldTextController;
  String? Function(BuildContext, String?)?
      motor9TextfieldTextControllerValidator;
  // State field(s) for Motor10Textfield widget.
  FocusNode? motor10TextfieldFocusNode;
  TextEditingController? motor10TextfieldTextController;
  String? Function(BuildContext, String?)?
      motor10TextfieldTextControllerValidator;
  // State field(s) for Motor11Textfield widget.
  FocusNode? motor11TextfieldFocusNode;
  TextEditingController? motor11TextfieldTextController;
  String? Function(BuildContext, String?)?
      motor11TextfieldTextControllerValidator;
  // State field(s) for Motor12Textfield widget.
  FocusNode? motor12TextfieldFocusNode;
  TextEditingController? motor12TextfieldTextController;
  String? Function(BuildContext, String?)?
      motor12TextfieldTextControllerValidator;
  // State field(s) for Motor13Textfield widget.
  FocusNode? motor13TextfieldFocusNode;
  TextEditingController? motor13TextfieldTextController;
  String? Function(BuildContext, String?)?
      motor13TextfieldTextControllerValidator;
  // State field(s) for Motor14Textfield widget.
  FocusNode? motor14TextfieldFocusNode;
  TextEditingController? motor14TextfieldTextController;
  String? Function(BuildContext, String?)?
      motor14TextfieldTextControllerValidator;
  // State field(s) for Motor15Textfield widget.
  FocusNode? motor15TextfieldFocusNode;
  TextEditingController? motor15TextfieldTextController;
  String? Function(BuildContext, String?)?
      motor15TextfieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    motor1TextfieldFocusNode?.dispose();
    motor1TextfieldTextController?.dispose();

    motor2TextfieldFocusNode?.dispose();
    motor2TextfieldTextController?.dispose();

    motor3TextfieldFocusNode?.dispose();
    motor3TextfieldTextController?.dispose();

    motor4TextfieldFocusNode?.dispose();
    motor4TextfieldTextController?.dispose();

    motor5TextfieldFocusNode?.dispose();
    motor5TextfieldTextController?.dispose();

    motor6extfieldFocusNode?.dispose();
    motor6extfieldTextController?.dispose();

    motor7TextfieldFocusNode?.dispose();
    motor7TextfieldTextController?.dispose();

    motor8TextfieldFocusNode?.dispose();
    motor8TextfieldTextController?.dispose();

    motor9TextfieldFocusNode?.dispose();
    motor9TextfieldTextController?.dispose();

    motor10TextfieldFocusNode?.dispose();
    motor10TextfieldTextController?.dispose();

    motor11TextfieldFocusNode?.dispose();
    motor11TextfieldTextController?.dispose();

    motor12TextfieldFocusNode?.dispose();
    motor12TextfieldTextController?.dispose();

    motor13TextfieldFocusNode?.dispose();
    motor13TextfieldTextController?.dispose();

    motor14TextfieldFocusNode?.dispose();
    motor14TextfieldTextController?.dispose();

    motor15TextfieldFocusNode?.dispose();
    motor15TextfieldTextController?.dispose();
  }
}
