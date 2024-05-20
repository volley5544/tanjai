import '/backend/api_requests/api_calls.dart';
import '/components/effective_date_picker_component_widget.dart';
import '/components/infomation_customer_act_widget.dart';
import '/components/infomation_customer_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
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

  final unfocusNode = FocusNode();
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
  // Model for infomationCustomerAct component.
  late InfomationCustomerActModel infomationCustomerActModel;
  // Stores action output result for [Backend Call - API (ibsApplicationsDetail)] action in Icon widget.
  ApiCallResponse? ibsDetailAPIOutputCopyRefresh;
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
    infomationCustomerActModel =
        createModel(context, () => InfomationCustomerActModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    infomationCustomerModel.dispose();
    infomationCustomerActModel.dispose();
  }
}
