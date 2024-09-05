import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/driver_infomation_form_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'add_driver_page_model.dart';
export 'add_driver_page_model.dart';

class AddDriverPageWidget extends StatefulWidget {
  const AddDriverPageWidget({
    super.key,
    required this.firestoreDataConfigList,
    required this.index,
    required this.isEditing,
  });

  final DataListRecord? firestoreDataConfigList;
  final int? index;
  final bool? isEditing;

  @override
  State<AddDriverPageWidget> createState() => _AddDriverPageWidgetState();
}

class _AddDriverPageWidgetState extends State<AddDriverPageWidget> {
  late AddDriverPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddDriverPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AddDriverPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().titleDriverList = functions
          .generateDriverTitleList(FFAppState().DriverList.length)!
          .toList()
          .cast<String>();
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xFFDB771A),
              size: 30,
            ),
            onPressed: () async {
              if (!widget!.isEditing!) {
                var confirmDialogResponse = await showDialog<bool>(
                      context: context,
                      builder: (alertDialogContext) {
                        return WebViewAware(
                          child: AlertDialog(
                            content: Text(
                                'คุณกำลังกรอกข้อมูลผู้ขับขี่อยู่ หากคุณย้อนกลับจะต้องกรอกข้อมูลผู้ขับขี่นี้ใหม่ คุณต้องการจะย้อนกลับหรือไม่?'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, false),
                                child: Text('ยกเลิก'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, true),
                                child: Text('ตกลง'),
                              ),
                            ],
                          ),
                        );
                      },
                    ) ??
                    false;
                if (confirmDialogResponse) {
                  FFAppState().removeAtIndexFromDriverList(widget!.index!);
                  safeSetState(() {});
                } else {
                  return;
                }
              }
              context.pop();
            },
          ),
          title: Text(
            'เพิ่มผู้ขับขี่',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Noto Sans Thai',
                  color: Color(0xFF204A77),
                  fontSize: 18,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    12,
                    0,
                    30,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      decoration: BoxDecoration(),
                      child: wrapWithModel(
                        model: _model.driverInfomationFormComponentModel,
                        updateCallback: () => safeSetState(() {}),
                        updateOnChange: true,
                        child: DriverInfomationFormComponentWidget(
                          index: widget!.index!,
                          firestoreDataConfigList:
                              widget!.firestoreDataConfigList!,
                          clearFormTextfield: () async {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (FFAppState().DriverList.length > 0)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 20),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (!((_model.driverInfomationFormComponentModel.firstnameTextfieldTextController.text != null &&
                                      _model
                                              .driverInfomationFormComponentModel
                                              .firstnameTextfieldTextController
                                              .text !=
                                          '') &&
                                  (_model.driverInfomationFormComponentModel.address4LastnameTextfieldTextController.text != null &&
                                      _model
                                              .driverInfomationFormComponentModel
                                              .address4LastnameTextfieldTextController
                                              .text !=
                                          '') &&
                                  (FFAppState().DriverList[widget!.index!].birthDay !=
                                      '') &&
                                  ((_model.driverInfomationFormComponentModel.thaiIdTextfieldTextController.text != null && _model.driverInfomationFormComponentModel.thaiIdTextfieldTextController.text != '') &&
                                      (functions.checkStringLength(functions.removeCommaFromNumText(_model.driverInfomationFormComponentModel.thaiIdTextfieldTextController.text)).toString() ==
                                          '13')) &&
                                  (_model
                                              .driverInfomationFormComponentModel
                                              .driverLicenseTextfieldTextController
                                              .text !=
                                          null &&
                                      _model
                                              .driverInfomationFormComponentModel
                                              .driverLicenseTextfieldTextController
                                              .text !=
                                          '') &&
                                  (FFAppState().DriverList[widget!.index!].imageIdcard != '') &&
                                  (FFAppState().DriverList[widget!.index!].imageLicenseNo != ''))) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text('กรุณากรอกข้อมูลให้ครบ'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                                return;
                              }
                              FFAppState().updateDriverListAtIndex(
                                widget!.index!,
                                (e) => e
                                  ..driverId = ''
                                  ..driverNo = ((widget!.index!) + 1).toString()
                                  ..applicationId =
                                      FFAppState().insuranceInfoApplicationId
                                  ..idTypeId = '1'
                                  ..nationalThaiId =
                                      functions.removeCommaFromNumText(_model
                                          .driverInfomationFormComponentModel
                                          .thaiIdTextfieldTextController
                                          .text)
                                  ..licenseNo = _model
                                      .driverInfomationFormComponentModel
                                      .driverLicenseTextfieldTextController
                                      .text
                                  ..gender = FFAppState()
                                      .DriverList[widget!.index!]
                                      .gender
                                  ..titleThId = ''
                                  ..titleTh = FFAppState()
                                      .DriverList[widget!.index!]
                                      .titleTh
                                  ..firstNameTh = _model
                                      .driverInfomationFormComponentModel
                                      .firstnameTextfieldTextController
                                      .text
                                  ..lastNameTh = _model
                                      .driverInfomationFormComponentModel
                                      .address4LastnameTextfieldTextController
                                      .text
                                  ..birthDay = FFAppState()
                                      .DriverList[widget!.index!]
                                      .birthDay
                                  ..imageIdcard = FFAppState()
                                      .DriverList[widget!.index!]
                                      .imageIdcard
                                  ..imageLicenseNo = FFAppState()
                                      .DriverList[widget!.index!]
                                      .imageLicenseNo
                                  ..occupationId = ''
                                  ..occupationCode = FFAppState()
                                      .DriverList[widget!.index!]
                                      .occupationCode
                                  ..occupationName = FFAppState()
                                      .DriverList[widget!.index!]
                                      .occupationName
                                  ..occupationSubcode = ''
                                  ..occupationSubname = FFAppState()
                                      .DriverList[widget!.index!]
                                      .occupationSubname,
                              );
                              safeSetState(() {});
                              context.safePop();
                            },
                            text: 'บันทึก',
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width,
                              height: 60,
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                              iconPadding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              color: Color(0xFFD9761A),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Noto Sans Thai',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                              elevation: 3,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ].addToStart(SizedBox(height: 12)),
          ),
        ),
      ),
    );
  }
}
