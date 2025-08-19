import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/components/show_image_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'driver_infomation_form_component_widget.dart'
    show DriverInfomationFormComponentWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DriverInfomationFormComponentModel
    extends FlutterFlowModel<DriverInfomationFormComponentWidget> {
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
  // State field(s) for ThaiIdTextfield widget.
  FocusNode? thaiIdTextfieldFocusNode;
  TextEditingController? thaiIdTextfieldTextController;
  late MaskTextInputFormatter thaiIdTextfieldMask;
  String? Function(BuildContext, String?)?
      thaiIdTextfieldTextControllerValidator;
  // State field(s) for DriverLicenseTextfield widget.
  FocusNode? driverLicenseTextfieldFocusNode1;
  TextEditingController? driverLicenseTextfieldTextController1;
  String? Function(BuildContext, String?)?
      driverLicenseTextfieldTextController1Validator;
  // State field(s) for DriverLicenseTextfield widget.
  FocusNode? driverLicenseTextfieldFocusNode2;
  TextEditingController? driverLicenseTextfieldTextController2;
  String? Function(BuildContext, String?)?
      driverLicenseTextfieldTextController2Validator;
  bool isDataUploading_driverUploadThaiIdImg = false;
  FFUploadedFile uploadedLocalFile_driverUploadThaiIdImg =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_driverUploadThaiIdImg = '';

  bool isDataUploading_driverUploadLicenseNoImg = false;
  FFUploadedFile uploadedLocalFile_driverUploadLicenseNoImg =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_driverUploadLicenseNoImg = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    firstnameTextfieldFocusNode?.dispose();
    firstnameTextfieldTextController?.dispose();

    address4LastnameTextfieldFocusNode?.dispose();
    address4LastnameTextfieldTextController?.dispose();

    thaiIdTextfieldFocusNode?.dispose();
    thaiIdTextfieldTextController?.dispose();

    driverLicenseTextfieldFocusNode1?.dispose();
    driverLicenseTextfieldTextController1?.dispose();

    driverLicenseTextfieldFocusNode2?.dispose();
    driverLicenseTextfieldTextController2?.dispose();
  }
}
