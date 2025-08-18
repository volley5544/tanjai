import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/infomation_customer_widget.dart';
import '/components/show_image_component_widget.dart';
import '/components/show_image_list_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:convert';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'insurance_info_page31_widget.dart' show InsuranceInfoPage31Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class InsuranceInfoPage31Model
    extends FlutterFlowModel<InsuranceInfoPage31Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for infomationCustomer component.
  late InfomationCustomerModel infomationCustomerModel;
  bool isDataUploading_uploaded0122 = false;
  FFUploadedFile uploadedLocalFile_uploaded0122 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploaded0122 = '';

  bool isDataUploading_blueBookUploadedAction12 = false;
  FFUploadedFile uploadedLocalFile_blueBookUploadedAction12 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_blueBookUploadedAction12 = '';

  bool isDataUploading_normalIdCardUploadedAction1 = false;
  FFUploadedFile uploadedLocalFile_normalIdCardUploadedAction1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_normalIdCardUploadedAction1 = '';

  bool isDataUploading_quotationPdfUploadedAction1 = false;
  FFUploadedFile uploadedLocalFile_quotationPdfUploadedAction1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_quotationPdfUploadedAction1 = '';

  bool isDataUploading_oldVmiUploadedAction2 = false;
  FFUploadedFile uploadedLocalFile_oldVmiUploadedAction2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_oldVmiUploadedAction2 = '';

  bool isDataUploading_companyBookUploadedAction2 = false;
  FFUploadedFile uploadedLocalFile_companyBookUploadedAction2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_companyBookUploadedAction2 = '';

  bool isDataUploading_uploadPhoto1579 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto1579 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadPhoto1579 = '';

  bool isDataUploading_uploadPhoto2579 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto2579 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadPhoto2579 = '';

  bool isDataUploading_uploadPhoto3579 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto3579 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadPhoto3579 = '';

  bool isDataUploading_uploadPhoto4579 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto4579 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadPhoto4579 = '';

  bool isDataUploading_uploadPhoto5579 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto5579 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadPhoto5579 = '';

  bool isDataUploading_uploadPhoto6579 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto6579 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadPhoto6579 = '';

  bool isDataUploading_uploadPhotoShow579 = false;
  FFUploadedFile uploadedLocalFile_uploadPhotoShow579 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadPhotoShow579 = '';

  bool isDataUploading_uploadPhoto8579 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto8579 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadPhoto8579 = '';

  bool isDataUploading_uploadPhoto9579 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto9579 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadPhoto9579 = '';

  bool isDataUploading_uploadPhoto15179 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto15179 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadPhoto15179 = '';

  bool isDataUploading_uploadPhoto25179 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto25179 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadPhoto25179 = '';

  bool isDataUploading_uploadPhoto35179 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto35179 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadPhoto35179 = '';

  bool isDataUploading_uploadPhoto45179 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto45179 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadPhoto45179 = '';

  bool isDataUploading_uploadPhoto55179 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto55179 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadPhoto55179 = '';

  bool isDataUploading_uploadPhoto65179 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto65179 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadPhoto65179 = '';

  bool isDataUploading_uploadPhotoShow5179 = false;
  FFUploadedFile uploadedLocalFile_uploadPhotoShow5179 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadPhotoShow5179 = '';

  bool isDataUploading_uploadPhoto85179 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto85179 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadPhoto85179 = '';

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

  @override
  void initState(BuildContext context) {
    infomationCustomerModel =
        createModel(context, () => InfomationCustomerModel());
  }

  @override
  void dispose() {
    infomationCustomerModel.dispose();
  }
}
