import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
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
import 'none_package_edit_page3_widget.dart' show NonePackageEditPage3Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class NonePackageEditPage3Model
    extends FlutterFlowModel<NonePackageEditPage3Widget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_oldVmiUploadedAction1 = false;
  FFUploadedFile uploadedLocalFile_oldVmiUploadedAction1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_oldVmiUploadedAction1 = '';

  bool isDataUploading_idCardUploadedAction1 = false;
  FFUploadedFile uploadedLocalFile_idCardUploadedAction1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_idCardUploadedAction1 = '';

  bool isDataUploading_companyBookUploadedAction1 = false;
  FFUploadedFile uploadedLocalFile_companyBookUploadedAction1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_companyBookUploadedAction1 = '';

  bool isDataUploading_blueBookUploadedAction = false;
  FFUploadedFile uploadedLocalFile_blueBookUploadedAction =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_blueBookUploadedAction = '';

  bool isDataUploading_normalIdCardUploadedAction = false;
  FFUploadedFile uploadedLocalFile_normalIdCardUploadedAction =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_normalIdCardUploadedAction = '';

  bool isDataUploading_imageOther1UploadedAction = false;
  FFUploadedFile uploadedLocalFile_imageOther1UploadedAction =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_imageOther1UploadedAction = '';

  bool isDataUploading_imageOther2UploadedAction = false;
  FFUploadedFile uploadedLocalFile_imageOther2UploadedAction =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_imageOther2UploadedAction = '';

  bool isDataUploading_imageOther3UploadedAction = false;
  FFUploadedFile uploadedLocalFile_imageOther3UploadedAction =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_imageOther3UploadedAction = '';

  bool isDataUploading_imageOther4UploadedAction = false;
  FFUploadedFile uploadedLocalFile_imageOther4UploadedAction =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_imageOther4UploadedAction = '';

  bool isDataUploading_imageOther5UploadedAction = false;
  FFUploadedFile uploadedLocalFile_imageOther5UploadedAction =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_imageOther5UploadedAction = '';

  // Stores action output result for [Backend Call - API (insuranceRequestEditAPI)] action in Button widget.
  ApiCallResponse? insuranceEditOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
