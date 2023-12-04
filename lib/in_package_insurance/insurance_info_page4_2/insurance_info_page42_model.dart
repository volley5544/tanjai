import '/backend/api_requests/api_calls.dart';
import '/components/effective_date_picker_component_widget.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'insurance_info_page42_widget.dart' show InsuranceInfoPage42Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
  // Stores action output result for [Backend Call - API (ibsApplicationsDetail)] action in Icon widget.
  ApiCallResponse? ibsDetailAPIOutputCopyRefresh;
  // State field(s) for paymentType widget.
  FocusNode? paymentTypeFocusNode;
  TextEditingController? paymentTypeController;
  String? Function(BuildContext, String?)? paymentTypeControllerValidator;
  // State field(s) for paymentChannel widget.
  FocusNode? paymentChannelFocusNode;
  TextEditingController? paymentChannelController;
  String? Function(BuildContext, String?)? paymentChannelControllerValidator;
  // State field(s) for NetPremiumTotal widget.
  FocusNode? netPremiumTotalFocusNode;
  TextEditingController? netPremiumTotalController;
  String? Function(BuildContext, String?)? netPremiumTotalControllerValidator;
  // State field(s) for ActTotal widget.
  FocusNode? actTotalFocusNode;
  TextEditingController? actTotalController;
  String? Function(BuildContext, String?)? actTotalControllerValidator;
  // State field(s) for grossNetTotal widget.
  FocusNode? grossNetTotalFocusNode;
  TextEditingController? grossNetTotalController;
  String? Function(BuildContext, String?)? grossNetTotalControllerValidator;
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

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    paymentTypeFocusNode?.dispose();
    paymentTypeController?.dispose();

    paymentChannelFocusNode?.dispose();
    paymentChannelController?.dispose();

    netPremiumTotalFocusNode?.dispose();
    netPremiumTotalController?.dispose();

    actTotalFocusNode?.dispose();
    actTotalController?.dispose();

    grossNetTotalFocusNode?.dispose();
    grossNetTotalController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
