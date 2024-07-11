import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/components/infomation_customer_act_widget.dart';
import '/components/infomation_customer_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import 'dart:convert';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'insurance_info_page2_widget.dart' show InsuranceInfoPage2Widget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
  // Stores action output result for [Backend Call - API (insuranceRequestGetVehicleAPI)] action in insuranceInfoPage2 widget.
  ApiCallResponse? getVehicleUsedTypeAPI;
  // Model for infomationCustomer component.
  late InfomationCustomerModel infomationCustomerModel;
  // Model for infomationCustomerAct component.
  late InfomationCustomerActModel infomationCustomerActModel;
  // State field(s) for OldVmiTextField widget.
  FocusNode? oldVmiTextFieldFocusNode;
  TextEditingController? oldVmiTextFieldTextController;
  String? Function(BuildContext, String?)?
      oldVmiTextFieldTextControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  DateTime? datePicked3;
  // State field(s) for Vehicleregistration widget.
  FocusNode? vehicleregistrationFocusNode1;
  TextEditingController? vehicleregistrationTextController1;
  String? Function(BuildContext, String?)?
      vehicleregistrationTextController1Validator;
  // State field(s) for Vehicleregistration widget.
  FocusNode? vehicleregistrationFocusNode2;
  TextEditingController? vehicleregistrationTextController2;
  String? Function(BuildContext, String?)?
      vehicleregistrationTextController2Validator;
  // State field(s) for CarBodyNoTextField widget.
  FocusNode? carBodyNoTextFieldFocusNode;
  TextEditingController? carBodyNoTextFieldTextController;
  String? Function(BuildContext, String?)?
      carBodyNoTextFieldTextControllerValidator;
  // State field(s) for EnginNoTextField widget.
  FocusNode? enginNoTextFieldFocusNode;
  TextEditingController? enginNoTextFieldTextController;
  String? Function(BuildContext, String?)?
      enginNoTextFieldTextControllerValidator;
  // State field(s) for SeatAmountTextField widget.
  FocusNode? seatAmountTextFieldFocusNode;
  TextEditingController? seatAmountTextFieldTextController;
  final seatAmountTextFieldMask = MaskTextInputFormatter(mask: '##');
  String? Function(BuildContext, String?)?
      seatAmountTextFieldTextControllerValidator;
  // State field(s) for SizeTextField widget.
  FocusNode? sizeTextFieldFocusNode;
  TextEditingController? sizeTextFieldTextController;
  String? Function(BuildContext, String?)? sizeTextFieldTextControllerValidator;
  // State field(s) for WeightTextField widget.
  FocusNode? weightTextFieldFocusNode;
  TextEditingController? weightTextFieldTextController;
  final weightTextFieldMask = MaskTextInputFormatter(mask: '#####');
  String? Function(BuildContext, String?)?
      weightTextFieldTextControllerValidator;
  // State field(s) for BatteryNumberTextField widget.
  FocusNode? batteryNumberTextFieldFocusNode;
  TextEditingController? batteryNumberTextFieldTextController;
  String? Function(BuildContext, String?)?
      batteryNumberTextFieldTextControllerValidator;
  // State field(s) for BatteryNumber2TextField widget.
  FocusNode? batteryNumber2TextFieldFocusNode;
  TextEditingController? batteryNumber2TextFieldTextController;
  String? Function(BuildContext, String?)?
      batteryNumber2TextFieldTextControllerValidator;
  // State field(s) for WallChargeTextField widget.
  FocusNode? wallChargeTextFieldFocusNode;
  TextEditingController? wallChargeTextFieldTextController;
  String? Function(BuildContext, String?)?
      wallChargeTextFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (ibsApplicationsSave)] action in Button widget.
  ApiCallResponse? ibsAppAPIOutput;
  // Stores action output result for [Backend Call - API (ibsApplicationsDetail)] action in Button widget.
  ApiCallResponse? detailAPIOutput;

  @override
  void initState(BuildContext context) {
    infomationCustomerModel =
        createModel(context, () => InfomationCustomerModel());
    infomationCustomerActModel =
        createModel(context, () => InfomationCustomerActModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    infomationCustomerModel.dispose();
    infomationCustomerActModel.dispose();
    oldVmiTextFieldFocusNode?.dispose();
    oldVmiTextFieldTextController?.dispose();

    vehicleregistrationFocusNode1?.dispose();
    vehicleregistrationTextController1?.dispose();

    vehicleregistrationFocusNode2?.dispose();
    vehicleregistrationTextController2?.dispose();

    carBodyNoTextFieldFocusNode?.dispose();
    carBodyNoTextFieldTextController?.dispose();

    enginNoTextFieldFocusNode?.dispose();
    enginNoTextFieldTextController?.dispose();

    seatAmountTextFieldFocusNode?.dispose();
    seatAmountTextFieldTextController?.dispose();

    sizeTextFieldFocusNode?.dispose();
    sizeTextFieldTextController?.dispose();

    weightTextFieldFocusNode?.dispose();
    weightTextFieldTextController?.dispose();

    batteryNumberTextFieldFocusNode?.dispose();
    batteryNumberTextFieldTextController?.dispose();

    batteryNumber2TextFieldFocusNode?.dispose();
    batteryNumber2TextFieldTextController?.dispose();

    wallChargeTextFieldFocusNode?.dispose();
    wallChargeTextFieldTextController?.dispose();
  }
}
