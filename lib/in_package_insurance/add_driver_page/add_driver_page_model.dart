import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/driver_infomation_form_component_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_driver_page_widget.dart' show AddDriverPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddDriverPageModel extends FlutterFlowModel<AddDriverPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Models for DriverInfomationFormComponent dynamic component.
  late FlutterFlowDynamicModels<DriverInfomationFormComponentModel>
      driverInfomationFormComponentModels;

  @override
  void initState(BuildContext context) {
    driverInfomationFormComponentModels =
        FlutterFlowDynamicModels(() => DriverInfomationFormComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    driverInfomationFormComponentModels.dispose();
  }
}
