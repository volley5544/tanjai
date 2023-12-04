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
import 'insurance_info_page1_widget.dart' show InsuranceInfoPage1Widget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
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
  // State field(s) for IdCardTextField widget.
  FocusNode? idCardTextFieldFocusNode1;
  TextEditingController? idCardTextFieldController1;
  final idCardTextFieldMask1 =
      MaskTextInputFormatter(mask: '#-####-#####-##-#');
  String? Function(BuildContext, String?)? idCardTextFieldController1Validator;
  // Stores action output result for [Backend Call - API (checkBlackList)] action in Container widget.
  ApiCallResponse? checkBlackListOutput;
  // State field(s) for IdCardTextField widget.
  FocusNode? idCardTextFieldFocusNode2;
  TextEditingController? idCardTextFieldController2;
  String? Function(BuildContext, String?)? idCardTextFieldController2Validator;
  // Stores action output result for [Backend Call - API (checkBlackList)] action in Container widget.
  ApiCallResponse? checkBlackListOutput2;
  // State field(s) for CusNameTextField widget.
  FocusNode? cusNameTextFieldFocusNode;
  TextEditingController? cusNameTextFieldController;
  String? Function(BuildContext, String?)? cusNameTextFieldControllerValidator;
  // State field(s) for CusLastnameTextField widget.
  FocusNode? cusLastnameTextFieldFocusNode;
  TextEditingController? cusLastnameTextFieldController;
  String? Function(BuildContext, String?)?
      cusLastnameTextFieldControllerValidator;
  DateTime? datePicked;
  // State field(s) for AgeTextField widget.
  FocusNode? ageTextFieldFocusNode;
  TextEditingController? ageTextFieldController;
  String? Function(BuildContext, String?)? ageTextFieldControllerValidator;
  // State field(s) for CusOcputationTextField widget.
  FocusNode? cusOcputationTextFieldFocusNode;
  TextEditingController? cusOcputationTextFieldController;
  String? Function(BuildContext, String?)?
      cusOcputationTextFieldControllerValidator;
  // State field(s) for CusPhoneTextField widget.
  FocusNode? cusPhoneTextFieldFocusNode;
  TextEditingController? cusPhoneTextFieldController;
  final cusPhoneTextFieldMask = MaskTextInputFormatter(mask: '###-###-####');
  String? Function(BuildContext, String?)? cusPhoneTextFieldControllerValidator;
  // State field(s) for CusPhoneOtherTextField widget.
  FocusNode? cusPhoneOtherTextFieldFocusNode;
  TextEditingController? cusPhoneOtherTextFieldController;
  final cusPhoneOtherTextFieldMask =
      MaskTextInputFormatter(mask: '###-###-####');
  String? Function(BuildContext, String?)?
      cusPhoneOtherTextFieldControllerValidator;
  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode;
  TextEditingController? emailTextFieldController;
  String? Function(BuildContext, String?)? emailTextFieldControllerValidator;
  // State field(s) for licenseCode widget.
  FocusNode? licenseCodeFocusNode;
  TextEditingController? licenseCodeController;
  String? Function(BuildContext, String?)? licenseCodeControllerValidator;
  // Stores action output result for [Backend Call - API (getProfileImage)] action in Container widget.
  ApiCallResponse? profileImgOutput;
  // Stores action output result for [Backend Call - API (ibsApplicationsSave)] action in Button widget.
  ApiCallResponse? ibsAppSaveAPIoutput;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    idCardTextFieldFocusNode1?.dispose();
    idCardTextFieldController1?.dispose();

    idCardTextFieldFocusNode2?.dispose();
    idCardTextFieldController2?.dispose();

    cusNameTextFieldFocusNode?.dispose();
    cusNameTextFieldController?.dispose();

    cusLastnameTextFieldFocusNode?.dispose();
    cusLastnameTextFieldController?.dispose();

    ageTextFieldFocusNode?.dispose();
    ageTextFieldController?.dispose();

    cusOcputationTextFieldFocusNode?.dispose();
    cusOcputationTextFieldController?.dispose();

    cusPhoneTextFieldFocusNode?.dispose();
    cusPhoneTextFieldController?.dispose();

    cusPhoneOtherTextFieldFocusNode?.dispose();
    cusPhoneOtherTextFieldController?.dispose();

    emailTextFieldFocusNode?.dispose();
    emailTextFieldController?.dispose();

    licenseCodeFocusNode?.dispose();
    licenseCodeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
