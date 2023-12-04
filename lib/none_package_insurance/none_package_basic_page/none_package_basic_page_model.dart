import '/backend/api_requests/api_calls.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'none_package_basic_page_widget.dart' show NonePackageBasicPageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
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
  // State field(s) for CarryPurposeTextField widget.
  FocusNode? carryPurposeTextFieldFocusNode;
  TextEditingController? carryPurposeTextFieldController;
  String? Function(BuildContext, String?)?
      carryPurposeTextFieldControllerValidator;
  // State field(s) for CurrentPriceTextField widget.
  FocusNode? currentPriceTextFieldFocusNode;
  TextEditingController? currentPriceTextFieldController;
  String? Function(BuildContext, String?)?
      currentPriceTextFieldControllerValidator;
  // State field(s) for CarrierPriceTextField widget.
  FocusNode? carrierPriceTextFieldFocusNode;
  TextEditingController? carrierPriceTextFieldController;
  String? Function(BuildContext, String?)?
      carrierPriceTextFieldControllerValidator;
  // State field(s) for BrandNameTextField widget.
  final brandNameTextFieldKey = GlobalKey();
  FocusNode? brandNameTextFieldFocusNode;
  TextEditingController? brandNameTextFieldController;
  String? brandNameTextFieldSelectedOption;
  String? Function(BuildContext, String?)?
      brandNameTextFieldControllerValidator;
  // State field(s) for modelName widget.
  final modelNameKey = GlobalKey();
  FocusNode? modelNameFocusNode;
  TextEditingController? modelNameController;
  String? modelNameSelectedOption;
  String? Function(BuildContext, String?)? modelNameControllerValidator;
  // State field(s) for OldVmiTextField widget.
  FocusNode? oldVmiTextFieldFocusNode;
  TextEditingController? oldVmiTextFieldController;
  String? Function(BuildContext, String?)? oldVmiTextFieldControllerValidator;
  DateTime? datePicked;
  // State field(s) for CusNameTextField widget.
  FocusNode? cusNameTextFieldFocusNode;
  TextEditingController? cusNameTextFieldController;
  String? Function(BuildContext, String?)? cusNameTextFieldControllerValidator;
  // State field(s) for CusPhoneTextField widget.
  FocusNode? cusPhoneTextFieldFocusNode;
  TextEditingController? cusPhoneTextFieldController;
  final cusPhoneTextFieldMask = MaskTextInputFormatter(mask: '###-###-####');
  String? Function(BuildContext, String?)? cusPhoneTextFieldControllerValidator;
  // State field(s) for PlateTextField widget.
  FocusNode? plateTextFieldFocusNode;
  TextEditingController? plateTextFieldController;
  String? Function(BuildContext, String?)? plateTextFieldControllerValidator;
  // State field(s) for PlateAdditionalTextField widget.
  FocusNode? plateAdditionalTextFieldFocusNode;
  TextEditingController? plateAdditionalTextFieldController;
  final plateAdditionalTextFieldMask = MaskTextInputFormatter(mask: '######');
  String? Function(BuildContext, String?)?
      plateAdditionalTextFieldControllerValidator;
  // State field(s) for SumInsuredTextField widget.
  FocusNode? sumInsuredTextFieldFocusNode;
  TextEditingController? sumInsuredTextFieldController;
  String? Function(BuildContext, String?)?
      sumInsuredTextFieldControllerValidator;
  // State field(s) for TrailerSumInsuredTextField widget.
  FocusNode? trailerSumInsuredTextFieldFocusNode;
  TextEditingController? trailerSumInsuredTextFieldController;
  String? Function(BuildContext, String?)?
      trailerSumInsuredTextFieldControllerValidator;
  // State field(s) for RemarkTextField widget.
  FocusNode? remarkTextFieldFocusNode;
  TextEditingController? remarkTextFieldController;
  String? Function(BuildContext, String?)? remarkTextFieldControllerValidator;
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

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    carryPurposeTextFieldFocusNode?.dispose();
    carryPurposeTextFieldController?.dispose();

    currentPriceTextFieldFocusNode?.dispose();
    currentPriceTextFieldController?.dispose();

    carrierPriceTextFieldFocusNode?.dispose();
    carrierPriceTextFieldController?.dispose();

    brandNameTextFieldFocusNode?.dispose();

    modelNameFocusNode?.dispose();

    oldVmiTextFieldFocusNode?.dispose();
    oldVmiTextFieldController?.dispose();

    cusNameTextFieldFocusNode?.dispose();
    cusNameTextFieldController?.dispose();

    cusPhoneTextFieldFocusNode?.dispose();
    cusPhoneTextFieldController?.dispose();

    plateTextFieldFocusNode?.dispose();
    plateTextFieldController?.dispose();

    plateAdditionalTextFieldFocusNode?.dispose();
    plateAdditionalTextFieldController?.dispose();

    sumInsuredTextFieldFocusNode?.dispose();
    sumInsuredTextFieldController?.dispose();

    trailerSumInsuredTextFieldFocusNode?.dispose();
    trailerSumInsuredTextFieldController?.dispose();

    remarkTextFieldFocusNode?.dispose();
    remarkTextFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
