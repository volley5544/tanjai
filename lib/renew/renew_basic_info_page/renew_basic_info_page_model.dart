import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/show_image_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import 'dart:convert';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'renew_basic_info_page_widget.dart' show RenewBasicInfoPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class RenewBasicInfoPageModel
    extends FlutterFlowModel<RenewBasicInfoPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (insuranceRequestGetInsurerAPI)] action in RenewBasicInfoPage widget.
  ApiCallResponse? getInsurer;
  // Stores action output result for [Backend Call - API (ibsApplicationsDetail)] action in RenewBasicInfoPage widget.
  ApiCallResponse? getAppDetailAPIOutput;
  // Stores action output result for [Backend Call - API (GetLicenseList)] action in RenewBasicInfoPage widget.
  ApiCallResponse? getLicenseAPIOutoutCopy;
  // Stores action output result for [Backend Call - API (getProfileImage)] action in RenewBasicInfoPage widget.
  ApiCallResponse? profileImgOutputPage;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for licenseCode widget.
  FocusNode? licenseCodeFocusNode;
  TextEditingController? licenseCodeTextController;
  String? Function(BuildContext, String?)? licenseCodeTextControllerValidator;
  // Stores action output result for [Backend Call - API (getProfileImage)] action in Container widget.
  ApiCallResponse? profileImgOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    licenseCodeFocusNode?.dispose();
    licenseCodeTextController?.dispose();
  }
}
