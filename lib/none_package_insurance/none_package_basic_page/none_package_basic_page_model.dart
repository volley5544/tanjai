import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import 'dart:convert';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'none_package_basic_page_widget.dart' show NonePackageBasicPageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class NonePackageBasicPageModel
    extends FlutterFlowModel<NonePackageBasicPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (teleGetProvinceAPI)] action in NonePackageBasicPage widget.
  ApiCallResponse? getProvince;
  // Stores action output result for [Backend Call - API (insuranceRequestGetVehicleAPI)] action in NonePackageBasicPage widget.
  ApiCallResponse? getVehicleUsedTypeAPI;
  // Stores action output result for [Backend Call - API (teleGetBrandAPI)] action in NonePackageBasicPage widget.
  ApiCallResponse? getBrandAPI;
  // Stores action output result for [Backend Call - API (teleGetModelAPI )] action in NonePackageBasicPage widget.
  ApiCallResponse? getModelAPI;
  // Stores action output result for [Backend Call - API (teleGetCoverTypeAPI)] action in NonePackageBasicPage widget.
  ApiCallResponse? getCoverTypeAPI;
  // State field(s) for CarryPurposeTextField widget.
  FocusNode? carryPurposeTextFieldFocusNode;
  TextEditingController? carryPurposeTextFieldTextController;
  String? Function(BuildContext, String?)?
      carryPurposeTextFieldTextControllerValidator;
  // State field(s) for CurrentPriceTextField widget.
  FocusNode? currentPriceTextFieldFocusNode;
  TextEditingController? currentPriceTextFieldTextController;
  String? Function(BuildContext, String?)?
      currentPriceTextFieldTextControllerValidator;
  // State field(s) for CarrierPriceTextField widget.
  FocusNode? carrierPriceTextFieldFocusNode;
  TextEditingController? carrierPriceTextFieldTextController;
  String? Function(BuildContext, String?)?
      carrierPriceTextFieldTextControllerValidator;
  // State field(s) for BrandNameTextField widget.
  final brandNameTextFieldKey = GlobalKey();
  FocusNode? brandNameTextFieldFocusNode;
  TextEditingController? brandNameTextFieldTextController;
  String? brandNameTextFieldSelectedOption;
  String? Function(BuildContext, String?)?
      brandNameTextFieldTextControllerValidator;
  // State field(s) for modelName widget.
  final modelNameKey = GlobalKey();
  FocusNode? modelNameFocusNode;
  TextEditingController? modelNameTextController;
  String? modelNameSelectedOption;
  String? Function(BuildContext, String?)? modelNameTextControllerValidator;
  // State field(s) for OldVmiTextField widget.
  FocusNode? oldVmiTextFieldFocusNode;
  TextEditingController? oldVmiTextFieldTextController;
  String? Function(BuildContext, String?)?
      oldVmiTextFieldTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for CusNameTextField widget.
  FocusNode? cusNameTextFieldFocusNode;
  TextEditingController? cusNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      cusNameTextFieldTextControllerValidator;
  // State field(s) for CusPhoneTextField widget.
  FocusNode? cusPhoneTextFieldFocusNode;
  TextEditingController? cusPhoneTextFieldTextController;
  final cusPhoneTextFieldMask = MaskTextInputFormatter(mask: '###-###-####');
  String? Function(BuildContext, String?)?
      cusPhoneTextFieldTextControllerValidator;
  // State field(s) for PlateTextField widget.
  FocusNode? plateTextFieldFocusNode;
  TextEditingController? plateTextFieldTextController;
  String? Function(BuildContext, String?)?
      plateTextFieldTextControllerValidator;
  // State field(s) for PlateAdditionalTextField widget.
  FocusNode? plateAdditionalTextFieldFocusNode;
  TextEditingController? plateAdditionalTextFieldTextController;
  final plateAdditionalTextFieldMask = MaskTextInputFormatter(mask: '######');
  String? Function(BuildContext, String?)?
      plateAdditionalTextFieldTextControllerValidator;
  // State field(s) for SumInsuredTextField widget.
  FocusNode? sumInsuredTextFieldFocusNode;
  TextEditingController? sumInsuredTextFieldTextController;
  String? Function(BuildContext, String?)?
      sumInsuredTextFieldTextControllerValidator;
  // State field(s) for TrailerSumInsuredTextField widget.
  FocusNode? trailerSumInsuredTextFieldFocusNode;
  TextEditingController? trailerSumInsuredTextFieldTextController;
  String? Function(BuildContext, String?)?
      trailerSumInsuredTextFieldTextControllerValidator;
  // State field(s) for RemarkTextField widget.
  FocusNode? remarkTextFieldFocusNode;
  TextEditingController? remarkTextFieldTextController;
  String? Function(BuildContext, String?)?
      remarkTextFieldTextControllerValidator;
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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    carryPurposeTextFieldFocusNode?.dispose();
    carryPurposeTextFieldTextController?.dispose();

    currentPriceTextFieldFocusNode?.dispose();
    currentPriceTextFieldTextController?.dispose();

    carrierPriceTextFieldFocusNode?.dispose();
    carrierPriceTextFieldTextController?.dispose();

    brandNameTextFieldFocusNode?.dispose();

    modelNameFocusNode?.dispose();

    oldVmiTextFieldFocusNode?.dispose();
    oldVmiTextFieldTextController?.dispose();

    cusNameTextFieldFocusNode?.dispose();
    cusNameTextFieldTextController?.dispose();

    cusPhoneTextFieldFocusNode?.dispose();
    cusPhoneTextFieldTextController?.dispose();

    plateTextFieldFocusNode?.dispose();
    plateTextFieldTextController?.dispose();

    plateAdditionalTextFieldFocusNode?.dispose();
    plateAdditionalTextFieldTextController?.dispose();

    sumInsuredTextFieldFocusNode?.dispose();
    sumInsuredTextFieldTextController?.dispose();

    trailerSumInsuredTextFieldFocusNode?.dispose();
    trailerSumInsuredTextFieldTextController?.dispose();

    remarkTextFieldFocusNode?.dispose();
    remarkTextFieldTextController?.dispose();
  }
}
