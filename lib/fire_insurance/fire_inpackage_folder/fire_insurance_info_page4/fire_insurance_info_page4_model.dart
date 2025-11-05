import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/infomation_customer_fire_insurance_widget.dart';
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
import 'fire_insurance_info_page4_widget.dart'
    show FireInsuranceInfoPage4Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class FireInsuranceInfoPage4Model
    extends FlutterFlowModel<FireInsuranceInfoPage4Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for infomationCustomerFireInsurance component.
  late InfomationCustomerFireInsuranceModel
      infomationCustomerFireInsuranceModel;
  bool isDataUploading_uploaded41Fire1 = false;
  FFUploadedFile uploadedLocalFile_uploaded41Fire1 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploaded41Fire1 = '';

  bool isDataUploading_uploaded41Fire = false;
  FFUploadedFile uploadedLocalFile_uploaded41Fire =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploaded41Fire = '';

  bool isDataUploading_uploaded08Fire = false;
  FFUploadedFile uploadedLocalFile_uploaded08Fire =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploaded08Fire = '';

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
