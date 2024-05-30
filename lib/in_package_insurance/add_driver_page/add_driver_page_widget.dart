import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/driver_infomation_form_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'add_driver_page_model.dart';
export 'add_driver_page_model.dart';

class AddDriverPageWidget extends StatefulWidget {
  const AddDriverPageWidget({
    super.key,
    required this.firestoreDataConfigList,
  });

  final DataListRecord? firestoreDataConfigList;

  @override
  State<AddDriverPageWidget> createState() => _AddDriverPageWidgetState();
}

class _AddDriverPageWidgetState extends State<AddDriverPageWidget>
    with TickerProviderStateMixin {
  late AddDriverPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddDriverPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AddDriverPage'});
    animationsMap.addAll({
      'driverInfomationFormComponentOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, 30.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
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
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
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
              context.pop();
            },
          ),
          title: Text(
            'เพิ่มผู้ขับขี่',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Noto Sans Thai',
                  color: Color(0xFF204A77),
                  fontSize: 18.0,
                  letterSpacing: 0.0,
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
                child: Builder(
                  builder: (context) {
                    final driverDataListItem =
                        FFAppState().DriverList.toList().take(5).toList();
                    return ListView.builder(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        12.0,
                        0,
                        30.0,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: driverDataListItem.length,
                      itemBuilder: (context, driverDataListItemIndex) {
                        final driverDataListItemItem =
                            driverDataListItem[driverDataListItemIndex];
                        return Container(
                          decoration: BoxDecoration(),
                          child: wrapWithModel(
                            model: _model.driverInfomationFormComponentModels
                                .getModel(
                              driverDataListItemIndex.toString(),
                              driverDataListItemIndex,
                            ),
                            updateCallback: () => setState(() {}),
                            updateOnChange: true,
                            child: DriverInfomationFormComponentWidget(
                              key: Key(
                                'Key12c_${driverDataListItemIndex.toString()}',
                              ),
                              index: driverDataListItemIndex,
                              firestoreDataConfigList:
                                  widget.firestoreDataConfigList!,
                            ),
                          ).animateOnPageLoad(animationsMap[
                              'driverInfomationFormComponentOnPageLoadAnimation']!),
                        );
                      },
                    );
                  },
                ),
              ),
              if (FFAppState().DriverList.length < 5)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      FFAppState().addToDriverList(DriverDataStruct(
                        driverId: '',
                        driverNo: '',
                        applicationId: '',
                        idTypeId: '',
                        nationalThaiId: '',
                        licenseNo: '',
                        gender: '',
                        titleThId: '',
                        titleTh: '',
                        firstNameTh: '',
                        lastNameTh: '',
                        birthDay: '',
                        imageIdcard: '',
                        imageLicenseNo: '',
                        occupationId: '',
                        occupationCode: '',
                        occupationName: '',
                        occupationSubcode: '',
                        occupationSubname: '',
                      ));
                      setState(() {});
                    },
                    text: 'เพิ่มผู้ขับขี่',
                    icon: Icon(
                      Icons.person_add_sharp,
                      size: 24.0,
                    ),
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 60.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily: 'Noto Sans Thai',
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
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
                              if (FFAppState().DriverList.length <= 0) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text(
                                            'กรุณาเพิ่มผู้ขับขี่อย่างน้อย 1 คน'),
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
                              while (FFAppState().loopCountTemp <
                                  FFAppState().DriverList.length) {
                                if (!((_model.driverInfomationFormComponentModels
                                                .getValueForKey(
                                              FFAppState()
                                                  .loopCountTemp
                                                  .toString(),
                                              (m) => m
                                                  .firstnameTextfieldTextController
                                                  .text,
                                            ) !=
                                            null &&
                                        _model.driverInfomationFormComponentModels
                                                .getValueForKey(
                                              FFAppState()
                                                  .loopCountTemp
                                                  .toString(),
                                              (m) => m
                                                  .firstnameTextfieldTextController
                                                  .text,
                                            ) !=
                                            '') &&
                                    (_model.driverInfomationFormComponentModels
                                                .getValueForKey(
                                              FFAppState()
                                                  .loopCountTemp
                                                  .toString(),
                                              (m) => m
                                                  .address4LastnameTextfieldTextController
                                                  .text,
                                            ) !=
                                            null &&
                                        _model.driverInfomationFormComponentModels
                                                .getValueForKey(
                                              FFAppState()
                                                  .loopCountTemp
                                                  .toString(),
                                              (m) => m
                                                  .address4LastnameTextfieldTextController
                                                  .text,
                                            ) !=
                                            '') &&
                                    (FFAppState().DriverList[FFAppState().loopCountTemp].birthDay !=
                                            null &&
                                        FFAppState().DriverList[FFAppState().loopCountTemp].birthDay !=
                                            '') &&
                                    (_model.driverInfomationFormComponentModels
                                                .getValueForKey(
                                              FFAppState()
                                                  .loopCountTemp
                                                  .toString(),
                                              (m) => m
                                                  .thaiIdTextfieldTextController
                                                  .text,
                                            ) !=
                                            null &&
                                        _model.driverInfomationFormComponentModels
                                                .getValueForKey(
                                              FFAppState()
                                                  .loopCountTemp
                                                  .toString(),
                                              (m) => m
                                                  .thaiIdTextfieldTextController
                                                  .text,
                                            ) !=
                                            '') &&
                                    (_model.driverInfomationFormComponentModels
                                                .getValueForKey(
                                              FFAppState()
                                                  .loopCountTemp
                                                  .toString(),
                                              (m) => m
                                                  .driverLicenseTextfieldTextController
                                                  .text,
                                            ) !=
                                            null &&
                                        _model.driverInfomationFormComponentModels
                                                .getValueForKey(
                                              FFAppState()
                                                  .loopCountTemp
                                                  .toString(),
                                              (m) => m
                                                  .driverLicenseTextfieldTextController
                                                  .text,
                                            ) !=
                                            '') &&
                                    (FFAppState().DriverList[FFAppState().loopCountTemp].imageIdcard !=
                                            null &&
                                        FFAppState().DriverList[FFAppState().loopCountTemp].imageIdcard !=
                                            '') &&
                                    (FFAppState()
                                                .DriverList[
                                                    FFAppState().loopCountTemp]
                                                .imageLicenseNo !=
                                            null &&
                                        FFAppState()
                                                .DriverList[FFAppState().loopCountTemp]
                                                .imageLicenseNo !=
                                            ''))) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          content:
                                              Text('กรุณากรอกข้อมูลให้ครบ'),
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
                                  FFAppState().loopCountTemp,
                                  (e) => e
                                    ..driverId = ''
                                    ..driverNo =
                                        (FFAppState().loopCountTemp + 1)
                                            .toString()
                                    ..applicationId =
                                        FFAppState().insuranceInfoApplicationId
                                    ..idTypeId = '1'
                                    ..nationalThaiId =
                                        functions.removeCommaFromNumText(_model
                                            .driverInfomationFormComponentModels
                                            .getValueForKey(
                                      FFAppState().loopCountTemp.toString(),
                                      (m) =>
                                          m.thaiIdTextfieldTextController.text,
                                    ))
                                    ..licenseNo = _model
                                        .driverInfomationFormComponentModels
                                        .getValueForKey(
                                      FFAppState().loopCountTemp.toString(),
                                      (m) => m
                                          .driverLicenseTextfieldTextController
                                          .text,
                                    )
                                    ..gender = FFAppState().DriverList[0].gender
                                    ..titleThId = ''
                                    ..titleTh =
                                        FFAppState().DriverList[0].titleTh
                                    ..firstNameTh = _model
                                        .driverInfomationFormComponentModels
                                        .getValueForKey(
                                      FFAppState().loopCountTemp.toString(),
                                      (m) => m.firstnameTextfieldTextController
                                          .text,
                                    )
                                    ..lastNameTh = _model
                                        .driverInfomationFormComponentModels
                                        .getValueForKey(
                                      FFAppState().loopCountTemp.toString(),
                                      (m) => m
                                          .address4LastnameTextfieldTextController
                                          .text,
                                    )
                                    ..birthDay =
                                        FFAppState().DriverList[0].birthDay
                                    ..imageIdcard =
                                        FFAppState().DriverList[0].imageIdcard
                                    ..imageLicenseNo = FFAppState()
                                        .DriverList[0]
                                        .imageLicenseNo
                                    ..occupationId = ''
                                    ..occupationCode = FFAppState()
                                        .DriverList[0]
                                        .occupationCode
                                    ..occupationName = FFAppState()
                                        .DriverList[0]
                                        .occupationName
                                    ..occupationSubcode = ''
                                    ..occupationSubname = FFAppState()
                                        .DriverList[0]
                                        .occupationSubname,
                                );
                                setState(() {});
                              }
                              FFAppState().loopCountTemp = 0;
                              setState(() {});
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
                                    fontFamily: 'Noto Sans Thai',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
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
            ],
          ),
        ),
      ),
    );
  }
}
