import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import 'license_select_component_widget.dart' show LicenseSelectComponentWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class LicenseSelectComponentModel
    extends FlutterFlowModel<LicenseSelectComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (apiLicenseGetLicense)] action in Button widget.
  ApiCallResponse? getLicenseAPIOutput;
  // Stores action output result for [Backend Call - API (apiLicenseSaveLicense)] action in Button widget.
  ApiCallResponse? saveLicenseAPIOutput;
  // Stores action output result for [Backend Call - API (apiLicenseCancelLicense)] action in Button widget.
  ApiCallResponse? cancelAPIOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
