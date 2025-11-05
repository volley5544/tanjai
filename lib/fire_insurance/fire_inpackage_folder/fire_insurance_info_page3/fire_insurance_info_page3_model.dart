import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/infomation_customer_fire_insurance_widget.dart';
import '/components/show_image_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import 'dart:convert';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'fire_insurance_info_page3_widget.dart'
    show FireInsuranceInfoPage3Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class FireInsuranceInfoPage3Model
    extends FlutterFlowModel<FireInsuranceInfoPage3Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for infomationCustomerFireInsurance component.
  late InfomationCustomerFireInsuranceModel
      infomationCustomerFireInsuranceModel;
  bool isDataUploading_uploaded012Fire = false;
  FFUploadedFile uploadedLocalFile_uploaded012Fire =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploaded012Fire = '';

  bool isDataUploading_uploaded022Fire = false;
  FFUploadedFile uploadedLocalFile_uploaded022Fire =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploaded022Fire = '';

  bool isDataUploading_uploaded0322 = false;
  FFUploadedFile uploadedLocalFile_uploaded0322 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploaded0322 = '';

  bool isDataUploading_uploadedAttoneyIDcardhouse = false;
  FFUploadedFile uploadedLocalFile_uploadedAttoneyIDcardhouse =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadedAttoneyIDcardhouse = '';

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
  // Stores action output result for [Backend Call - API (ibsApplicationsSave)] action in OtherVIMBtn widget.
  ApiCallResponse? ibsAppSaveAPIOutputOther2;

  @override
  void initState(BuildContext context) {
    infomationCustomerFireInsuranceModel =
        createModel(context, () => InfomationCustomerFireInsuranceModel());
  }

  @override
  void dispose() {
    infomationCustomerFireInsuranceModel.dispose();
  }
}
