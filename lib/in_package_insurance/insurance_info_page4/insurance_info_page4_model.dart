import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/infomation_customer_widget.dart';
import '/components/show_image_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'insurance_info_page4_widget.dart' show InsuranceInfoPage4Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class InsuranceInfoPage4Model
    extends FlutterFlowModel<InsuranceInfoPage4Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for infomationCustomer component.
  late InfomationCustomerModel infomationCustomerModel;
  bool isDataUploading_uploaded41 = false;
  FFUploadedFile uploadedLocalFile_uploaded41 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploaded41 = '';

  bool isDataUploading_uploaded08 = false;
  FFUploadedFile uploadedLocalFile_uploaded08 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploaded08 = '';

  bool isDataUploading_uploadedCancel = false;
  FFUploadedFile uploadedLocalFile_uploadedCancel =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadedCancel = '';

  bool isDataUploading_uploadedAttoney = false;
  FFUploadedFile uploadedLocalFile_uploadedAttoney =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadedAttoney = '';

  bool isDataUploading_uploadedAttoneyIDcard = false;
  FFUploadedFile uploadedLocalFile_uploadedAttoneyIDcard =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadedAttoneyIDcard = '';

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
