import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/insurance_type_color/insurance_type_color_widget.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'insurance_list_page_widget.dart' show InsuranceListPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class InsuranceListPageModel extends FlutterFlowModel<InsuranceListPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - getBuildVersion1] action in insuranceListPage widget.
  String? getBuildVersion;
  // Stores action output result for [Firestore Query - Query a collection] action in insuranceListPage widget.
  BuildVersionRecord? buildVersionQuery;
  // Stores action output result for [Backend Call - API (insuranceRequestListAPI)] action in insuranceListPage widget.
  ApiCallResponse? getRequestList;
  // State field(s) for searchFirstname widget.
  FocusNode? searchFirstnameFocusNode;
  TextEditingController? searchFirstnameController;
  String? Function(BuildContext, String?)? searchFirstnameControllerValidator;
  // Stores action output result for [Backend Call - API (insuranceRequestDetailAPI)] action in Button widget.
  ApiCallResponse? getDetailAPIEdit;
  // Stores action output result for [Backend Call - API (insuranceRequestDetailAPI)] action in Button widget.
  ApiCallResponse? getDetailApiDup;
  // Stores action output result for [Backend Call - API (insuranceRequestListAPIDashBoard)] action in Button widget.
  ApiCallResponse? listFromDash;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    searchFirstnameFocusNode?.dispose();
    searchFirstnameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
