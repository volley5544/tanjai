import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/schema/structs/index.dart';
import '/components/effective_date_picker_component_widget.dart';
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
import 'insurance_info_page42_widget.dart' show InsuranceInfoPage42Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class InsuranceInfoPage42Model
    extends FlutterFlowModel<InsuranceInfoPage42Widget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (insuranceRequestGetInsurerAPI)] action in insuranceInfoPage4_2 widget.
  ApiCallResponse? getInsurer;
  // Stores action output result for [Backend Call - API (ibsApplicationsDetail)] action in insuranceInfoPage4_2 widget.
  ApiCallResponse? ibsDetailAPIOutput;
  // Stores action output result for [Backend Call - API (ibsCalculateInstallment)] action in insuranceInfoPage4_2 widget.
  ApiCallResponse? calInstallmentAPIOutput;
  // Stores action output result for [Backend Call - API (ibsApplicationsDetail)] action in Column widget.
  ApiCallResponse? ibsDetailAPIOutputCopy;
  // Model for infomationCustomer component.
  late InfomationCustomerModel infomationCustomerModel;
  // Model for infomationCustomerFireInsurance component.
  late InfomationCustomerFireInsuranceModel
      infomationCustomerFireInsuranceModel;
  // Model for infomationCustomerAct component.
  late InfomationCustomerActModel infomationCustomerActModel;
  // Stores action output result for [Backend Call - API (ibsApplicationsDetail)] action in Icon widget.
  ApiCallResponse? ibsDetailAPIOutputCopyRefresh;
  // State field(s) for paymentType widget.
  FocusNode? paymentTypeFocusNode;
  TextEditingController? paymentTypeTextController;
  String? Function(BuildContext, String?)? paymentTypeTextControllerValidator;
  // State field(s) for paymentChannel widget.
  FocusNode? paymentChannelFocusNode;
  TextEditingController? paymentChannelTextController;
  String? Function(BuildContext, String?)?
      paymentChannelTextControllerValidator;
  // State field(s) for NetPremiumTotal widget.
  FocusNode? netPremiumTotalFocusNode;
  TextEditingController? netPremiumTotalTextController;
  String? Function(BuildContext, String?)?
      netPremiumTotalTextControllerValidator;
  // State field(s) for ActTotal widget.
  FocusNode? actTotalFocusNode;
  TextEditingController? actTotalTextController;
  String? Function(BuildContext, String?)? actTotalTextControllerValidator;
  // State field(s) for grossNetTotal widget.
  FocusNode? grossNetTotalFocusNode;
  TextEditingController? grossNetTotalTextController;
  String? Function(BuildContext, String?)? grossNetTotalTextControllerValidator;
  // Stores action output result for [Backend Call - API (ibsPaymentRegenerateCode)] action in Icon widget.
  ApiCallResponse? regenQRCodeOutput;
  // Stores action output result for [Backend Call - API (ibsPaymentRegenerateCode)] action in Icon widget.
  ApiCallResponse? regenQRCodeOutput2;
  // Stores action output result for [Backend Call - API (ibsApplicationsPaymentSave)] action in Button widget.
  ApiCallResponse? paymentAPIOutpu;
  // Stores action output result for [Backend Call - API (ibsApplicationsDetail)] action in Button widget.
  ApiCallResponse? ibsDetailAPIOutputSavebtn;
  // Stores action output result for [Backend Call - API (getDateTimeAPI)] action in Button widget.
  ApiCallResponse? getServerTime;
  // Stores action output result for [Backend Call - API (ibsApplicationsEdit)] action in Button widget.
  ApiCallResponse? ibsApplicationEditOutput;
  // Stores action output result for [Backend Call - API (postInsurancePolicyApi)] action in Button widget.
  ApiCallResponse? postPolicyAPIOutPut;

  @override
  void initState(BuildContext context) {
    infomationCustomerModel =
        createModel(context, () => InfomationCustomerModel());
    infomationCustomerFireInsuranceModel =
        createModel(context, () => InfomationCustomerFireInsuranceModel());
    infomationCustomerActModel =
        createModel(context, () => InfomationCustomerActModel());
  }

  @override
  void dispose() {
    infomationCustomerModel.dispose();
    infomationCustomerFireInsuranceModel.dispose();
    infomationCustomerActModel.dispose();
    paymentTypeFocusNode?.dispose();
    paymentTypeTextController?.dispose();

    paymentChannelFocusNode?.dispose();
    paymentChannelTextController?.dispose();

    netPremiumTotalFocusNode?.dispose();
    netPremiumTotalTextController?.dispose();

    actTotalFocusNode?.dispose();
    actTotalTextController?.dispose();

    grossNetTotalFocusNode?.dispose();
    grossNetTotalTextController?.dispose();
  }
}
