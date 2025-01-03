import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/infomation_customer_act_widget.dart';
import '/components/infomation_customer_fire_insurance_widget.dart';
import '/components/infomation_customer_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import 'dart:convert';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'fire_insurance_info_page2_widget.dart'
    show FireInsuranceInfoPage2Widget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class FireInsuranceInfoPage2Model
    extends FlutterFlowModel<FireInsuranceInfoPage2Widget> {
  ///  Local state fields for this page.

  List<DriverDataStruct> newDataType = [];
  void addToNewDataType(DriverDataStruct item) => newDataType.add(item);
  void removeFromNewDataType(DriverDataStruct item) => newDataType.remove(item);
  void removeAtIndexFromNewDataType(int index) => newDataType.removeAt(index);
  void insertAtIndexInNewDataType(int index, DriverDataStruct item) =>
      newDataType.insert(index, item);
  void updateNewDataTypeAtIndex(
          int index, Function(DriverDataStruct) updateFn) =>
      newDataType[index] = updateFn(newDataType[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (teleGetProvinceAPI)] action in fireInsuranceInfoPage2 widget.
  ApiCallResponse? getProvince;
  // Stores action output result for [Backend Call - API (insuranceRequestGetVehicleAPI)] action in fireInsuranceInfoPage2 widget.
  ApiCallResponse? getVehicleUsedTypeAPI;
  // Model for infomationCustomerFireInsurance component.
  late InfomationCustomerFireInsuranceModel
      infomationCustomerFireInsuranceModel;
  // Model for infomationCustomer component.
  late InfomationCustomerModel infomationCustomerModel;
  // Model for infomationCustomerAct component.
  late InfomationCustomerActModel infomationCustomerActModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for WidthTextField widget.
  FocusNode? widthTextFieldFocusNode;
  TextEditingController? widthTextFieldTextController;
  String? Function(BuildContext, String?)?
      widthTextFieldTextControllerValidator;
  // State field(s) for LongTextField widget.
  FocusNode? longTextFieldFocusNode;
  TextEditingController? longTextFieldTextController;
  String? Function(BuildContext, String?)? longTextFieldTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController8;
  String? Function(BuildContext, String?)? textController8Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode7;
  TextEditingController? textController9;
  String? Function(BuildContext, String?)? textController9Validator;
  DateTime? datePicked;
  // Stores action output result for [Backend Call - API (ibsApplicationsSave)] action in Button widget.
  ApiCallResponse? ibsAppAPIOutput;
  // Stores action output result for [Backend Call - API (ibsApplicationsDetail)] action in Button widget.
  ApiCallResponse? detailAPIOutput;

  @override
  void initState(BuildContext context) {
    infomationCustomerFireInsuranceModel =
        createModel(context, () => InfomationCustomerFireInsuranceModel());
    infomationCustomerModel =
        createModel(context, () => InfomationCustomerModel());
    infomationCustomerActModel =
        createModel(context, () => InfomationCustomerActModel());
  }

  @override
  void dispose() {
    infomationCustomerFireInsuranceModel.dispose();
    infomationCustomerModel.dispose();
    infomationCustomerActModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    widthTextFieldFocusNode?.dispose();
    widthTextFieldTextController?.dispose();

    longTextFieldFocusNode?.dispose();
    longTextFieldTextController?.dispose();

    textFieldFocusNode3?.dispose();
    textController5?.dispose();

    textFieldFocusNode4?.dispose();
    textController6?.dispose();

    textFieldFocusNode5?.dispose();
    textController7?.dispose();

    textFieldFocusNode6?.dispose();
    textController8?.dispose();

    textFieldFocusNode7?.dispose();
    textController9?.dispose();
  }
}
