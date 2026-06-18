import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'insurer_list_overall_renew_page_widget.dart'
    show InsurerListOverallRenewPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class InsurerListOverallRenewPageModel
    extends FlutterFlowModel<InsurerListOverallRenewPageWidget> {
  ///  Local state fields for this page.

  List<PackageDataModelStruct> dataRenewPage = [];
  void addToDataRenewPage(PackageDataModelStruct item) =>
      dataRenewPage.add(item);
  void removeFromDataRenewPage(PackageDataModelStruct item) =>
      dataRenewPage.remove(item);
  void removeAtIndexFromDataRenewPage(int index) =>
      dataRenewPage.removeAt(index);
  void insertAtIndexInDataRenewPage(int index, PackageDataModelStruct item) =>
      dataRenewPage.insert(index, item);
  void updateDataRenewPageAtIndex(
          int index, Function(PackageDataModelStruct) updateFn) =>
      dataRenewPage[index] = updateFn(dataRenewPage[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (telePackageSearchAPI RENEW)] action in insurerListOverallRenewPage widget.
  ApiCallResponse? packageRENEWAPIOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
