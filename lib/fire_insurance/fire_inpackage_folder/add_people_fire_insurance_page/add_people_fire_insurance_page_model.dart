import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/fire_insurance/fire_inpackage_folder/people_fire_infomation_form_component/people_fire_infomation_form_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_people_fire_insurance_page_widget.dart'
    show AddPeopleFireInsurancePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddPeopleFireInsurancePageModel
    extends FlutterFlowModel<AddPeopleFireInsurancePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for PeopleFireInfomationFormComponent component.
  late PeopleFireInfomationFormComponentModel
      peopleFireInfomationFormComponentModel;

  @override
  void initState(BuildContext context) {
    peopleFireInfomationFormComponentModel =
        createModel(context, () => PeopleFireInfomationFormComponentModel());
  }

  @override
  void dispose() {
    peopleFireInfomationFormComponentModel.dispose();
  }
}
