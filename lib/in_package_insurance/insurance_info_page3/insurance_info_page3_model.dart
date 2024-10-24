import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/infomation_customer_act_widget.dart';
import '/components/infomation_customer_widget.dart';
import '/components/show_image_component_widget.dart';
import '/components/show_image_list_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import 'dart:convert';
import '/flutter_flow/custom_functions.dart' as functions;
import 'insurance_info_page3_widget.dart' show InsuranceInfoPage3Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class InsuranceInfoPage3Model
    extends FlutterFlowModel<InsuranceInfoPage3Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for infomationCustomer component.
  late InfomationCustomerModel infomationCustomerModel;
  // Model for infomationCustomerAct component.
  late InfomationCustomerActModel infomationCustomerActModel;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  bool isDataUploading4 = false;
  FFUploadedFile uploadedLocalFile4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl4 = '';

  bool isDataUploading5 = false;
  FFUploadedFile uploadedLocalFile5 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl5 = '';

  bool isDataUploading6 = false;
  FFUploadedFile uploadedLocalFile6 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl6 = '';

  bool isDataUploading7 = false;
  FFUploadedFile uploadedLocalFile7 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl7 = '';

  bool isDataUploading8 = false;
  FFUploadedFile uploadedLocalFile8 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl8 = '';

  bool isDataUploading9 = false;
  FFUploadedFile uploadedLocalFile9 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl9 = '';

  bool isDataUploading10 = false;
  FFUploadedFile uploadedLocalFile10 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl10 = '';

  bool isDataUploading11 = false;
  FFUploadedFile uploadedLocalFile11 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl11 = '';

  bool isDataUploading12 = false;
  FFUploadedFile uploadedLocalFile12 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl12 = '';

  // State field(s) for sensitive_consent widget.
  bool? sensitiveConsentValue;
  // State field(s) for sanction_consent widget.
  bool? sanctionConsentValue;
  // State field(s) for privacy_consent widget.
  bool? privacyConsentValue;
  // State field(s) for privacy_consent_cancel widget.
  bool? privacyConsentCancelValue;
  // State field(s) for privacy_consent_all widget.
  bool? privacyConsentAllValue;
  // Stores action output result for [Backend Call - API (ibsApplicationsSave)] action in VIM1Btn widget.
  ApiCallResponse? ibsAppSaveAPIOutput2;
  // Stores action output result for [Backend Call - API (ibsApplicationsSave)] action in OtherVIMBtn widget.
  ApiCallResponse? ibsAppSaveAPIOutputOther2;
  // Stores action output result for [Backend Call - API (ibsApplicationsSave)] action in OtherVIMBtnRenew widget.
  ApiCallResponse? ibsAppSaveAPIOutputOtherRenew;
  // Stores action output result for [Backend Call - API (ibsApplicationsSave)] action in Button widget.
  ApiCallResponse? save4APIOutput;

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
  }
}
