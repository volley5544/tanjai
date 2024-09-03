import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/infomation_customer_act_widget.dart';
import '/components/infomation_customer_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import 'dart:convert';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'insurance_info_page1_widget.dart' show InsuranceInfoPage1Widget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class InsuranceInfoPage1Model
    extends FlutterFlowModel<InsuranceInfoPage1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (insuranceRequestGetInsurerAPI)] action in insuranceInfoPage1 widget.
  ApiCallResponse? getInsurer;
  // Stores action output result for [Backend Call - API (GetLicenseList)] action in insuranceInfoPage1 widget.
  ApiCallResponse? getLicenseAPIOutoutCopy;
  // Stores action output result for [Backend Call - API (GetOccupation)] action in insuranceInfoPage1 widget.
  ApiCallResponse? getOccuAPIOutput;
  // Stores action output result for [Backend Call - API (ibsApplicationsDetail)] action in insuranceInfoPage1 widget.
  ApiCallResponse? detailAPIOutput;
  // Stores action output result for [Backend Call - API (getProfileImage)] action in insuranceInfoPage1 widget.
  ApiCallResponse? profileImgOutputPage;
  // Model for infomationCustomer component.
  late InfomationCustomerModel infomationCustomerModel;
  // Model for infomationCustomerAct component.
  late InfomationCustomerActModel infomationCustomerActModel;
  // State field(s) for IdCardTextField widget.
  FocusNode? idCardTextFieldFocusNode1;
  TextEditingController? idCardTextFieldTextController1;
  final idCardTextFieldMask1 =
      MaskTextInputFormatter(mask: '#-####-#####-##-#');
  String? Function(BuildContext, String?)?
      idCardTextFieldTextController1Validator;
  // Stores action output result for [Backend Call - API (checkBlackList)] action in Container widget.
  ApiCallResponse? checkBlackListOutput;
  // State field(s) for TaxIDCardTextField widget.
  FocusNode? taxIDCardTextFieldFocusNode;
  TextEditingController? taxIDCardTextFieldTextController;
  final taxIDCardTextFieldMask =
      MaskTextInputFormatter(mask: '#-####-#####-##-#');
  String? Function(BuildContext, String?)?
      taxIDCardTextFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (checkBlackList)] action in Container widget.
  ApiCallResponse? checkBlackListOutput3;
  // State field(s) for IdCardTextField widget.
  FocusNode? idCardTextFieldFocusNode2;
  TextEditingController? idCardTextFieldTextController2;
  String? Function(BuildContext, String?)?
      idCardTextFieldTextController2Validator;
  // Stores action output result for [Backend Call - API (checkBlackList)] action in Container widget.
  ApiCallResponse? checkBlackListOutput2;
  // State field(s) for CusNameTextField widget.
  FocusNode? cusNameTextFieldFocusNode;
  TextEditingController? cusNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      cusNameTextFieldTextControllerValidator;
  // State field(s) for CusLastnameTextField widget.
  FocusNode? cusLastnameTextFieldFocusNode;
  TextEditingController? cusLastnameTextFieldTextController;
  String? Function(BuildContext, String?)?
      cusLastnameTextFieldTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for AgeTextField widget.
  FocusNode? ageTextFieldFocusNode;
  TextEditingController? ageTextFieldTextController;
  String? Function(BuildContext, String?)? ageTextFieldTextControllerValidator;
  // State field(s) for CusOcputationTextField widget.
  FocusNode? cusOcputationTextFieldFocusNode;
  TextEditingController? cusOcputationTextFieldTextController;
  String? Function(BuildContext, String?)?
      cusOcputationTextFieldTextControllerValidator;
  // State field(s) for CusPhoneTextField widget.
  FocusNode? cusPhoneTextFieldFocusNode;
  TextEditingController? cusPhoneTextFieldTextController;
  final cusPhoneTextFieldMask = MaskTextInputFormatter(mask: '###-###-####');
  String? Function(BuildContext, String?)?
      cusPhoneTextFieldTextControllerValidator;
  // State field(s) for CusPhoneOtherTextField widget.
  FocusNode? cusPhoneOtherTextFieldFocusNode;
  TextEditingController? cusPhoneOtherTextFieldTextController;
  final cusPhoneOtherTextFieldMask =
      MaskTextInputFormatter(mask: '###-###-####');
  String? Function(BuildContext, String?)?
      cusPhoneOtherTextFieldTextControllerValidator;
  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode;
  TextEditingController? emailTextFieldTextController;
  String? Function(BuildContext, String?)?
      emailTextFieldTextControllerValidator;
  // State field(s) for licenseCode widget.
  FocusNode? licenseCodeFocusNode;
  TextEditingController? licenseCodeTextController;
  String? Function(BuildContext, String?)? licenseCodeTextControllerValidator;
  // Stores action output result for [Backend Call - API (getProfileImage)] action in Container widget.
  ApiCallResponse? profileImgOutput;
  // State field(s) for vedioCallLink widget.
  FocusNode? vedioCallLinkFocusNode;
  TextEditingController? vedioCallLinkTextController;
  String? Function(BuildContext, String?)? vedioCallLinkTextControllerValidator;
  // Stores action output result for [Backend Call - API (ibsApplicationsSave)] action in Button widget.
  ApiCallResponse? ibsAppSaveAPIoutput;
  // Stores action output result for [Backend Call - API (ibsApplicationsSave)] action in Button widget.
  ApiCallResponse? ibsAppSaveAPIoutputCMI;

  @override
  void initState(BuildContext context) {
    infomationCustomerModel =
        createModel(context, () => InfomationCustomerModel());
    infomationCustomerActModel =
        createModel(context, () => InfomationCustomerActModel());
  }

  @override
  void dispose() {
    infomationCustomerModel.dispose();
    infomationCustomerActModel.dispose();
    idCardTextFieldFocusNode1?.dispose();
    idCardTextFieldTextController1?.dispose();

    taxIDCardTextFieldFocusNode?.dispose();
    taxIDCardTextFieldTextController?.dispose();

    idCardTextFieldFocusNode2?.dispose();
    idCardTextFieldTextController2?.dispose();

    cusNameTextFieldFocusNode?.dispose();
    cusNameTextFieldTextController?.dispose();

    cusLastnameTextFieldFocusNode?.dispose();
    cusLastnameTextFieldTextController?.dispose();

    ageTextFieldFocusNode?.dispose();
    ageTextFieldTextController?.dispose();

    cusOcputationTextFieldFocusNode?.dispose();
    cusOcputationTextFieldTextController?.dispose();

    cusPhoneTextFieldFocusNode?.dispose();
    cusPhoneTextFieldTextController?.dispose();

    cusPhoneOtherTextFieldFocusNode?.dispose();
    cusPhoneOtherTextFieldTextController?.dispose();

    emailTextFieldFocusNode?.dispose();
    emailTextFieldTextController?.dispose();

    licenseCodeFocusNode?.dispose();
    licenseCodeTextController?.dispose();

    vedioCallLinkFocusNode?.dispose();
    vedioCallLinkTextController?.dispose();
  }
}
