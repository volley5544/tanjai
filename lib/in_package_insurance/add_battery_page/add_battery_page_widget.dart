import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/in_package_insurance/battery_infomation_form_component/battery_infomation_form_component_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'add_battery_page_model.dart';
export 'add_battery_page_model.dart';

class AddBatteryPageWidget extends StatefulWidget {
  const AddBatteryPageWidget({
    super.key,
    required this.firestoreDataConfigList,
    required this.index,
    required this.isEditing,
  });

  final DataListRecord? firestoreDataConfigList;
  final int? index;
  final bool? isEditing;

  static String routeName = 'AddBatteryPage';
  static String routePath = 'addBatteryPage';

  @override
  State<AddBatteryPageWidget> createState() => _AddBatteryPageWidgetState();
}

class _AddBatteryPageWidgetState extends State<AddBatteryPageWidget> {
  late AddBatteryPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddBatteryPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AddBatteryPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().titleDriverList = functions
          .generateDriverTitleList(FFAppState().DriverList.length)!
          .toList()
          .cast<String>();
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xFFDB771A),
              size: 30.0,
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
            'เพิ่มแบตเตอร์รี่',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.notoSansThai(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Color(0xFF204A77),
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
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
                    12.0,
                    0,
                    30.0,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: wrapWithModel(
                          model: _model.batteryInfomationFormComponentModel,
                          updateCallback: () => safeSetState(() {}),
                          child: BatteryInfomationFormComponentWidget(
                            index: widget!.index!,
                            firestoreDataConfigList:
                                widget!.firestoreDataConfigList!,
                            clearFormTextfield: () async {
                              context.safePop();
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (FFAppState().DriverList.length > 0)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 20.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 65.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (!(true &&
                                  true &&
                                  (FFAppState()
                                          .DriverList
                                          .elementAtOrNull(widget!.index!)
                                          ?.birthDay !=
                                      '') &&
                                  true &&
                                  true &&
                                  (FFAppState()
                                          .DriverList
                                          .elementAtOrNull(widget!.index!)
                                          ?.imageIdcard !=
                                      '') &&
                                  (FFAppState()
                                          .DriverList
                                          .elementAtOrNull(widget!.index!)
                                          ?.imageLicenseNo !=
                                      ''))) {
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
                              FFAppState().updateEvBatteryDataAtIndex(
                                widget!.index!,
                                (e) => e,
                              );
                              safeSetState(() {});
                              context.safePop();
                            },
                            text: 'บันทึก',
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 60.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFFD9761A),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.notoSansThai(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ].addToStart(SizedBox(height: 12.0)),
          ),
        ),
      ),
    );
  }
}
