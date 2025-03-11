import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'people_fire_infomation_form_component_widget.dart'
    show PeopleFireInfomationFormComponentWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PeopleFireInfomationFormComponentModel
    extends FlutterFlowModel<PeopleFireInfomationFormComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for FirstnameTextfield widget.
  FocusNode? firstnameTextfieldFocusNode;
  TextEditingController? firstnameTextfieldTextController;
  String? Function(BuildContext, String?)?
      firstnameTextfieldTextControllerValidator;
  // State field(s) for address4LastnameTextfield widget.
  FocusNode? address4LastnameTextfieldFocusNode;
  TextEditingController? address4LastnameTextfieldTextController;
  String? Function(BuildContext, String?)?
      address4LastnameTextfieldTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for BenefitorNameTextfield widget.
  FocusNode? benefitorNameTextfieldFocusNode;
  TextEditingController? benefitorNameTextfieldTextController;
  String? Function(BuildContext, String?)?
      benefitorNameTextfieldTextControllerValidator;
  // State field(s) for RelationshipTextField widget.
  FocusNode? relationshipTextFieldFocusNode;
  TextEditingController? relationshipTextFieldTextController;
  String? Function(BuildContext, String?)?
      relationshipTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    firstnameTextfieldFocusNode?.dispose();
    firstnameTextfieldTextController?.dispose();

    address4LastnameTextfieldFocusNode?.dispose();
    address4LastnameTextfieldTextController?.dispose();

    benefitorNameTextfieldFocusNode?.dispose();
    benefitorNameTextfieldTextController?.dispose();

    relationshipTextFieldFocusNode?.dispose();
    relationshipTextFieldTextController?.dispose();
  }
}
