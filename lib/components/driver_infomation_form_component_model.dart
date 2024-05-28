import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/components/show_image_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'driver_infomation_form_component_widget.dart'
    show DriverInfomationFormComponentWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DriverInfomationFormComponentModel
    extends FlutterFlowModel<DriverInfomationFormComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  // State field(s) for address4 widget.
  FocusNode? address4FocusNode1;
  TextEditingController? address4TextController1;
  String? Function(BuildContext, String?)? address4TextController1Validator;
  // State field(s) for address4 widget.
  FocusNode? address4FocusNode2;
  TextEditingController? address4TextController2;
  String? Function(BuildContext, String?)? address4TextController2Validator;
  DateTime? datePicked;
  // State field(s) for ThaiIdTextfield widget.
  FocusNode? thaiIdTextfieldFocusNode;
  TextEditingController? thaiIdTextfieldTextController;
  final thaiIdTextfieldMask = MaskTextInputFormatter(mask: '#-####-#####-##-#');
  String? Function(BuildContext, String?)?
      thaiIdTextfieldTextControllerValidator;
  // State field(s) for DriverLicenseTextfield widget.
  FocusNode? driverLicenseTextfieldFocusNode;
  TextEditingController? driverLicenseTextfieldTextController;
  String? Function(BuildContext, String?)?
      driverLicenseTextfieldTextControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController.dispose();
    address4FocusNode1?.dispose();
    address4TextController1?.dispose();

    address4FocusNode2?.dispose();
    address4TextController2?.dispose();

    thaiIdTextfieldFocusNode?.dispose();
    thaiIdTextfieldTextController?.dispose();

    driverLicenseTextfieldFocusNode?.dispose();
    driverLicenseTextfieldTextController?.dispose();
  }
}
