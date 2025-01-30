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
import 'fire_insurer_list_page_widget.dart' show FireInsurerListPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class FireInsurerListPageModel
    extends FlutterFlowModel<FireInsurerListPageWidget> {
  ///  Local state fields for this page.

  List<GetPackageFireInsurerDataTypeStruct> packagePageStage = [];
  void addToPackagePageStage(GetPackageFireInsurerDataTypeStruct item) =>
      packagePageStage.add(item);
  void removeFromPackagePageStage(GetPackageFireInsurerDataTypeStruct item) =>
      packagePageStage.remove(item);
  void removeAtIndexFromPackagePageStage(int index) =>
      packagePageStage.removeAt(index);
  void insertAtIndexInPackagePageStage(
          int index, GetPackageFireInsurerDataTypeStruct item) =>
      packagePageStage.insert(index, item);
  void updatePackagePageStageAtIndex(
          int index, Function(GetPackageFireInsurerDataTypeStruct) updateFn) =>
      packagePageStage[index] = updateFn(packagePageStage[index]);

  bool? textBool = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getPackageFireInsurance)] action in fireInsurerListPage widget.
  ApiCallResponse? apiGetpackageOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
