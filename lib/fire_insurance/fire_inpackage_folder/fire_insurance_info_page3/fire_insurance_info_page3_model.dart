import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
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
import '/flutter_flow/custom_functions.dart' as functions;
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
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

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
