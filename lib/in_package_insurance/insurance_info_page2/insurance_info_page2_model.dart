import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'insurance_info_page2_widget.dart' show InsuranceInfoPage2Widget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class InsuranceInfoPage2Model
    extends FlutterFlowModel<InsuranceInfoPage2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (teleGetProvinceAPI)] action in insuranceInfoPage2 widget.
  ApiCallResponse? getProvince;
  // State field(s) for OldVmiTextField widget.
  FocusNode? oldVmiTextFieldFocusNode;
  TextEditingController? oldVmiTextFieldController;
  String? Function(BuildContext, String?)? oldVmiTextFieldControllerValidator;
  DateTime? datePicked;
  // State field(s) for Vehicleregistration widget.
  FocusNode? vehicleregistrationFocusNode1;
  TextEditingController? vehicleregistrationController1;
  String? Function(BuildContext, String?)?
      vehicleregistrationController1Validator;
  // State field(s) for Vehicleregistration widget.
  FocusNode? vehicleregistrationFocusNode2;
  TextEditingController? vehicleregistrationController2;
  String? Function(BuildContext, String?)?
      vehicleregistrationController2Validator;
  // State field(s) for CarBodyNoTextField widget.
  FocusNode? carBodyNoTextFieldFocusNode;
  TextEditingController? carBodyNoTextFieldController;
  String? Function(BuildContext, String?)?
      carBodyNoTextFieldControllerValidator;
  // State field(s) for EnginNoTextField widget.
  FocusNode? enginNoTextFieldFocusNode;
  TextEditingController? enginNoTextFieldController;
  String? Function(BuildContext, String?)? enginNoTextFieldControllerValidator;
  // State field(s) for SeatAmountTextField widget.
  FocusNode? seatAmountTextFieldFocusNode;
  TextEditingController? seatAmountTextFieldController;
  final seatAmountTextFieldMask = MaskTextInputFormatter(mask: '##');
  String? Function(BuildContext, String?)?
      seatAmountTextFieldControllerValidator;
  // State field(s) for SizeTextField widget.
  FocusNode? sizeTextFieldFocusNode;
  TextEditingController? sizeTextFieldController;
  String? Function(BuildContext, String?)? sizeTextFieldControllerValidator;
  // State field(s) for WeightTextField widget.
  FocusNode? weightTextFieldFocusNode;
  TextEditingController? weightTextFieldController;
  final weightTextFieldMask = MaskTextInputFormatter(mask: '#####');
  String? Function(BuildContext, String?)? weightTextFieldControllerValidator;
  // Stores action output result for [Backend Call - API (ibsApplicationsSave)] action in Button widget.
  ApiCallResponse? ibsAppAPIOutput;
  // Stores action output result for [Backend Call - API (ibsApplicationsDetail)] action in Button widget.
  ApiCallResponse? detailAPIOutput;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    oldVmiTextFieldFocusNode?.dispose();
    oldVmiTextFieldController?.dispose();

    vehicleregistrationFocusNode1?.dispose();
    vehicleregistrationController1?.dispose();

    vehicleregistrationFocusNode2?.dispose();
    vehicleregistrationController2?.dispose();

    carBodyNoTextFieldFocusNode?.dispose();
    carBodyNoTextFieldController?.dispose();

    enginNoTextFieldFocusNode?.dispose();
    enginNoTextFieldController?.dispose();

    seatAmountTextFieldFocusNode?.dispose();
    seatAmountTextFieldController?.dispose();

    sizeTextFieldFocusNode?.dispose();
    sizeTextFieldController?.dispose();

    weightTextFieldFocusNode?.dispose();
    weightTextFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
