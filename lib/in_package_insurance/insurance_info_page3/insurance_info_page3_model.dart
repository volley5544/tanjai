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
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
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
  bool isDataUploading_uploaded012 = false;
  FFUploadedFile uploadedLocalFile_uploaded012 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploaded012 = '';

  bool isDataUploading_uploaded022 = false;
  FFUploadedFile uploadedLocalFile_uploaded022 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploaded022 = '';

  bool isDataUploading_uploaded032 = false;
  FFUploadedFile uploadedLocalFile_uploaded032 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploaded032 = '';

  bool isDataUploading_uploaded032112 = false;
  FFUploadedFile uploadedLocalFile_uploaded032112 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploaded032112 = '';

  bool isDataUploading_upload01 = false;
  FFUploadedFile uploadedLocalFile_upload01 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_upload01 = '';

  bool isDataUploading_upload02 = false;
  FFUploadedFile uploadedLocalFile_upload02 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_upload02 = '';

  bool isDataUploading_upload03 = false;
  FFUploadedFile uploadedLocalFile_upload03 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_upload03 = '';

  bool isDataUploading_upload04 = false;
  FFUploadedFile uploadedLocalFile_upload04 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_upload04 = '';

  bool isDataUploading_uploadPhoto046 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto046 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadPhoto046 = '';

  bool isDataUploading_uploadPhoto06 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto06 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadPhoto06 = '';

  bool isDataUploading_uploadDataUzm6 = false;
  FFUploadedFile uploadedLocalFile_uploadDataUzm6 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataUzm6 = '';

  bool isDataUploading_uploadDataUzm5 = false;
  FFUploadedFile uploadedLocalFile_uploadDataUzm5 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataUzm5 = '';

  bool isDataUploading_uploadPhoto061 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto061 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadPhoto061 = '';

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
