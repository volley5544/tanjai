import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/custom_dialog_component_copy_widget.dart';
import '/components/infomation_customer_act_widget.dart';
import '/components/infomation_customer_fire_insurance_widget.dart';
import '/components/save_contract_c_m_i_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import '/pages/super_app/components/step5_document_download/step5_document_download_widget.dart';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'insurance_info_page5_widget.dart' show InsuranceInfoPage5Widget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class InsuranceInfoPage5Model
    extends FlutterFlowModel<InsuranceInfoPage5Widget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getDateTimeAPI)] action in insuranceInfoPage5 widget.
  ApiCallResponse? getDateTimeOutput;
  // Stores action output result for [Backend Call - API (ibsApplicationsDetail)] action in insuranceInfoPage5 widget.
  ApiCallResponse? applicationDetailOutput;
  // Stores action output result for [Backend Call - API (getInsurancePolicyApi)] action in insuranceInfoPage5 widget.
  ApiCallResponse? getPolicy;
  // Model for infomationCustomerFireInsurance component.
  late InfomationCustomerFireInsuranceModel
      infomationCustomerFireInsuranceModel;
  // Model for infomationCustomerAct component.
  late InfomationCustomerActModel infomationCustomerActModel;
  // Stores action output result for [Backend Call - API (getDateTimeAPI)] action in Icon widget.
  ApiCallResponse? getDateTimeOutput2;
  // Stores action output result for [Backend Call - API (getInsurancePolicyApi)] action in Icon widget.
  ApiCallResponse? getPolicyRefreshButton;
  // Stores action output result for [Backend Call - API (getFileVmiApi)] action in Button widget.
  ApiCallResponse? getFileVmi;
  // Stores action output result for [Backend Call - API (getFileVmiApi)] action in Button widget.
  ApiCallResponse? getFileVmiCopyButton;
  // Stores action output result for [Backend Call - API (getFileCmiApi )] action in Button widget.
  ApiCallResponse? cmiAPIOutput;
  // Stores action output result for [Backend Call - API (getFileCmiApi )] action in Button widget.
  ApiCallResponse? cmiAPIOutputCopyButton;

  @override
  void initState(BuildContext context) {
    infomationCustomerFireInsuranceModel =
        createModel(context, () => InfomationCustomerFireInsuranceModel());
    infomationCustomerActModel =
        createModel(context, () => InfomationCustomerActModel());
  }

  @override
  void dispose() {
    infomationCustomerFireInsuranceModel.dispose();
    infomationCustomerActModel.dispose();
  }
}
