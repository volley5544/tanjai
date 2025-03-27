import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/schema/structs/index.dart';
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
import 'search_package_fire_insurance_page_widget.dart'
    show SearchPackageFireInsurancePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SearchPackageFireInsurancePageModel
    extends FlutterFlowModel<SearchPackageFireInsurancePageWidget> {
  ///  Local state fields for this page.

  bool isSelectedCentimeterSquar = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for WidthTextField widget.
  FocusNode? widthTextFieldFocusNode;
  TextEditingController? widthTextFieldTextController;
  String? Function(BuildContext, String?)?
      widthTextFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (houseCalEstimatedApi)] action in WidthTextField widget.
  ApiCallResponse? calEstimatedOutputWidth;
  // State field(s) for LongTextField widget.
  FocusNode? longTextFieldFocusNode;
  TextEditingController? longTextFieldTextController;
  String? Function(BuildContext, String?)? longTextFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (houseCalEstimatedApi)] action in LongTextField widget.
  ApiCallResponse? calEstimatedOutputLong;
  // State field(s) for CentimeterSquarTextField widget.
  FocusNode? centimeterSquarTextFieldFocusNode;
  TextEditingController? centimeterSquarTextFieldTextController;
  String? Function(BuildContext, String?)?
      centimeterSquarTextFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (houseCalEstimatedApi)] action in CentimeterSquarTextField widget.
  ApiCallResponse? calEstimatedOutputCmSq;
  // State field(s) for BuildinAssetTextField widget.
  FocusNode? buildinAssetTextFieldFocusNode;
  TextEditingController? buildinAssetTextFieldTextController;
  String? Function(BuildContext, String?)?
      buildinAssetTextFieldTextControllerValidator;
  // Stores action output result for [Custom Action - a21] action in Text widget.
  String? userUID;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - uploadFileFirebaseStorage] action in Text widget.
  String? uploadStorageOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    widthTextFieldFocusNode?.dispose();
    widthTextFieldTextController?.dispose();

    longTextFieldFocusNode?.dispose();
    longTextFieldTextController?.dispose();

    centimeterSquarTextFieldFocusNode?.dispose();
    centimeterSquarTextFieldTextController?.dispose();

    buildinAssetTextFieldFocusNode?.dispose();
    buildinAssetTextFieldTextController?.dispose();
  }
}
