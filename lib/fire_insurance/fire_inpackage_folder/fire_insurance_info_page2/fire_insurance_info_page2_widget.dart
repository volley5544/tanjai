import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/infomation_customer_act_widget.dart';
import '/components/infomation_customer_fire_insurance_widget.dart';
import '/components/infomation_customer_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import 'dart:convert';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'fire_insurance_info_page2_model.dart';
export 'fire_insurance_info_page2_model.dart';

class FireInsuranceInfoPage2Widget extends StatefulWidget {
  const FireInsuranceInfoPage2Widget({
    super.key,
    required this.masterDataFirebase,
  });

  final DataListRecord? masterDataFirebase;

  @override
  State<FireInsuranceInfoPage2Widget> createState() =>
      _FireInsuranceInfoPage2WidgetState();
}

class _FireInsuranceInfoPage2WidgetState
    extends State<FireInsuranceInfoPage2Widget> {
  late FireInsuranceInfoPage2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FireInsuranceInfoPage2Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'fireInsuranceInfoPage2'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        enableDrag: false,
        context: context,
        builder: (context) {
          return WebViewAware(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: LoadingSceneWidget(),
              ),
            ),
          );
        },
      ).then((value) => safeSetState(() {}));

      _model.getProvince = await TeleGetProvinceAPICall.call(
        apiUrl: FFAppState().apiUrlInsuranceAppState,
      );

      if ((_model.getProvince?.statusCode ?? 200) != 200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(
                    'พบข้อผิดพลาด (${(_model.getProvince?.statusCode ?? 200).toString()})'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              ),
            );
          },
        );
        Navigator.pop(context);
        return;
      }
      if (TeleGetProvinceAPICall.statusLevel1(
            (_model.getProvince?.jsonBody ?? ''),
          ) !=
          200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(TeleGetProvinceAPICall.messageLayer1(
                  (_model.getProvince?.jsonBody ?? ''),
                )!),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              ),
            );
          },
        );
        Navigator.pop(context);
        return;
      }
      FFAppState().insuranceInfoRegistrationCodeList =
          TeleGetProvinceAPICall.provinceID(
        (_model.getProvince?.jsonBody ?? ''),
      )!
              .toList()
              .cast<String>();
      FFAppState().insuranceInfoRegistrationprovinceList =
          TeleGetProvinceAPICall.provinceNameTH(
        (_model.getProvince?.jsonBody ?? ''),
      )!
              .toList()
              .cast<String>();
      safeSetState(() {});
      if (FFAppState().flagRenew == '1') {
        _model.getVehicleUsedTypeAPI =
            await InsuranceRequestGetVehicleAPICall.call(
          apiUrl: FFAppState().apiUrlInsuranceAppState,
          vehicleCategory: 'manual',
        );

        if ((_model.getVehicleUsedTypeAPI?.statusCode ?? 200) != 200) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  content: Text(
                      'พบข้อผิดพลาด (${(_model.getVehicleUsedTypeAPI?.statusCode ?? 200).toString()})'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child: Text('Ok'),
                    ),
                  ],
                ),
              );
            },
          );
          return;
        }
        if (InsuranceRequestGetVehicleAPICall.statusLayer1(
              (_model.getVehicleUsedTypeAPI?.jsonBody ?? ''),
            ) ==
            200) {
          FFAppState().insuranceBasicVehicleUsedTypeCodeList =
              InsuranceRequestGetVehicleAPICall.vehicleCode(
            (_model.getVehicleUsedTypeAPI?.jsonBody ?? ''),
          )!
                  .toList()
                  .cast<String>();
          FFAppState().insuranceBasicVehicleUsedTypeNameList =
              InsuranceRequestGetVehicleAPICall.vehicleName(
            (_model.getVehicleUsedTypeAPI?.jsonBody ?? ''),
          )!
                  .toList()
                  .cast<String>();
          FFAppState().insuranceBasicVehicleUsedTypeTypeList =
              InsuranceRequestGetVehicleAPICall.vehicletype(
            (_model.getVehicleUsedTypeAPI?.jsonBody ?? ''),
          )!
                  .toList()
                  .cast<String>();
          FFAppState().insuranceBasicVehicleUsedTypeIdList =
              InsuranceRequestGetVehicleAPICall.vehicleId(
            (_model.getVehicleUsedTypeAPI?.jsonBody ?? ''),
          )!
                  .toList()
                  .cast<String>();
          FFAppState().insuranceRequestIsLoadedData = false;
          FFAppState().insuranceRequestIsLoadDataMc = false;
          FFAppState().update(() {});
        } else {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  content: Text(InsuranceRequestGetVehicleAPICall.messageLayer1(
                    (_model.getVehicleUsedTypeAPI?.jsonBody ?? ''),
                  )!),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child: Text('Ok'),
                    ),
                  ],
                ),
              );
            },
          );
          return;
        }
      }
      Navigator.pop(context);
    });

    _model.textController1 ??= TextEditingController(
        text: valueOrDefault<String>(
      FFAppState().leadsHouse.firstOrNull?.amoutHouse,
      'กรอกจำนวนคูหา/หลัง/ห้อง',
    ));
    _model.textFieldFocusNode1 ??= FocusNode();
    _model.textFieldFocusNode1!.addListener(
      () async {
        FFAppState().updateLeadsHouseAtIndex(
          0,
          (e) => e..amoutHouse = _model.textController1.text,
        );
        safeSetState(() {});
      },
    );
    _model.textController2 ??= TextEditingController(
        text: valueOrDefault<String>(
      FFAppState().leadsHouse.firstOrNull?.floor,
      'กรอกจำนวนชั้น',
    ));
    _model.textFieldFocusNode2 ??= FocusNode();
    _model.textFieldFocusNode2!.addListener(
      () async {
        FFAppState().updateLeadsHouseAtIndex(
          0,
          (e) => e..floor = _model.textController2.text,
        );
        safeSetState(() {});
      },
    );
    _model.widthTextFieldTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      FFAppState().leadsHouse.firstOrNull?.width,
      'กว้าง',
    ));
    _model.widthTextFieldFocusNode ??= FocusNode();
    _model.widthTextFieldFocusNode!.addListener(
      () async {
        FFAppState().updateLeadsHouseAtIndex(
          0,
          (e) => e..width = _model.widthTextFieldTextController.text,
        );
        safeSetState(() {});
      },
    );
    _model.longTextFieldTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      FFAppState().leadsHouse.firstOrNull?.length,
      'ยาว',
    ));
    _model.longTextFieldFocusNode ??= FocusNode();
    _model.longTextFieldFocusNode!.addListener(
      () async {
        FFAppState().updateLeadsHouseAtIndex(
          0,
          (e) => e..length = _model.longTextFieldTextController.text,
        );
        safeSetState(() {});
      },
    );
    _model.textController5 ??= TextEditingController(
        text: valueOrDefault<String>(
      FFAppState().leadsHouse.firstOrNull?.usableArea,
      '0',
    ));
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController6 ??= TextEditingController(
        text: FFAppState().leadsHouse.firstOrNull?.sumInsureHouse);
    _model.textFieldFocusNode4 ??= FocusNode();

    _model.textController7 ??= TextEditingController(
        text: FFAppState().leadsHouse.firstOrNull?.sumInsureBuildin);
    _model.textFieldFocusNode5 ??= FocusNode();

    _model.textController8 ??= TextEditingController(
        text: FFAppState().leadsHouse.firstOrNull?.sumInsureTotal);
    _model.textFieldFocusNode6 ??= FocusNode();

    _model.textController9 ??= TextEditingController(
        text: FFAppState().leadsHouse.firstOrNull?.sumInsureTotal);
    _model.textFieldFocusNode7 ??= FocusNode();

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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Color(0xFFDB771A),
                size: 30.0,
              ),
              onPressed: () async {
                await Future.delayed(const Duration(milliseconds: 500));
                context.safePop();
              },
            ),
            title: Text(
              FFAppState().insuranceinfoActType == 'MC'
                  ? '2. ข้อมูลมอเตอร์ไซค์'
                  : '2. ข้อมูลรถยนต์',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Noto Sans Thai',
                    color: Color(0xFF003063),
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 2.0,
          ),
          body: SafeArea(
            top: true,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 15.0, 12.0, 0.0),
              child: FutureBuilder<List<DataListRecord>>(
                future: queryDataListRecordOnce(
                  singleRecord: true,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  List<DataListRecord> columnDataListRecordList =
                      snapshot.data!;
                  final columnDataListRecord =
                      columnDataListRecordList.isNotEmpty
                          ? columnDataListRecordList.first
                          : null;

                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FutureBuilder<List<EffectiveDayConfigRecord>>(
                          future: queryEffectiveDayConfigRecordOnce(
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<EffectiveDayConfigRecord>
                                columnEffectiveDayConfigRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final columnEffectiveDayConfigRecord =
                                columnEffectiveDayConfigRecordList.isNotEmpty
                                    ? columnEffectiveDayConfigRecordList.first
                                    : null;

                            return SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (FFAppState().insuranceinfoActType ==
                                      'House')
                                    wrapWithModel(
                                      model: _model
                                          .infomationCustomerFireInsuranceModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child:
                                          InfomationCustomerFireInsuranceWidget(),
                                    ),
                                  if (FFAppState().insuranceinfoActType !=
                                      'CMI')
                                    wrapWithModel(
                                      model: _model.infomationCustomerModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: InfomationCustomerWidget(),
                                    ),
                                  if (FFAppState().insuranceinfoActType ==
                                      'CMI')
                                    wrapWithModel(
                                      model: _model.infomationCustomerActModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: InfomationCustomerActWidget(),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 1.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.1,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 1.0,
                                              color: Color(0x33000000),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: Color(0xFFE6E6E6),
                                          ),
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 5.0, 0.0),
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.11,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.11,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFD9761A),
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFFAFAFA),
                                                      ),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      '1',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            color: Color(
                                                                0xFFFAFAFA),
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.06,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        width: 32.0,
                                                        child: Divider(
                                                          thickness: 1.0,
                                                          color:
                                                              Color(0xFFD9761A),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.11,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.11,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFD9761A),
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: Color(0xFFB3B3B3),
                                                    ),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    '2',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFFFAFAFA),
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.06,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        width: 32.0,
                                                        child: Divider(
                                                          thickness: 1.0,
                                                          color:
                                                              Color(0xFFB3B3B3),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.11,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.11,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: Color(0xFFB3B3B3),
                                                    ),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    '3',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFFB3B3B3),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.06,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        width: 32.0,
                                                        child: Divider(
                                                          thickness: 1.0,
                                                          color:
                                                              Color(0xFFB3B3B3),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.11,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.11,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: Color(0xFFB3B3B3),
                                                    ),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    '4',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFFB3B3B3),
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.06,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        width: 32.0,
                                                        child: Divider(
                                                          thickness: 1.0,
                                                          color:
                                                              Color(0xFFB3B3B3),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.11,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.11,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: Color(0xFFB3B3B3),
                                                    ),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    '5',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFFB3B3B3),
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'ประเภทที่อยู่อาศัย',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        '(บังคับเลือก)',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Noto Sans Thai',
                                                              color: Color(
                                                                  0xFFFB0606),
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    if (FFAppState()
                                                            .flagRenew !=
                                                        '1') {
                                                      return;
                                                    }

                                                    context.pushNamed(
                                                      'SearchableCarListPage',
                                                      queryParameters: {
                                                        'titleText':
                                                            serializeParam(
                                                          'เลือกประเภทรถ',
                                                          ParamType.String,
                                                        ),
                                                        'searchLabel':
                                                            serializeParam(
                                                          'ระบุประเภทรถ',
                                                          ParamType.String,
                                                        ),
                                                        'dataList':
                                                            serializeParam(
                                                          FFAppState()
                                                              .insuranceBasicVehicleTypeDropdownList,
                                                          ParamType.String,
                                                          isList: true,
                                                        ),
                                                        'multiSelect':
                                                            serializeParam(
                                                          false,
                                                          ParamType.bool,
                                                        ),
                                                        'maxSelected':
                                                            serializeParam(
                                                          0,
                                                          ParamType.int,
                                                        ),
                                                        'fromPage':
                                                            serializeParam(
                                                          'RenewStep2',
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFB3B3B3),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              FFAppState()
                                                                  .leadsHouse
                                                                  .firstOrNull
                                                                  ?.houseTypeName,
                                                              'ประเภทที่อยู่อาศัย',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .black600,
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      20.0,
                                                                      0.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child:
                                                                Image.network(
                                                              getCORSProxyUrl(
                                                                () {
                                                                  if (FFAppState()
                                                                          .leadsHouse
                                                                          .firstOrNull
                                                                          ?.houseTypeCode ==
                                                                      '01') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/HouseIconImage%2F%E0%B8%9A%E0%B9%89%E0%B8%B2%E0%B8%99%E0%B9%80%E0%B8%94%E0%B8%B5%E0%B9%88%E0%B8%A2%E0%B8%A7.png?alt=media&token=83ea9fa1-4e9e-4cd7-986e-1953e1f1d7af';
                                                                  } else if (FFAppState()
                                                                          .leadsHouse
                                                                          .firstOrNull
                                                                          ?.houseTypeCode ==
                                                                      '02') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/HouseIconImage%2F%E0%B8%9A%E0%B9%89%E0%B8%B2%E0%B8%99%E0%B9%81%E0%B8%9D%E0%B8%94.png?alt=media&token=ceefec3b-2110-4d24-8134-b00849d149e8';
                                                                  } else if (FFAppState()
                                                                          .leadsHouse
                                                                          .firstOrNull
                                                                          ?.houseTypeCode ==
                                                                      '03') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/HouseIconImage%2F%E0%B8%97%E0%B8%B2%E0%B8%A7%E0%B8%99%E0%B9%8C%E0%B9%82%E0%B8%AE%E0%B8%A1.png?alt=media&token=3afddb2c-f586-442a-961a-93a674404956';
                                                                  } else if (FFAppState()
                                                                          .leadsHouse
                                                                          .firstOrNull
                                                                          ?.houseTypeCode ==
                                                                      '04') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/HouseIconImage%2F%E0%B8%97%E0%B8%B2%E0%B8%A7%E0%B9%82%E0%B8%AE%E0%B8%A1.png?alt=media&token=1442ab05-762c-4e71-bd91-6ebccdf53d24';
                                                                  } else if (FFAppState()
                                                                          .leadsHouse
                                                                          .firstOrNull
                                                                          ?.houseTypeCode ==
                                                                      '05') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/HouseIconImage%2F%E0%B8%AD%E0%B8%B2%E0%B8%84%E0%B8%B2%E0%B8%A3%E0%B8%9E%E0%B8%B2%E0%B8%99%E0%B8%B4%E0%B8%8A%E0%B8%A2%E0%B9%8C.png?alt=media&token=910f1d50-5a81-44f4-bcf7-c0f52c3bb4ec';
                                                                  } else if (FFAppState()
                                                                          .leadsHouse
                                                                          .firstOrNull
                                                                          ?.houseTypeCode ==
                                                                      '06') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/HouseIconImage%2F%E0%B8%95%E0%B8%B6%E0%B8%81%E0%B9%81%E0%B8%96%E0%B8%A7.png?alt=media&token=ba2c7eac-e698-42c3-9b5e-d5cac2c5bafa';
                                                                  } else if (FFAppState()
                                                                          .leadsHouse
                                                                          .firstOrNull
                                                                          ?.houseTypeCode ==
                                                                      '07') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/HouseIconImage%2F%E0%B8%84%E0%B8%AD%E0%B8%99%E0%B9%82%E0%B8%94.png?alt=media&token=d1956b42-ac8d-4a81-9cef-35878e4e4ee6';
                                                                  } else {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/HouseIconImage%2F%E0%B9%81%E0%B8%9F%E0%B8%A5%E0%B8%95.png?alt=media&token=9d47e673-5fef-4986-a801-9790459f24e2';
                                                                  }
                                                                }(),
                                                              ),
                                                              width: 90.0,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'ฝาผนัง',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        '(บังคับเลือก)',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Noto Sans Thai',
                                                              color: Color(
                                                                  0xFFFB0606),
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'FireSearchableListPage',
                                                      queryParameters: {
                                                        'titleText':
                                                            serializeParam(
                                                          'เลือกฝาผนัง',
                                                          ParamType.String,
                                                        ),
                                                        'searchLabel':
                                                            serializeParam(
                                                          'ระบุฝาผนัง',
                                                          ParamType.String,
                                                        ),
                                                        'dataList':
                                                            serializeParam(
                                                          widget!
                                                              .masterDataFirebase
                                                              ?.wall,
                                                          ParamType.String,
                                                          isList: true,
                                                        ),
                                                        'multiSelect':
                                                            serializeParam(
                                                          false,
                                                          ParamType.bool,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFB3B3B3),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              FFAppState()
                                                                  .leadsHouse
                                                                  .firstOrNull
                                                                  ?.wall,
                                                              'เลือกฝาผนัง',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      20.0,
                                                                      0.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child:
                                                                Image.network(
                                                              getCORSProxyUrl(
                                                                () {
                                                                  if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'รถเก๋ง') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%A3%E0%B8%96%E0%B9%80%E0%B8%81%E0%B9%8B%E0%B8%87.png?alt=media&token=68ef0a76-99d9-4c43-ae86-b48970b7fb09';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'รถตู้') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%A3%E0%B8%96%E0%B8%95%E0%B8%B9%E0%B9%89.png?alt=media&token=8969fa4a-52e0-4b0c-9c44-f349976bc624';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'รถกระบะ 2 ประตู') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%81%E0%B8%B0%E0%B8%9A%E0%B8%B0%20%E0%B8%95%E0%B8%AD%E0%B8%99%E0%B9%80%E0%B8%94%E0%B8%B5%E0%B8%A2%E0%B8%A7%20(%E0%B8%A3%E0%B8%A7%E0%B8%A1).png?alt=media&token=bd62e47d-dd92-41ca-8f51-3632edfd54a6';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'รถกระบะ 4 ประตู') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%81%E0%B8%B0%E0%B8%9A%E0%B8%B0%204%20%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B8%95%E0%B8%B9.png?alt=media&token=45bc2e60-3a29-47dc-aa4d-e9c82a113bbc';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'รถบรรทุก หัวลาก หางพ่วง') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%AB%E0%B8%B1%E0%B8%A7%E0%B8%A5%E0%B8%B2%E0%B8%81%20%E0%B8%AB%E0%B8%B2%E0%B8%87%E0%B8%9E%E0%B9%88%E0%B8%A7%E0%B8%87.png?alt=media&token=1d749f04-0765-422a-b0b7-34a3d5d60519';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'รถแต่ง ต่อคอก') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%A3%E0%B8%96%E0%B9%81%E0%B8%95%E0%B9%88%E0%B8%87%E0%B8%95%E0%B9%88%E0%B8%AD%E0%B8%84%E0%B8%AD%E0%B8%81.png?alt=media&token=80501c24-fec4-4c34-ac0f-361db3b698b3';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'กระบะไม่ต่อเติม') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%81%E0%B8%B0%E0%B8%9A%E0%B8%B0%202%20%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B8%95%E0%B8%B9%E0%B9%84%E0%B8%A1%E0%B9%88%E0%B8%95%E0%B9%88%E0%B8%AD%E0%B9%80%E0%B8%95%E0%B8%B4%E0%B8%A1.png?alt=media&token=ca1d014f-d1aa-4f27-bd54-3d97d5efba3f';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'กระบะต่อเติมเกินหัวเก๋ง') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%81%E0%B8%A3%E0%B8%B0%E0%B8%9A%E0%B8%B0%E0%B8%95%E0%B9%88%E0%B8%AD%E0%B9%80%E0%B8%95%E0%B8%B4%E0%B8%A1%E0%B9%80%E0%B8%81%E0%B8%B4%E0%B8%99%E0%B8%AB%E0%B8%B1%E0%B8%A7%E0%B9%80%E0%B8%81%E0%B9%8B%E0%B8%87.png?alt=media&token=957c9ae1-6d8a-41d5-b7aa-23965926a562';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'กระบะต่อเติมเกินหัวเก๋ง') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%81%E0%B8%A3%E0%B8%B0%E0%B8%9A%E0%B8%B0%E0%B8%95%E0%B9%88%E0%B8%AD%E0%B9%80%E0%B8%95%E0%B8%B4%E0%B8%A1%E0%B9%80%E0%B8%81%E0%B8%B4%E0%B8%99%E0%B8%AB%E0%B8%B1%E0%B8%A7%E0%B9%80%E0%B8%81%E0%B9%8B%E0%B8%87.png?alt=media&token=957c9ae1-6d8a-41d5-b7aa-23965926a562';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'กระบะตู้ทึบ/ตู้แห้ง') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F2_%E0%B8%81%E0%B8%A3%E0%B8%B0%E0%B8%9A%E0%B8%B0%E0%B8%95%E0%B8%B9%E0%B9%89%E0%B8%97%E0%B8%B6%E0%B8%9A_%E0%B8%95%E0%B8%B9%E0%B9%89%E0%B9%81%E0%B8%AB%E0%B9%89%E0%B8%87.png?alt=media&token=71715c79-6196-4a63-9a9e-c179033218ea';
                                                                  } else {
                                                                    return '-';
                                                                  }
                                                                }(),
                                                              ),
                                                              width: () {
                                                                if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถเก๋ง') {
                                                                  return 90;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถตู้') {
                                                                  return 90;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถกระบะ 2 ประตู') {
                                                                  return 90;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถกระบะ 4 ประตู') {
                                                                  return 90;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถบรรทุก หัวลาก หางพ่วง') {
                                                                  return 130;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถแต่ง ต่อคอก') {
                                                                  return 90;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'กระบะไม่ต่อเติม') {
                                                                  return 100;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'กระบะต่อเติมเกินหัวเก๋ง') {
                                                                  return 130;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'กระบะต่อเติมไม่เกินหัวเก๋ง') {
                                                                  return 130;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'กระบะตู้ทึบ/ตู้แห้ง') {
                                                                  return 100;
                                                                } else {
                                                                  return 0;
                                                                }
                                                              }()
                                                                  .toDouble(),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'พื้นชั้นบน',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        '(บังคับเลือก)',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Noto Sans Thai',
                                                              color: Color(
                                                                  0xFFFB0606),
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'FireSearchableListPage',
                                                      queryParameters: {
                                                        'titleText':
                                                            serializeParam(
                                                          'เลือกพื้นชั้นบน',
                                                          ParamType.String,
                                                        ),
                                                        'searchLabel':
                                                            serializeParam(
                                                          'ระบุพื้นชั้นบน',
                                                          ParamType.String,
                                                        ),
                                                        'dataList':
                                                            serializeParam(
                                                          widget!
                                                              .masterDataFirebase
                                                              ?.floor,
                                                          ParamType.String,
                                                          isList: true,
                                                        ),
                                                        'multiSelect':
                                                            serializeParam(
                                                          false,
                                                          ParamType.bool,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFB3B3B3),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              FFAppState()
                                                                  .leadsHouse
                                                                  .firstOrNull
                                                                  ?.floorUpper,
                                                              'เลือกพื้นชั้นบน',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      20.0,
                                                                      0.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child:
                                                                Image.network(
                                                              getCORSProxyUrl(
                                                                () {
                                                                  if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'รถเก๋ง') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%A3%E0%B8%96%E0%B9%80%E0%B8%81%E0%B9%8B%E0%B8%87.png?alt=media&token=68ef0a76-99d9-4c43-ae86-b48970b7fb09';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'รถตู้') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%A3%E0%B8%96%E0%B8%95%E0%B8%B9%E0%B9%89.png?alt=media&token=8969fa4a-52e0-4b0c-9c44-f349976bc624';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'รถกระบะ 2 ประตู') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%81%E0%B8%B0%E0%B8%9A%E0%B8%B0%20%E0%B8%95%E0%B8%AD%E0%B8%99%E0%B9%80%E0%B8%94%E0%B8%B5%E0%B8%A2%E0%B8%A7%20(%E0%B8%A3%E0%B8%A7%E0%B8%A1).png?alt=media&token=bd62e47d-dd92-41ca-8f51-3632edfd54a6';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'รถกระบะ 4 ประตู') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%81%E0%B8%B0%E0%B8%9A%E0%B8%B0%204%20%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B8%95%E0%B8%B9.png?alt=media&token=45bc2e60-3a29-47dc-aa4d-e9c82a113bbc';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'รถบรรทุก หัวลาก หางพ่วง') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%AB%E0%B8%B1%E0%B8%A7%E0%B8%A5%E0%B8%B2%E0%B8%81%20%E0%B8%AB%E0%B8%B2%E0%B8%87%E0%B8%9E%E0%B9%88%E0%B8%A7%E0%B8%87.png?alt=media&token=1d749f04-0765-422a-b0b7-34a3d5d60519';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'รถแต่ง ต่อคอก') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%A3%E0%B8%96%E0%B9%81%E0%B8%95%E0%B9%88%E0%B8%87%E0%B8%95%E0%B9%88%E0%B8%AD%E0%B8%84%E0%B8%AD%E0%B8%81.png?alt=media&token=80501c24-fec4-4c34-ac0f-361db3b698b3';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'กระบะไม่ต่อเติม') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%81%E0%B8%B0%E0%B8%9A%E0%B8%B0%202%20%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B8%95%E0%B8%B9%E0%B9%84%E0%B8%A1%E0%B9%88%E0%B8%95%E0%B9%88%E0%B8%AD%E0%B9%80%E0%B8%95%E0%B8%B4%E0%B8%A1.png?alt=media&token=ca1d014f-d1aa-4f27-bd54-3d97d5efba3f';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'กระบะต่อเติมเกินหัวเก๋ง') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%81%E0%B8%A3%E0%B8%B0%E0%B8%9A%E0%B8%B0%E0%B8%95%E0%B9%88%E0%B8%AD%E0%B9%80%E0%B8%95%E0%B8%B4%E0%B8%A1%E0%B9%80%E0%B8%81%E0%B8%B4%E0%B8%99%E0%B8%AB%E0%B8%B1%E0%B8%A7%E0%B9%80%E0%B8%81%E0%B9%8B%E0%B8%87.png?alt=media&token=957c9ae1-6d8a-41d5-b7aa-23965926a562';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'กระบะต่อเติมเกินหัวเก๋ง') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%81%E0%B8%A3%E0%B8%B0%E0%B8%9A%E0%B8%B0%E0%B8%95%E0%B9%88%E0%B8%AD%E0%B9%80%E0%B8%95%E0%B8%B4%E0%B8%A1%E0%B9%80%E0%B8%81%E0%B8%B4%E0%B8%99%E0%B8%AB%E0%B8%B1%E0%B8%A7%E0%B9%80%E0%B8%81%E0%B9%8B%E0%B8%87.png?alt=media&token=957c9ae1-6d8a-41d5-b7aa-23965926a562';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'กระบะตู้ทึบ/ตู้แห้ง') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F2_%E0%B8%81%E0%B8%A3%E0%B8%B0%E0%B8%9A%E0%B8%B0%E0%B8%95%E0%B8%B9%E0%B9%89%E0%B8%97%E0%B8%B6%E0%B8%9A_%E0%B8%95%E0%B8%B9%E0%B9%89%E0%B9%81%E0%B8%AB%E0%B9%89%E0%B8%87.png?alt=media&token=71715c79-6196-4a63-9a9e-c179033218ea';
                                                                  } else {
                                                                    return '-';
                                                                  }
                                                                }(),
                                                              ),
                                                              width: () {
                                                                if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถเก๋ง') {
                                                                  return 90;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถตู้') {
                                                                  return 90;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถกระบะ 2 ประตู') {
                                                                  return 90;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถกระบะ 4 ประตู') {
                                                                  return 90;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถบรรทุก หัวลาก หางพ่วง') {
                                                                  return 130;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถแต่ง ต่อคอก') {
                                                                  return 90;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'กระบะไม่ต่อเติม') {
                                                                  return 100;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'กระบะต่อเติมเกินหัวเก๋ง') {
                                                                  return 130;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'กระบะต่อเติมไม่เกินหัวเก๋ง') {
                                                                  return 130;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'กระบะตู้ทึบ/ตู้แห้ง') {
                                                                  return 100;
                                                                } else {
                                                                  return 0;
                                                                }
                                                              }()
                                                                  .toDouble(),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'พื้นชั้นล่าง',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        '(บังคับเลือก)',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Noto Sans Thai',
                                                              color: Color(
                                                                  0xFFFB0606),
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'FireSearchableListPage',
                                                      queryParameters: {
                                                        'titleText':
                                                            serializeParam(
                                                          'เลือกพื้นชั้นล่าง',
                                                          ParamType.String,
                                                        ),
                                                        'searchLabel':
                                                            serializeParam(
                                                          'ระบุพื้นชั้นล่าง',
                                                          ParamType.String,
                                                        ),
                                                        'dataList':
                                                            serializeParam(
                                                          widget!
                                                              .masterDataFirebase
                                                              ?.floor,
                                                          ParamType.String,
                                                          isList: true,
                                                        ),
                                                        'multiSelect':
                                                            serializeParam(
                                                          false,
                                                          ParamType.bool,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFB3B3B3),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              FFAppState()
                                                                  .leadsHouse
                                                                  .firstOrNull
                                                                  ?.floorUpper,
                                                              'เลือกพื้นชั้นล่าง',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      20.0,
                                                                      0.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child:
                                                                Image.network(
                                                              getCORSProxyUrl(
                                                                () {
                                                                  if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'รถเก๋ง') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%A3%E0%B8%96%E0%B9%80%E0%B8%81%E0%B9%8B%E0%B8%87.png?alt=media&token=68ef0a76-99d9-4c43-ae86-b48970b7fb09';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'รถตู้') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%A3%E0%B8%96%E0%B8%95%E0%B8%B9%E0%B9%89.png?alt=media&token=8969fa4a-52e0-4b0c-9c44-f349976bc624';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'รถกระบะ 2 ประตู') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%81%E0%B8%B0%E0%B8%9A%E0%B8%B0%20%E0%B8%95%E0%B8%AD%E0%B8%99%E0%B9%80%E0%B8%94%E0%B8%B5%E0%B8%A2%E0%B8%A7%20(%E0%B8%A3%E0%B8%A7%E0%B8%A1).png?alt=media&token=bd62e47d-dd92-41ca-8f51-3632edfd54a6';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'รถกระบะ 4 ประตู') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%81%E0%B8%B0%E0%B8%9A%E0%B8%B0%204%20%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B8%95%E0%B8%B9.png?alt=media&token=45bc2e60-3a29-47dc-aa4d-e9c82a113bbc';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'รถบรรทุก หัวลาก หางพ่วง') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%AB%E0%B8%B1%E0%B8%A7%E0%B8%A5%E0%B8%B2%E0%B8%81%20%E0%B8%AB%E0%B8%B2%E0%B8%87%E0%B8%9E%E0%B9%88%E0%B8%A7%E0%B8%87.png?alt=media&token=1d749f04-0765-422a-b0b7-34a3d5d60519';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'รถแต่ง ต่อคอก') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%A3%E0%B8%96%E0%B9%81%E0%B8%95%E0%B9%88%E0%B8%87%E0%B8%95%E0%B9%88%E0%B8%AD%E0%B8%84%E0%B8%AD%E0%B8%81.png?alt=media&token=80501c24-fec4-4c34-ac0f-361db3b698b3';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'กระบะไม่ต่อเติม') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%81%E0%B8%B0%E0%B8%9A%E0%B8%B0%202%20%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B8%95%E0%B8%B9%E0%B9%84%E0%B8%A1%E0%B9%88%E0%B8%95%E0%B9%88%E0%B8%AD%E0%B9%80%E0%B8%95%E0%B8%B4%E0%B8%A1.png?alt=media&token=ca1d014f-d1aa-4f27-bd54-3d97d5efba3f';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'กระบะต่อเติมเกินหัวเก๋ง') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%81%E0%B8%A3%E0%B8%B0%E0%B8%9A%E0%B8%B0%E0%B8%95%E0%B9%88%E0%B8%AD%E0%B9%80%E0%B8%95%E0%B8%B4%E0%B8%A1%E0%B9%80%E0%B8%81%E0%B8%B4%E0%B8%99%E0%B8%AB%E0%B8%B1%E0%B8%A7%E0%B9%80%E0%B8%81%E0%B9%8B%E0%B8%87.png?alt=media&token=957c9ae1-6d8a-41d5-b7aa-23965926a562';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'กระบะต่อเติมเกินหัวเก๋ง') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%81%E0%B8%A3%E0%B8%B0%E0%B8%9A%E0%B8%B0%E0%B8%95%E0%B9%88%E0%B8%AD%E0%B9%80%E0%B8%95%E0%B8%B4%E0%B8%A1%E0%B9%80%E0%B8%81%E0%B8%B4%E0%B8%99%E0%B8%AB%E0%B8%B1%E0%B8%A7%E0%B9%80%E0%B8%81%E0%B9%8B%E0%B8%87.png?alt=media&token=957c9ae1-6d8a-41d5-b7aa-23965926a562';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'กระบะตู้ทึบ/ตู้แห้ง') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F2_%E0%B8%81%E0%B8%A3%E0%B8%B0%E0%B8%9A%E0%B8%B0%E0%B8%95%E0%B8%B9%E0%B9%89%E0%B8%97%E0%B8%B6%E0%B8%9A_%E0%B8%95%E0%B8%B9%E0%B9%89%E0%B9%81%E0%B8%AB%E0%B9%89%E0%B8%87.png?alt=media&token=71715c79-6196-4a63-9a9e-c179033218ea';
                                                                  } else {
                                                                    return '-';
                                                                  }
                                                                }(),
                                                              ),
                                                              width: () {
                                                                if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถเก๋ง') {
                                                                  return 90;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถตู้') {
                                                                  return 90;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถกระบะ 2 ประตู') {
                                                                  return 90;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถกระบะ 4 ประตู') {
                                                                  return 90;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถบรรทุก หัวลาก หางพ่วง') {
                                                                  return 130;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถแต่ง ต่อคอก') {
                                                                  return 90;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'กระบะไม่ต่อเติม') {
                                                                  return 100;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'กระบะต่อเติมเกินหัวเก๋ง') {
                                                                  return 130;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'กระบะต่อเติมไม่เกินหัวเก๋ง') {
                                                                  return 130;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'กระบะตู้ทึบ/ตู้แห้ง') {
                                                                  return 100;
                                                                } else {
                                                                  return 0;
                                                                }
                                                              }()
                                                                  .toDouble(),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'โครงสร้างหลังคา',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        '(บังคับเลือก)',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Noto Sans Thai',
                                                              color: Color(
                                                                  0xFFFB0606),
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'FireSearchableListPage',
                                                      queryParameters: {
                                                        'titleText':
                                                            serializeParam(
                                                          'เลือกโครงสร้างหลังคา',
                                                          ParamType.String,
                                                        ),
                                                        'searchLabel':
                                                            serializeParam(
                                                          'ระบุโครงสร้างหลังคา',
                                                          ParamType.String,
                                                        ),
                                                        'dataList':
                                                            serializeParam(
                                                          widget!
                                                              .masterDataFirebase
                                                              ?.roofFrame,
                                                          ParamType.String,
                                                          isList: true,
                                                        ),
                                                        'multiSelect':
                                                            serializeParam(
                                                          false,
                                                          ParamType.bool,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFB3B3B3),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              FFAppState()
                                                                  .leadsHouse
                                                                  .firstOrNull
                                                                  ?.roofFrame,
                                                              'เลือกโครงสร้างหลังคา',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      20.0,
                                                                      0.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child:
                                                                Image.network(
                                                              getCORSProxyUrl(
                                                                () {
                                                                  if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'รถเก๋ง') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%A3%E0%B8%96%E0%B9%80%E0%B8%81%E0%B9%8B%E0%B8%87.png?alt=media&token=68ef0a76-99d9-4c43-ae86-b48970b7fb09';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'รถตู้') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%A3%E0%B8%96%E0%B8%95%E0%B8%B9%E0%B9%89.png?alt=media&token=8969fa4a-52e0-4b0c-9c44-f349976bc624';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'รถกระบะ 2 ประตู') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%81%E0%B8%B0%E0%B8%9A%E0%B8%B0%20%E0%B8%95%E0%B8%AD%E0%B8%99%E0%B9%80%E0%B8%94%E0%B8%B5%E0%B8%A2%E0%B8%A7%20(%E0%B8%A3%E0%B8%A7%E0%B8%A1).png?alt=media&token=bd62e47d-dd92-41ca-8f51-3632edfd54a6';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'รถกระบะ 4 ประตู') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%81%E0%B8%B0%E0%B8%9A%E0%B8%B0%204%20%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B8%95%E0%B8%B9.png?alt=media&token=45bc2e60-3a29-47dc-aa4d-e9c82a113bbc';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'รถบรรทุก หัวลาก หางพ่วง') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%AB%E0%B8%B1%E0%B8%A7%E0%B8%A5%E0%B8%B2%E0%B8%81%20%E0%B8%AB%E0%B8%B2%E0%B8%87%E0%B8%9E%E0%B9%88%E0%B8%A7%E0%B8%87.png?alt=media&token=1d749f04-0765-422a-b0b7-34a3d5d60519';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'รถแต่ง ต่อคอก') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%A3%E0%B8%96%E0%B9%81%E0%B8%95%E0%B9%88%E0%B8%87%E0%B8%95%E0%B9%88%E0%B8%AD%E0%B8%84%E0%B8%AD%E0%B8%81.png?alt=media&token=80501c24-fec4-4c34-ac0f-361db3b698b3';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'กระบะไม่ต่อเติม') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%81%E0%B8%B0%E0%B8%9A%E0%B8%B0%202%20%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B8%95%E0%B8%B9%E0%B9%84%E0%B8%A1%E0%B9%88%E0%B8%95%E0%B9%88%E0%B8%AD%E0%B9%80%E0%B8%95%E0%B8%B4%E0%B8%A1.png?alt=media&token=ca1d014f-d1aa-4f27-bd54-3d97d5efba3f';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'กระบะต่อเติมเกินหัวเก๋ง') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%81%E0%B8%A3%E0%B8%B0%E0%B8%9A%E0%B8%B0%E0%B8%95%E0%B9%88%E0%B8%AD%E0%B9%80%E0%B8%95%E0%B8%B4%E0%B8%A1%E0%B9%80%E0%B8%81%E0%B8%B4%E0%B8%99%E0%B8%AB%E0%B8%B1%E0%B8%A7%E0%B9%80%E0%B8%81%E0%B9%8B%E0%B8%87.png?alt=media&token=957c9ae1-6d8a-41d5-b7aa-23965926a562';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'กระบะต่อเติมเกินหัวเก๋ง') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%81%E0%B8%A3%E0%B8%B0%E0%B8%9A%E0%B8%B0%E0%B8%95%E0%B9%88%E0%B8%AD%E0%B9%80%E0%B8%95%E0%B8%B4%E0%B8%A1%E0%B9%80%E0%B8%81%E0%B8%B4%E0%B8%99%E0%B8%AB%E0%B8%B1%E0%B8%A7%E0%B9%80%E0%B8%81%E0%B9%8B%E0%B8%87.png?alt=media&token=957c9ae1-6d8a-41d5-b7aa-23965926a562';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'กระบะตู้ทึบ/ตู้แห้ง') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F2_%E0%B8%81%E0%B8%A3%E0%B8%B0%E0%B8%9A%E0%B8%B0%E0%B8%95%E0%B8%B9%E0%B9%89%E0%B8%97%E0%B8%B6%E0%B8%9A_%E0%B8%95%E0%B8%B9%E0%B9%89%E0%B9%81%E0%B8%AB%E0%B9%89%E0%B8%87.png?alt=media&token=71715c79-6196-4a63-9a9e-c179033218ea';
                                                                  } else {
                                                                    return '-';
                                                                  }
                                                                }(),
                                                              ),
                                                              width: () {
                                                                if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถเก๋ง') {
                                                                  return 90;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถตู้') {
                                                                  return 90;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถกระบะ 2 ประตู') {
                                                                  return 90;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถกระบะ 4 ประตู') {
                                                                  return 90;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถบรรทุก หัวลาก หางพ่วง') {
                                                                  return 130;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถแต่ง ต่อคอก') {
                                                                  return 90;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'กระบะไม่ต่อเติม') {
                                                                  return 100;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'กระบะต่อเติมเกินหัวเก๋ง') {
                                                                  return 130;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'กระบะต่อเติมไม่เกินหัวเก๋ง') {
                                                                  return 130;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'กระบะตู้ทึบ/ตู้แห้ง') {
                                                                  return 100;
                                                                } else {
                                                                  return 0;
                                                                }
                                                              }()
                                                                  .toDouble(),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'หลังคา',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        '(บังคับเลือก)',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Noto Sans Thai',
                                                              color: Color(
                                                                  0xFFFB0606),
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'FireSearchableListPage',
                                                      queryParameters: {
                                                        'titleText':
                                                            serializeParam(
                                                          'เลือกหลังคา',
                                                          ParamType.String,
                                                        ),
                                                        'searchLabel':
                                                            serializeParam(
                                                          'ระบุหลังคา',
                                                          ParamType.String,
                                                        ),
                                                        'dataList':
                                                            serializeParam(
                                                          widget!
                                                              .masterDataFirebase
                                                              ?.roof,
                                                          ParamType.String,
                                                          isList: true,
                                                        ),
                                                        'multiSelect':
                                                            serializeParam(
                                                          false,
                                                          ParamType.bool,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFB3B3B3),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              FFAppState()
                                                                  .leadsHouse
                                                                  .firstOrNull
                                                                  ?.roof,
                                                              'เลือกหลังคา',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      20.0,
                                                                      0.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child:
                                                                Image.network(
                                                              getCORSProxyUrl(
                                                                () {
                                                                  if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'รถเก๋ง') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%A3%E0%B8%96%E0%B9%80%E0%B8%81%E0%B9%8B%E0%B8%87.png?alt=media&token=68ef0a76-99d9-4c43-ae86-b48970b7fb09';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'รถตู้') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%A3%E0%B8%96%E0%B8%95%E0%B8%B9%E0%B9%89.png?alt=media&token=8969fa4a-52e0-4b0c-9c44-f349976bc624';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'รถกระบะ 2 ประตู') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%81%E0%B8%B0%E0%B8%9A%E0%B8%B0%20%E0%B8%95%E0%B8%AD%E0%B8%99%E0%B9%80%E0%B8%94%E0%B8%B5%E0%B8%A2%E0%B8%A7%20(%E0%B8%A3%E0%B8%A7%E0%B8%A1).png?alt=media&token=bd62e47d-dd92-41ca-8f51-3632edfd54a6';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'รถกระบะ 4 ประตู') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%81%E0%B8%B0%E0%B8%9A%E0%B8%B0%204%20%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B8%95%E0%B8%B9.png?alt=media&token=45bc2e60-3a29-47dc-aa4d-e9c82a113bbc';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'รถบรรทุก หัวลาก หางพ่วง') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%AB%E0%B8%B1%E0%B8%A7%E0%B8%A5%E0%B8%B2%E0%B8%81%20%E0%B8%AB%E0%B8%B2%E0%B8%87%E0%B8%9E%E0%B9%88%E0%B8%A7%E0%B8%87.png?alt=media&token=1d749f04-0765-422a-b0b7-34a3d5d60519';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'รถแต่ง ต่อคอก') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%A3%E0%B8%96%E0%B9%81%E0%B8%95%E0%B9%88%E0%B8%87%E0%B8%95%E0%B9%88%E0%B8%AD%E0%B8%84%E0%B8%AD%E0%B8%81.png?alt=media&token=80501c24-fec4-4c34-ac0f-361db3b698b3';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'กระบะไม่ต่อเติม') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%81%E0%B8%B0%E0%B8%9A%E0%B8%B0%202%20%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B8%95%E0%B8%B9%E0%B9%84%E0%B8%A1%E0%B9%88%E0%B8%95%E0%B9%88%E0%B8%AD%E0%B9%80%E0%B8%95%E0%B8%B4%E0%B8%A1.png?alt=media&token=ca1d014f-d1aa-4f27-bd54-3d97d5efba3f';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'กระบะต่อเติมเกินหัวเก๋ง') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%81%E0%B8%A3%E0%B8%B0%E0%B8%9A%E0%B8%B0%E0%B8%95%E0%B9%88%E0%B8%AD%E0%B9%80%E0%B8%95%E0%B8%B4%E0%B8%A1%E0%B9%80%E0%B8%81%E0%B8%B4%E0%B8%99%E0%B8%AB%E0%B8%B1%E0%B8%A7%E0%B9%80%E0%B8%81%E0%B9%8B%E0%B8%87.png?alt=media&token=957c9ae1-6d8a-41d5-b7aa-23965926a562';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'กระบะต่อเติมเกินหัวเก๋ง') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%81%E0%B8%A3%E0%B8%B0%E0%B8%9A%E0%B8%B0%E0%B8%95%E0%B9%88%E0%B8%AD%E0%B9%80%E0%B8%95%E0%B8%B4%E0%B8%A1%E0%B9%80%E0%B8%81%E0%B8%B4%E0%B8%99%E0%B8%AB%E0%B8%B1%E0%B8%A7%E0%B9%80%E0%B8%81%E0%B9%8B%E0%B8%87.png?alt=media&token=957c9ae1-6d8a-41d5-b7aa-23965926a562';
                                                                  } else if (FFAppState()
                                                                          .insuranceInfoCarTypeDetail ==
                                                                      'กระบะตู้ทึบ/ตู้แห้ง') {
                                                                    return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F2_%E0%B8%81%E0%B8%A3%E0%B8%B0%E0%B8%9A%E0%B8%B0%E0%B8%95%E0%B8%B9%E0%B9%89%E0%B8%97%E0%B8%B6%E0%B8%9A_%E0%B8%95%E0%B8%B9%E0%B9%89%E0%B9%81%E0%B8%AB%E0%B9%89%E0%B8%87.png?alt=media&token=71715c79-6196-4a63-9a9e-c179033218ea';
                                                                  } else {
                                                                    return '-';
                                                                  }
                                                                }(),
                                                              ),
                                                              width: () {
                                                                if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถเก๋ง') {
                                                                  return 90;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถตู้') {
                                                                  return 90;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถกระบะ 2 ประตู') {
                                                                  return 90;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถกระบะ 4 ประตู') {
                                                                  return 90;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถบรรทุก หัวลาก หางพ่วง') {
                                                                  return 130;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'รถแต่ง ต่อคอก') {
                                                                  return 90;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'กระบะไม่ต่อเติม') {
                                                                  return 100;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'กระบะต่อเติมเกินหัวเก๋ง') {
                                                                  return 130;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'กระบะต่อเติมไม่เกินหัวเก๋ง') {
                                                                  return 130;
                                                                } else if (FFAppState()
                                                                        .insuranceInfoCarTypeDetail ==
                                                                    'กระบะตู้ทึบ/ตู้แห้ง') {
                                                                  return 100;
                                                                } else {
                                                                  return 0;
                                                                }
                                                              }()
                                                                  .toDouble(),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'จำนวนคูหา/หลัง/ห้อง',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    '(บังคับกรอก)',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFFFB0606),
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'SearchableListPage',
                                                  queryParameters: {
                                                    'titleText': serializeParam(
                                                      'เลือกปีที่ผลิต',
                                                      ParamType.String,
                                                    ),
                                                    'searchLabel':
                                                        serializeParam(
                                                      'เลือกปี',
                                                      ParamType.String,
                                                    ),
                                                    'dataList': serializeParam(
                                                      functions.reverseList(
                                                          functions
                                                              .ganerateYearList(
                                                                  1957, 2023)
                                                              ?.toList()),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'multiSelect':
                                                        serializeParam(
                                                      false,
                                                      ParamType.bool,
                                                    ),
                                                    'fromPage': serializeParam(
                                                      'insuranceInfoPage2',
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                await actions
                                                    .hideKeyboardAction(
                                                  context,
                                                );
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: Color(0xFFB3B3B3),
                                                  ),
                                                ),
                                                child: Container(
                                                  width: 200.0,
                                                  child: TextFormField(
                                                    controller:
                                                        _model.textController1,
                                                    focusNode: _model
                                                        .textFieldFocusNode1,
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    validator: _model
                                                        .textController1Validator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'จำนวนชั้น',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    '(บังคับกรอก)',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFFFB0606),
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'SearchableListPage',
                                                  queryParameters: {
                                                    'titleText': serializeParam(
                                                      'เลือกปีที่ผลิต',
                                                      ParamType.String,
                                                    ),
                                                    'searchLabel':
                                                        serializeParam(
                                                      'เลือกปี',
                                                      ParamType.String,
                                                    ),
                                                    'dataList': serializeParam(
                                                      functions.reverseList(
                                                          functions
                                                              .ganerateYearList(
                                                                  1957, 2023)
                                                              ?.toList()),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'multiSelect':
                                                        serializeParam(
                                                      false,
                                                      ParamType.bool,
                                                    ),
                                                    'fromPage': serializeParam(
                                                      'insuranceInfoPage2',
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                await actions
                                                    .hideKeyboardAction(
                                                  context,
                                                );
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: Color(0xFFB3B3B3),
                                                  ),
                                                ),
                                                child: Container(
                                                  width: 200.0,
                                                  child: TextFormField(
                                                    controller:
                                                        _model.textController2,
                                                    focusNode: _model
                                                        .textFieldFocusNode2,
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    validator: _model
                                                        .textController2Validator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'ขนาดพื้นที่ใช้สอย',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      '(กรุณากรอก)',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            color: Color(
                                                                0xFFFF0202),
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                10.0, 10.0),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 60.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFF8A8989),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    0.0,
                                                                    5.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .widthTextFieldTextController,
                                                                  focusNode: _model
                                                                      .widthTextFieldFocusNode,
                                                                  autofocus:
                                                                      false,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto Sans Thai',
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto Sans Thai',
                                                                          color:
                                                                              Color(0xFFB3B1B1),
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans Thai',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  cursorColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  validator: _model
                                                                      .widthTextFieldTextControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'X',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        color:
                                                            Color(0xFF5E5D5D),
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10.0,
                                                                10.0,
                                                                0.0,
                                                                10.0),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 60.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFF8A8989),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    0.0,
                                                                    5.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .longTextFieldTextController,
                                                                  focusNode: _model
                                                                      .longTextFieldFocusNode,
                                                                  autofocus:
                                                                      false,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto Sans Thai',
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto Sans Thai',
                                                                          color:
                                                                              Color(0xFFB3B1B1),
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans Thai',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  cursorColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  validator: _model
                                                                      .longTextFieldTextControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'เมตร',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFF5E5D5D),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'ขนาดพื้นที่ใช้สอย',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'SearchableListPage',
                                                  queryParameters: {
                                                    'titleText': serializeParam(
                                                      'เลือกปีที่ผลิต',
                                                      ParamType.String,
                                                    ),
                                                    'searchLabel':
                                                        serializeParam(
                                                      'เลือกปี',
                                                      ParamType.String,
                                                    ),
                                                    'dataList': serializeParam(
                                                      functions.reverseList(
                                                          functions
                                                              .ganerateYearList(
                                                                  1957, 2023)
                                                              ?.toList()),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'multiSelect':
                                                        serializeParam(
                                                      false,
                                                      ParamType.bool,
                                                    ),
                                                    'fromPage': serializeParam(
                                                      'insuranceInfoPage2',
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                await actions
                                                    .hideKeyboardAction(
                                                  context,
                                                );
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: Color(0xFFB3B3B3),
                                                  ),
                                                ),
                                                child: Container(
                                                  width: 200.0,
                                                  child: TextFormField(
                                                    controller:
                                                        _model.textController5,
                                                    focusNode: _model
                                                        .textFieldFocusNode3,
                                                    autofocus: false,
                                                    readOnly: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    validator: _model
                                                        .textController5Validator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'ผู้เอาประกันภัย',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    '(กรุณาเลือก)',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFFFB0606),
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'SearchableHouseList',
                                                  queryParameters: {
                                                    'titleText': serializeParam(
                                                      'เลือกประเภทที่อยู่อาศัย',
                                                      ParamType.String,
                                                    ),
                                                    'searchLabel':
                                                        serializeParam(
                                                      'กรุณาเลือกประเภทที่อยู่อาศัย',
                                                      ParamType.String,
                                                    ),
                                                    'dataList': serializeParam(
                                                      FFAppState().defaultList1,
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: Color(0xFFB3B3B3),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          FFAppState()
                                                              .leadsHouse
                                                              .firstOrNull
                                                              ?.assured,
                                                          'เลือกผู้เอาประกันภัย',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          getCORSProxyUrl(
                                                            () {
                                                              if (FFAppState()
                                                                      .insuranceInfoCarTypeDetail ==
                                                                  'รถเก๋ง') {
                                                                return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%A3%E0%B8%96%E0%B9%80%E0%B8%81%E0%B9%8B%E0%B8%87.png?alt=media&token=68ef0a76-99d9-4c43-ae86-b48970b7fb09';
                                                              } else if (FFAppState()
                                                                      .insuranceInfoCarTypeDetail ==
                                                                  'รถตู้') {
                                                                return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%A3%E0%B8%96%E0%B8%95%E0%B8%B9%E0%B9%89.png?alt=media&token=8969fa4a-52e0-4b0c-9c44-f349976bc624';
                                                              } else if (FFAppState()
                                                                      .insuranceInfoCarTypeDetail ==
                                                                  'รถกระบะ 2 ประตู') {
                                                                return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%81%E0%B8%B0%E0%B8%9A%E0%B8%B0%20%E0%B8%95%E0%B8%AD%E0%B8%99%E0%B9%80%E0%B8%94%E0%B8%B5%E0%B8%A2%E0%B8%A7%20(%E0%B8%A3%E0%B8%A7%E0%B8%A1).png?alt=media&token=bd62e47d-dd92-41ca-8f51-3632edfd54a6';
                                                              } else if (FFAppState()
                                                                      .insuranceInfoCarTypeDetail ==
                                                                  'รถกระบะ 4 ประตู') {
                                                                return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%81%E0%B8%B0%E0%B8%9A%E0%B8%B0%204%20%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B8%95%E0%B8%B9.png?alt=media&token=45bc2e60-3a29-47dc-aa4d-e9c82a113bbc';
                                                              } else if (FFAppState()
                                                                      .insuranceInfoCarTypeDetail ==
                                                                  'รถบรรทุก หัวลาก หางพ่วง') {
                                                                return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%AB%E0%B8%B1%E0%B8%A7%E0%B8%A5%E0%B8%B2%E0%B8%81%20%E0%B8%AB%E0%B8%B2%E0%B8%87%E0%B8%9E%E0%B9%88%E0%B8%A7%E0%B8%87.png?alt=media&token=1d749f04-0765-422a-b0b7-34a3d5d60519';
                                                              } else if (FFAppState()
                                                                      .insuranceInfoCarTypeDetail ==
                                                                  'รถแต่ง ต่อคอก') {
                                                                return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%A3%E0%B8%96%E0%B9%81%E0%B8%95%E0%B9%88%E0%B8%87%E0%B8%95%E0%B9%88%E0%B8%AD%E0%B8%84%E0%B8%AD%E0%B8%81.png?alt=media&token=80501c24-fec4-4c34-ac0f-361db3b698b3';
                                                              } else if (FFAppState()
                                                                      .insuranceInfoCarTypeDetail ==
                                                                  'กระบะไม่ต่อเติม') {
                                                                return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%81%E0%B8%B0%E0%B8%9A%E0%B8%B0%202%20%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B8%95%E0%B8%B9%E0%B9%84%E0%B8%A1%E0%B9%88%E0%B8%95%E0%B9%88%E0%B8%AD%E0%B9%80%E0%B8%95%E0%B8%B4%E0%B8%A1.png?alt=media&token=ca1d014f-d1aa-4f27-bd54-3d97d5efba3f';
                                                              } else if (FFAppState()
                                                                      .insuranceInfoCarTypeDetail ==
                                                                  'กระบะต่อเติมเกินหัวเก๋ง') {
                                                                return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%81%E0%B8%A3%E0%B8%B0%E0%B8%9A%E0%B8%B0%E0%B8%95%E0%B9%88%E0%B8%AD%E0%B9%80%E0%B8%95%E0%B8%B4%E0%B8%A1%E0%B9%80%E0%B8%81%E0%B8%B4%E0%B8%99%E0%B8%AB%E0%B8%B1%E0%B8%A7%E0%B9%80%E0%B8%81%E0%B9%8B%E0%B8%87.png?alt=media&token=957c9ae1-6d8a-41d5-b7aa-23965926a562';
                                                              } else if (FFAppState()
                                                                      .insuranceInfoCarTypeDetail ==
                                                                  'กระบะต่อเติมเกินหัวเก๋ง') {
                                                                return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F%E0%B8%81%E0%B8%A3%E0%B8%B0%E0%B8%9A%E0%B8%B0%E0%B8%95%E0%B9%88%E0%B8%AD%E0%B9%80%E0%B8%95%E0%B8%B4%E0%B8%A1%E0%B9%80%E0%B8%81%E0%B8%B4%E0%B8%99%E0%B8%AB%E0%B8%B1%E0%B8%A7%E0%B9%80%E0%B8%81%E0%B9%8B%E0%B8%87.png?alt=media&token=957c9ae1-6d8a-41d5-b7aa-23965926a562';
                                                              } else if (FFAppState()
                                                                      .insuranceInfoCarTypeDetail ==
                                                                  'กระบะตู้ทึบ/ตู้แห้ง') {
                                                                return 'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/carTypeImage%2F2_%E0%B8%81%E0%B8%A3%E0%B8%B0%E0%B8%9A%E0%B8%B0%E0%B8%95%E0%B8%B9%E0%B9%89%E0%B8%97%E0%B8%B6%E0%B8%9A_%E0%B8%95%E0%B8%B9%E0%B9%89%E0%B9%81%E0%B8%AB%E0%B9%89%E0%B8%87.png?alt=media&token=71715c79-6196-4a63-9a9e-c179033218ea';
                                                              } else {
                                                                return '-';
                                                              }
                                                            }(),
                                                          ),
                                                          width: () {
                                                            if (FFAppState()
                                                                    .insuranceInfoCarTypeDetail ==
                                                                'รถเก๋ง') {
                                                              return 90;
                                                            } else if (FFAppState()
                                                                    .insuranceInfoCarTypeDetail ==
                                                                'รถตู้') {
                                                              return 90;
                                                            } else if (FFAppState()
                                                                    .insuranceInfoCarTypeDetail ==
                                                                'รถกระบะ 2 ประตู') {
                                                              return 90;
                                                            } else if (FFAppState()
                                                                    .insuranceInfoCarTypeDetail ==
                                                                'รถกระบะ 4 ประตู') {
                                                              return 90;
                                                            } else if (FFAppState()
                                                                    .insuranceInfoCarTypeDetail ==
                                                                'รถบรรทุก หัวลาก หางพ่วง') {
                                                              return 130;
                                                            } else if (FFAppState()
                                                                    .insuranceInfoCarTypeDetail ==
                                                                'รถแต่ง ต่อคอก') {
                                                              return 90;
                                                            } else if (FFAppState()
                                                                    .insuranceInfoCarTypeDetail ==
                                                                'กระบะไม่ต่อเติม') {
                                                              return 100;
                                                            } else if (FFAppState()
                                                                    .insuranceInfoCarTypeDetail ==
                                                                'กระบะต่อเติมเกินหัวเก๋ง') {
                                                              return 130;
                                                            } else if (FFAppState()
                                                                    .insuranceInfoCarTypeDetail ==
                                                                'กระบะต่อเติมไม่เกินหัวเก๋ง') {
                                                              return 130;
                                                            } else if (FFAppState()
                                                                    .insuranceInfoCarTypeDetail ==
                                                                'กระบะตู้ทึบ/ตู้แห้ง') {
                                                              return 100;
                                                            } else {
                                                              return 0;
                                                            }
                                                          }()
                                                              .toDouble(),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'สิ่งปลูกสร้าง (ไม่รวมรากฐาน)',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    '(กรุณากรอกหน่วย : บาท)',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFFFB0606),
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'SearchableListPage',
                                                  queryParameters: {
                                                    'titleText': serializeParam(
                                                      'เลือกปีที่ผลิต',
                                                      ParamType.String,
                                                    ),
                                                    'searchLabel':
                                                        serializeParam(
                                                      'เลือกปี',
                                                      ParamType.String,
                                                    ),
                                                    'dataList': serializeParam(
                                                      functions.reverseList(
                                                          functions
                                                              .ganerateYearList(
                                                                  1957, 2023)
                                                              ?.toList()),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'multiSelect':
                                                        serializeParam(
                                                      false,
                                                      ParamType.bool,
                                                    ),
                                                    'fromPage': serializeParam(
                                                      'insuranceInfoPage2',
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                await actions
                                                    .hideKeyboardAction(
                                                  context,
                                                );
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: Color(0xFFB3B3B3),
                                                  ),
                                                ),
                                                child: Container(
                                                  width: 200.0,
                                                  child: TextFormField(
                                                    controller:
                                                        _model.textController6,
                                                    focusNode: _model
                                                        .textFieldFocusNode4,
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    validator: _model
                                                        .textController6Validator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'ทรัพ์ภายในสิ่งปลูกสร้าง',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    '(กรุณากรอกหน่วย : บาท)',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFFFB0606),
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'SearchableListPage',
                                                  queryParameters: {
                                                    'titleText': serializeParam(
                                                      'เลือกปีที่ผลิต',
                                                      ParamType.String,
                                                    ),
                                                    'searchLabel':
                                                        serializeParam(
                                                      'เลือกปี',
                                                      ParamType.String,
                                                    ),
                                                    'dataList': serializeParam(
                                                      functions.reverseList(
                                                          functions
                                                              .ganerateYearList(
                                                                  1957, 2023)
                                                              ?.toList()),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'multiSelect':
                                                        serializeParam(
                                                      false,
                                                      ParamType.bool,
                                                    ),
                                                    'fromPage': serializeParam(
                                                      'insuranceInfoPage2',
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                await actions
                                                    .hideKeyboardAction(
                                                  context,
                                                );
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: Color(0xFFB3B3B3),
                                                  ),
                                                ),
                                                child: Container(
                                                  width: 200.0,
                                                  child: TextFormField(
                                                    controller:
                                                        _model.textController7,
                                                    focusNode: _model
                                                        .textFieldFocusNode5,
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    validator: _model
                                                        .textController7Validator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'รวมจำนวนเงินเอาประกันภัยทั้งสิ้น',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    '(กรุณากรอกหน่วย : บาท)',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFFFB0606),
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'SearchableListPage',
                                                  queryParameters: {
                                                    'titleText': serializeParam(
                                                      'เลือกปีที่ผลิต',
                                                      ParamType.String,
                                                    ),
                                                    'searchLabel':
                                                        serializeParam(
                                                      'เลือกปี',
                                                      ParamType.String,
                                                    ),
                                                    'dataList': serializeParam(
                                                      functions.reverseList(
                                                          functions
                                                              .ganerateYearList(
                                                                  1957, 2023)
                                                              ?.toList()),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'multiSelect':
                                                        serializeParam(
                                                      false,
                                                      ParamType.bool,
                                                    ),
                                                    'fromPage': serializeParam(
                                                      'insuranceInfoPage2',
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                await actions
                                                    .hideKeyboardAction(
                                                  context,
                                                );
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: Color(0xFFB3B3B3),
                                                  ),
                                                ),
                                                child: Container(
                                                  width: 200.0,
                                                  child: TextFormField(
                                                    controller:
                                                        _model.textController8,
                                                    focusNode: _model
                                                        .textFieldFocusNode6,
                                                    autofocus: false,
                                                    readOnly: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    validator: _model
                                                        .textController8Validator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'ผู้รับผลประโยชน์ (สถาบันการเงิน/บุคคลอื่น)',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    '(กรุณากรอก)',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFFFB0606),
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'SearchableListPage',
                                                  queryParameters: {
                                                    'titleText': serializeParam(
                                                      'เลือกปีที่ผลิต',
                                                      ParamType.String,
                                                    ),
                                                    'searchLabel':
                                                        serializeParam(
                                                      'เลือกปี',
                                                      ParamType.String,
                                                    ),
                                                    'dataList': serializeParam(
                                                      functions.reverseList(
                                                          functions
                                                              .ganerateYearList(
                                                                  1957, 2023)
                                                              ?.toList()),
                                                      ParamType.String,
                                                      isList: true,
                                                    ),
                                                    'multiSelect':
                                                        serializeParam(
                                                      false,
                                                      ParamType.bool,
                                                    ),
                                                    'fromPage': serializeParam(
                                                      'insuranceInfoPage2',
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                await actions
                                                    .hideKeyboardAction(
                                                  context,
                                                );
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: Color(0xFFB3B3B3),
                                                  ),
                                                ),
                                                child: Container(
                                                  width: 200.0,
                                                  child: TextFormField(
                                                    controller:
                                                        _model.textController9,
                                                    focusNode: _model
                                                        .textFieldFocusNode7,
                                                    autofocus: false,
                                                    readOnly: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto Sans Thai',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    validator: _model
                                                        .textController9Validator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                              'Homepage_Request_2_3');

                                          await actions.hideKeyboardAction(
                                            context,
                                          );
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color: Color(0xFFB3B3B3),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Icon(
                                                        Icons
                                                            .person_add_alt_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 30.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.6,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'ระบุชื่อสมาชิกในครอบครัวขยายความคุ้ม',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            color: Color(
                                                                0xFF003063),
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                    Text(
                                                      'ครองประกันภัยอุบัติเหตุส่วนบุคคล',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            color: Color(
                                                                0xFF003063),
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        '(กรุณาระบุอย่างน้อย 1 คน)',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Noto Sans Thai',
                                                              color: Color(
                                                                  0xFFFB0606),
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 10.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Icon(
                                                          Icons.navigate_next,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 36.0,
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
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'ระยะเวลาเอาประกันภัย(วันที่เริ่มคุ้มครอง)',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans Thai',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    '(บังคับเลือก)',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFFFB0606),
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (kIsWeb) {
                                                  final _datePickedDate =
                                                      await showDatePicker(
                                                    context: context,
                                                    initialDate: ((FFAppState()
                                                                    .nonePackageWorkType ==
                                                                'งานต่ออายุ') ||
                                                            (FFAppState()
                                                                    .nonePackageWorkType ==
                                                                'งานโอนโค้ด')
                                                        ? getCurrentTimestamp
                                                        : getCurrentTimestamp),
                                                    firstDate: ((FFAppState()
                                                                    .nonePackageWorkType ==
                                                                'งานต่ออายุ') ||
                                                            (FFAppState()
                                                                    .nonePackageWorkType ==
                                                                'งานโอนโค้ด')
                                                        ? getCurrentTimestamp
                                                        : getCurrentTimestamp),
                                                    lastDate: DateTime(2050),
                                                  );

                                                  if (_datePickedDate != null) {
                                                    safeSetState(() {
                                                      _model.datePicked =
                                                          DateTime(
                                                        _datePickedDate.year,
                                                        _datePickedDate.month,
                                                        _datePickedDate.day,
                                                      );
                                                    });
                                                  }
                                                } else {
                                                  await DatePicker
                                                      .showDatePicker(
                                                    context,
                                                    showTitleActions: true,
                                                    onConfirm: (date) {
                                                      safeSetState(() {
                                                        _model.datePicked =
                                                            date;
                                                      });
                                                    },
                                                    currentTime: (FFAppState()
                                                                    .nonePackageWorkType ==
                                                                'งานต่ออายุ') ||
                                                            (FFAppState()
                                                                    .nonePackageWorkType ==
                                                                'งานโอนโค้ด')
                                                        ? getCurrentTimestamp
                                                        : getCurrentTimestamp,
                                                    minTime: (FFAppState()
                                                                    .nonePackageWorkType ==
                                                                'งานต่ออายุ') ||
                                                            (FFAppState()
                                                                    .nonePackageWorkType ==
                                                                'งานโอนโค้ด')
                                                        ? getCurrentTimestamp
                                                        : getCurrentTimestamp,
                                                    locale: LocaleType.values
                                                        .firstWhere(
                                                      (l) =>
                                                          l.name ==
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                      orElse: () =>
                                                          LocaleType.en,
                                                    ),
                                                  );
                                                }

                                                if (!(_model.datePicked !=
                                                    null)) {
                                                  await actions
                                                      .hideKeyboardAction(
                                                    context,
                                                  );
                                                  return;
                                                }
                                                if (functions
                                                    .checkDateBeforeAnotherDate(
                                                        columnEffectiveDayConfigRecord
                                                            ?.effectiveDaysInsure,
                                                        _model.datePicked)!) {
                                                  FFAppState()
                                                      .updateLeadsDetailHouseAtIndex(
                                                    0,
                                                    (e) => e
                                                      ..effectiveDate = functions
                                                          .getDateFormat(_model
                                                              .datePicked),
                                                  );
                                                  safeSetState(() {});
                                                } else {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'ไม่สามารถเลือกวันเกิน  ${columnEffectiveDayConfigRecord?.effectiveDaysInsure?.toString()}  วันได้กรุณาเลือกใหม่'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
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

                                                await actions
                                                    .hideKeyboardAction(
                                                  context,
                                                );
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: Color(0xFFB3B3B3),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        FFAppState()
                                                                    .leadsDetailHouse
                                                                    .firstOrNull
                                                                    ?.effectiveDate ==
                                                                ''
                                                            ? 'กรุณาเลือกวันที่ต้องการเริ่มคุ้มครองประกัน'
                                                            : valueOrDefault<
                                                                String>(
                                                                functions.showDateBE(FFAppState()
                                                                    .leadsDetailHouse
                                                                    .firstOrNull
                                                                    ?.effectiveDate),
                                                                '0',
                                                              ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Noto Sans Thai',
                                                              color: FFAppState()
                                                                          .insuranceInfoEffectiveDateAct ==
                                                                      ''
                                                                  ? Color(
                                                                      0xFF9F9F9F)
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 15.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Icon(
                                                        Icons
                                                            .edit_calendar_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 15.0, 0.0, 15.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 70.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            FFButtonWidget(
                                              onPressed: () async {
                                                var _shouldSetState = false;
                                                if (valueOrDefault<String>(
                                                      FFAppState()
                                                          .leadsHouse
                                                          .firstOrNull
                                                          ?.wall,
                                                      'เลือกฝาผนัง',
                                                    ) ==
                                                    '') {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'กรุณาเลือกฝาผนัง'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                if (valueOrDefault<String>(
                                                      FFAppState()
                                                          .leadsHouse
                                                          .firstOrNull
                                                          ?.floorUpper,
                                                      'เลือกฝาผนัง',
                                                    ) ==
                                                    '') {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'กรุณาเลือกพื้นชั้นบน'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                if (valueOrDefault<String>(
                                                      FFAppState()
                                                          .leadsHouse
                                                          .firstOrNull
                                                          ?.floorGround,
                                                      'เลือกฝาผนัง',
                                                    ) ==
                                                    '') {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'กรุณาเลือกพื้นชั้นล่าง'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                if (valueOrDefault<String>(
                                                      FFAppState()
                                                          .leadsHouse
                                                          .firstOrNull
                                                          ?.roofFrame,
                                                      'เลือกฝาผนัง',
                                                    ) ==
                                                    '') {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'กรุณาเลือกโครงสร้างหลังคา'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                if (valueOrDefault<String>(
                                                      FFAppState()
                                                          .leadsHouse
                                                          .firstOrNull
                                                          ?.roof,
                                                      'เลือกฝาผนัง',
                                                    ) ==
                                                    '') {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'กรุณาเลือกหลังคา'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                if ((int.parse(FFAppState()
                                                                .leadsHouse
                                                                .firstOrNull!
                                                                .floor) *
                                                            double.parse(
                                                                FFAppState()
                                                                    .leadsHouse
                                                                    .firstOrNull!
                                                                    .width) *
                                                            double.parse(
                                                                FFAppState()
                                                                    .leadsHouse
                                                                    .firstOrNull!
                                                                    .length))
                                                        .toString() !=
                                                    (double.parse(FFAppState()
                                                            .leadsHouse
                                                            .firstOrNull!
                                                            .usableArea))
                                                        .toString()) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'ขนาดพื้นที่ใช้สอยไม่ถูกต้อง'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return WebViewAware(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              LoadingSceneWidget(),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));

                                                _model.ibsAppAPIOutput =
                                                    await IbsApplicationsSaveCall
                                                        .call(
                                                  action: 'save_draft',
                                                  quotationId: FFAppState()
                                                      .insuranceInfoQuotationId,
                                                  leadDtlId: FFAppState()
                                                      .insuranceInfoLeadDetailId,
                                                  insuranceUrl: FFAppState()
                                                      .apiUrlInsuranceAppState,
                                                  step: '2',
                                                  branchCode: functions
                                                          .checkIsStringLengthInLength(
                                                              FFAppState()
                                                                  .branchCode,
                                                              2)!
                                                      ? FFAppState()
                                                          .profileBranch
                                                      : FFAppState()
                                                          .insuranceInfoBranchCode,
                                                  branchName: functions
                                                          .checkIsStringLengthInLength(
                                                              FFAppState()
                                                                  .branchCode,
                                                              2)!
                                                      ? FFAppState()
                                                          .profileUnitCodeName
                                                      : FFAppState()
                                                          .insuranceInfoBranchNameOutput,
                                                  token:
                                                      FFAppState().accessToken,
                                                  effectiveDateInsure:
                                                      FFAppState()
                                                          .leadsDetailHouse
                                                          .firstOrNull
                                                          ?.effectiveDate,
                                                  subProduct: FFAppState()
                                                      .insuranceinfoActType,
                                                );

                                                _shouldSetState = true;
                                                if ((_model.ibsAppAPIOutput
                                                            ?.statusCode ??
                                                        200) !=
                                                    200) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text((_model
                                                                      .ibsAppAPIOutput
                                                                      ?.statusCode ??
                                                                  200)
                                                              .toString()),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                  Navigator.pop(context);
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                if (IbsApplicationsSaveCall
                                                        .statuslayer1(
                                                      (_model.ibsAppAPIOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    ) !=
                                                    200) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              IbsApplicationsSaveCall
                                                                  .messageLayer1(
                                                            (_model.ibsAppAPIOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                  Navigator.pop(context);
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                _model.detailAPIOutput =
                                                    await IbsApplicationsDetailCall
                                                        .call(
                                                  quotationId: FFAppState()
                                                      .insuranceInfoQuotationId,
                                                  insuranceUrl: FFAppState()
                                                      .apiUrlInsuranceAppState,
                                                  token:
                                                      FFAppState().accessToken,
                                                );

                                                _shouldSetState = true;
                                                if ((_model.detailAPIOutput
                                                            ?.statusCode ??
                                                        200) !=
                                                    200) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'พบข้อผิดพลาด (${(_model.detailAPIOutput?.statusCode ?? 200).toString()})'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                  Navigator.pop(context);
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                if (IbsApplicationsDetailCall
                                                        .statuslayer1(
                                                      (_model.detailAPIOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    ) !=
                                                    200) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              IbsApplicationsDetailCall
                                                                  .messageLayer1(
                                                            (_model.detailAPIOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                  Navigator.pop(context);
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'บันทึกเตรียมข้อมูลขั้นตอนที่ 2 สำเร็จ'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                                FFAppState()
                                                        .insuranceInfoPage2SaveDataCheckBool =
                                                    true;
                                                FFAppState()
                                                        .insuranceInfoActFlag =
                                                    '${IbsApplicationsDetailCall.actflg(
                                                  (_model.detailAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )}';
                                                FFAppState()
                                                        .insuranceInfoGrosstotalNet =
                                                    '${IbsApplicationsDetailCall.grosstotalnet(
                                                  (_model.detailAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )}';
                                                FFAppState()
                                                        .insuranceInfoPage4NetPremiumTotal =
                                                    '${IbsApplicationsDetailCall.netpremiumtotalAppdetail(
                                                  (_model.detailAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )}';
                                                FFAppState()
                                                        .insuranceInfoActAmount =
                                                    '${IbsApplicationsDetailCall.acttotal(
                                                  (_model.detailAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )}';
                                                FFAppState()
                                                        .nonePackageWorkType =
                                                    '${IbsApplicationsDetailCall.workType(
                                                  (_model.detailAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )}';
                                                FFAppState().flagRenew =
                                                    '${IbsApplicationsDetailCall.flgrenew(
                                                  (_model.detailAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )}';
                                                safeSetState(() {});
                                                Navigator.pop(context);
                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                              },
                                              text: 'บันทึกเตรียมข้อมูล',
                                              options: FFButtonOptions(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.45,
                                                height: 60.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: Color(0xFFFCEFE4),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color:
                                                              Color(0xFFD9761A),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: Color(0xFFFCEFE4),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                            ),
                                            if (FFAppState()
                                                .insuranceInfoPage2SaveDataCheckBool)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 0.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    context.pushNamed(
                                                        'insuranceInfoPage3');
                                                  },
                                                  text: 'ถัดไป',
                                                  options: FFButtonOptions(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.45,
                                                    height: 60.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: Color(0xFFD9761A),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ].addToEnd(SizedBox(height: 50.0)),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
