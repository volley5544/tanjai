import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/super_app/components/loading_scene/loading_scene_widget.dart';
import 'dart:convert';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'searchable_house_list_model.dart';
export 'searchable_house_list_model.dart';

class SearchableHouseListWidget extends StatefulWidget {
  const SearchableHouseListWidget({
    super.key,
    String? titleText,
    required this.searchLabel,
    required this.dataList,
    bool? multiSelect,
    int? maxSelected,
    String? fromPage,
  })  : this.titleText = titleText ?? 'เลือก...',
        this.multiSelect = multiSelect ?? false,
        this.maxSelected = maxSelected ?? 0,
        this.fromPage = fromPage ?? '-';

  final String titleText;
  final String? searchLabel;
  final List<String>? dataList;
  final bool multiSelect;
  final int maxSelected;
  final String fromPage;

  @override
  State<SearchableHouseListWidget> createState() =>
      _SearchableHouseListWidgetState();
}

class _SearchableHouseListWidgetState extends State<SearchableHouseListWidget> {
  late SearchableHouseListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchableHouseListModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SearchableHouseList'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.titleText == 'เลือกประเภทชั้นประกัน') {
        if (widget!.fromPage != 'NonePackage') {
          FFAppState().searchableListComponentData =
              widget!.dataList!.toList().cast<String>();
          FFAppState().searchableListComponentSelectedList = functions
              .createFalseListByItemNumber(true, widget!.dataList?.length)!
              .toList()
              .cast<bool>();
          safeSetState(() {});
          return;
        }
      }
      FFAppState().searchableListComponentData =
          widget!.dataList!.toList().cast<String>();
      FFAppState().searchableListComponentSelectedList = functions
          .createFalseListByItemNumber(false, widget!.dataList?.length)!
          .toList()
          .cast<bool>();
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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFFAFAFA),
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.safePop();
              },
              child: Icon(
                Icons.arrow_back,
                color: Color(0xFFDB7619),
                size: 30.0,
              ),
            ),
            title: Text(
              'ประเภทที่อยู่อาศัย',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Noto Sans Thai',
                    color: Color(0xFF123063),
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                  ),
            ),
            actions: [],
            centerTitle: true,
          ),
          body: SafeArea(
            top: true,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: ListView(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: [
                                Builder(
                                  builder: (context) => Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 7.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState()
                                            .updateFireInsuranceSearchPackageDataStruct(
                                          (e) => e
                                            ..houseTypeCode = '01'
                                            ..houseTypeName = 'บ้านเดี่ยว',
                                        );
                                        safeSetState(() {});
                                        if (FFAppState()
                                                .fireInsuranceSearchPackageData
                                                .houseAreaType ==
                                            '02') {
                                          if ((('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' != '') && ('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' != 'null')) &&
                                              (('${FFAppState().fireInsuranceSearchPackageData.usableArea}' !=
                                                      '') &&
                                                  ('${FFAppState().fireInsuranceSearchPackageData.usableArea}' !=
                                                      'null')) &&
                                              (('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                                                      '') &&
                                                  ('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                                                      'null'))) {
                                            showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: WebViewAware(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Container(
                                                        height: double.infinity,
                                                        child:
                                                            LoadingSceneWidget(),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );

                                            _model.calEstimatedOutput01Sq =
                                                await HouseInsuranceGroup
                                                    .houseCalEstimatedApiCall
                                                    .call(
                                              houseAreaType: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseAreaType,
                                              houseTypeCode: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseTypeCode,
                                              usableArea: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .usableArea,
                                              token: FFAppState().accessToken,
                                              apiUrl: FFAppState()
                                                  .apiUrlInsuranceAppState,
                                              floor: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseFloor,
                                              width: '0',
                                              long: '0',
                                            );

                                            if ((_model.calEstimatedOutput01Sq
                                                        ?.statusCode ??
                                                    200) ==
                                                200) {
                                              if ('${getJsonField(
                                                    (_model.calEstimatedOutput01Sq
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.code''',
                                                  ).toString()}' ==
                                                  '200') {
                                                FFAppState().calEstimatedData =
                                                    HouseInsuranceGroup
                                                        .houseCalEstimatedApiCall
                                                        .data(
                                                  (_model.calEstimatedOutput01Sq
                                                          ?.jsonBody ??
                                                      ''),
                                                )!;
                                                safeSetState(() {});
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            '${HouseInsuranceGroup.houseCalEstimatedApiCall.messageLayer1(
                                                          (_model.calEstimatedOutput01Sq
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )}'),
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
                                              }
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      content: Text(
                                                          'พบข้อผิดพลาดConnection (${(_model.calEstimatedOutput01Sq?.statusCode ?? 200).toString()})'),
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
                                            }

                                            Navigator.pop(context);
                                          }
                                        } else {
                                          if ((('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' != '') && ('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' != 'null')) &&
                                              (('${FFAppState().fireInsuranceSearchPackageData.houseWidth}' !=
                                                      '') &&
                                                  ('${FFAppState().fireInsuranceSearchPackageData.houseWidth}' !=
                                                      'null')) &&
                                              (('${FFAppState().fireInsuranceSearchPackageData.houseLong}' !=
                                                      '') &&
                                                  ('${FFAppState().fireInsuranceSearchPackageData.houseLong}' !=
                                                      'null')) &&
                                              (('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                                                      '') &&
                                                  ('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                                                      'null'))) {
                                            showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: WebViewAware(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Container(
                                                        height: double.infinity,
                                                        child:
                                                            LoadingSceneWidget(),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );

                                            _model.calEstimatedOutput01NonSq =
                                                await HouseInsuranceGroup
                                                    .houseCalEstimatedApiCall
                                                    .call(
                                              houseAreaType: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseAreaType,
                                              houseTypeCode: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseTypeCode,
                                              usableArea: (int.parse(FFAppState()
                                                          .fireInsuranceSearchPackageData
                                                          .houseWidth) *
                                                      int.parse(FFAppState()
                                                          .fireInsuranceSearchPackageData
                                                          .houseLong))
                                                  .toString(),
                                              token: FFAppState().accessToken,
                                              apiUrl: FFAppState()
                                                  .apiUrlInsuranceAppState,
                                              floor: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseFloor,
                                              width: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseWidth,
                                              long: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseLong,
                                            );

                                            if ((_model.calEstimatedOutput01NonSq
                                                        ?.statusCode ??
                                                    200) ==
                                                200) {
                                              if ('${getJsonField(
                                                    (_model.calEstimatedOutput01NonSq
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.code''',
                                                  ).toString()}' ==
                                                  '200') {
                                                FFAppState().calEstimatedData =
                                                    HouseInsuranceGroup
                                                        .houseCalEstimatedApiCall
                                                        .data(
                                                  (_model.calEstimatedOutput01NonSq
                                                          ?.jsonBody ??
                                                      ''),
                                                )!;
                                                safeSetState(() {});
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            '${HouseInsuranceGroup.houseCalEstimatedApiCall.messageLayer1(
                                                          (_model.calEstimatedOutput01NonSq
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )}'),
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
                                              }
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      content: Text(
                                                          'พบข้อผิดพลาดConnection (${(_model.calEstimatedOutput01NonSq?.statusCode ?? 200).toString()})'),
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
                                            }

                                            Navigator.pop(context);
                                          }
                                        }

                                        context.safePop();

                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 65.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            width: 0.5,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              height: 60.0,
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'บ้านเดี่ยว',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                20.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/lpwoa_.png',
                                                        width: 90.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              thickness: 1.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent4,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Builder(
                                  builder: (context) => Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 7.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState()
                                            .updateFireInsuranceSearchPackageDataStruct(
                                          (e) => e
                                            ..houseTypeCode = '02'
                                            ..houseTypeName = 'บ้านแฝด',
                                        );
                                        safeSetState(() {});
                                        if (FFAppState()
                                                .fireInsuranceSearchPackageData
                                                .houseAreaType ==
                                            '02') {
                                          if ((('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' != '') && ('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' != 'null')) &&
                                              (('${FFAppState().fireInsuranceSearchPackageData.usableArea}' !=
                                                      '') &&
                                                  ('${FFAppState().fireInsuranceSearchPackageData.usableArea}' !=
                                                      'null')) &&
                                              (('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                                                      '') &&
                                                  ('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                                                      'null'))) {
                                            showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: WebViewAware(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Container(
                                                        height: double.infinity,
                                                        child:
                                                            LoadingSceneWidget(),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );

                                            _model.calEstimatedOutput02Sq =
                                                await HouseInsuranceGroup
                                                    .houseCalEstimatedApiCall
                                                    .call(
                                              houseAreaType: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseAreaType,
                                              houseTypeCode: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseTypeCode,
                                              usableArea: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .usableArea,
                                              token: FFAppState().accessToken,
                                              apiUrl: FFAppState()
                                                  .apiUrlInsuranceAppState,
                                              floor: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseFloor,
                                              width: '0',
                                              long: '0',
                                            );

                                            if ((_model.calEstimatedOutput02Sq
                                                        ?.statusCode ??
                                                    200) ==
                                                200) {
                                              if ('${getJsonField(
                                                    (_model.calEstimatedOutput02Sq
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.code''',
                                                  ).toString()}' ==
                                                  '200') {
                                                FFAppState().calEstimatedData =
                                                    HouseInsuranceGroup
                                                        .houseCalEstimatedApiCall
                                                        .data(
                                                  (_model.calEstimatedOutput02Sq
                                                          ?.jsonBody ??
                                                      ''),
                                                )!;
                                                safeSetState(() {});
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            '${HouseInsuranceGroup.houseCalEstimatedApiCall.messageLayer1(
                                                          (_model.calEstimatedOutput02Sq
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )}'),
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
                                              }
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      content: Text(
                                                          'พบข้อผิดพลาดConnection (${(_model.calEstimatedOutput02Sq?.statusCode ?? 200).toString()})'),
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
                                            }

                                            Navigator.pop(context);
                                          }
                                        } else {
                                          if ((('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' != '') && ('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' != 'null')) &&
                                              (('${FFAppState().fireInsuranceSearchPackageData.houseWidth}' !=
                                                      '') &&
                                                  ('${FFAppState().fireInsuranceSearchPackageData.houseWidth}' !=
                                                      'null')) &&
                                              (('${FFAppState().fireInsuranceSearchPackageData.houseLong}' !=
                                                      '') &&
                                                  ('${FFAppState().fireInsuranceSearchPackageData.houseLong}' !=
                                                      'null')) &&
                                              (('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                                                      '') &&
                                                  ('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                                                      'null'))) {
                                            showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: WebViewAware(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Container(
                                                        height: double.infinity,
                                                        child:
                                                            LoadingSceneWidget(),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );

                                            _model.calEstimatedOutput02NonSq =
                                                await HouseInsuranceGroup
                                                    .houseCalEstimatedApiCall
                                                    .call(
                                              houseAreaType: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseAreaType,
                                              houseTypeCode: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseTypeCode,
                                              usableArea: (int.parse(FFAppState()
                                                          .fireInsuranceSearchPackageData
                                                          .houseWidth) *
                                                      int.parse(FFAppState()
                                                          .fireInsuranceSearchPackageData
                                                          .houseLong))
                                                  .toString(),
                                              token: FFAppState().accessToken,
                                              apiUrl: FFAppState()
                                                  .apiUrlInsuranceAppState,
                                              floor: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseFloor,
                                              width: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseWidth,
                                              long: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseLong,
                                            );

                                            if ((_model.calEstimatedOutput02NonSq
                                                        ?.statusCode ??
                                                    200) ==
                                                200) {
                                              if ('${getJsonField(
                                                    (_model.calEstimatedOutput02NonSq
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.code''',
                                                  ).toString()}' ==
                                                  '200') {
                                                FFAppState().calEstimatedData =
                                                    HouseInsuranceGroup
                                                        .houseCalEstimatedApiCall
                                                        .data(
                                                  (_model.calEstimatedOutput02NonSq
                                                          ?.jsonBody ??
                                                      ''),
                                                )!;
                                                safeSetState(() {});
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            '${HouseInsuranceGroup.houseCalEstimatedApiCall.messageLayer1(
                                                          (_model.calEstimatedOutput02NonSq
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )}'),
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
                                              }
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      content: Text(
                                                          'พบข้อผิดพลาดConnection (${(_model.calEstimatedOutput02NonSq?.statusCode ?? 200).toString()})'),
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
                                            }

                                            Navigator.pop(context);
                                          }
                                        }

                                        context.safePop();

                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 65.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            width: 0.5,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              height: 60.0,
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'บ้านแฝด',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                20.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/sresl_.png',
                                                        width: 90.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              thickness: 1.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent4,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Builder(
                                  builder: (context) => Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 7.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState()
                                            .updateFireInsuranceSearchPackageDataStruct(
                                          (e) => e
                                            ..houseTypeCode = '03'
                                            ..houseTypeName = 'ทาวน์เฮาส์',
                                        );
                                        safeSetState(() {});
                                        if (FFAppState()
                                                .fireInsuranceSearchPackageData
                                                .houseAreaType ==
                                            '02') {
                                          if ((('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' != '') && ('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' != 'null')) &&
                                              (('${FFAppState().fireInsuranceSearchPackageData.usableArea}' !=
                                                      '') &&
                                                  ('${FFAppState().fireInsuranceSearchPackageData.usableArea}' !=
                                                      'null')) &&
                                              (('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                                                      '') &&
                                                  ('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                                                      'null'))) {
                                            showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: WebViewAware(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Container(
                                                        height: double.infinity,
                                                        child:
                                                            LoadingSceneWidget(),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );

                                            _model.calEstimatedOutput03Sq =
                                                await HouseInsuranceGroup
                                                    .houseCalEstimatedApiCall
                                                    .call(
                                              houseAreaType: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseAreaType,
                                              houseTypeCode: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseTypeCode,
                                              usableArea: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .usableArea,
                                              token: FFAppState().accessToken,
                                              apiUrl: FFAppState()
                                                  .apiUrlInsuranceAppState,
                                              floor: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseFloor,
                                              width: '0',
                                              long: '0',
                                            );

                                            if ((_model.calEstimatedOutput03Sq
                                                        ?.statusCode ??
                                                    200) ==
                                                200) {
                                              if ('${getJsonField(
                                                    (_model.calEstimatedOutput03Sq
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.code''',
                                                  ).toString()}' ==
                                                  '200') {
                                                FFAppState().calEstimatedData =
                                                    HouseInsuranceGroup
                                                        .houseCalEstimatedApiCall
                                                        .data(
                                                  (_model.calEstimatedOutput03Sq
                                                          ?.jsonBody ??
                                                      ''),
                                                )!;
                                                safeSetState(() {});
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            '${HouseInsuranceGroup.houseCalEstimatedApiCall.messageLayer1(
                                                          (_model.calEstimatedOutput03Sq
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )}'),
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
                                              }
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      content: Text(
                                                          'พบข้อผิดพลาดConnection (${(_model.calEstimatedOutput03Sq?.statusCode ?? 200).toString()})'),
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
                                            }

                                            Navigator.pop(context);
                                          }
                                        } else {
                                          if ((('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' != '') && ('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' != 'null')) &&
                                              (('${FFAppState().fireInsuranceSearchPackageData.houseWidth}' !=
                                                      '') &&
                                                  ('${FFAppState().fireInsuranceSearchPackageData.houseWidth}' !=
                                                      'null')) &&
                                              (('${FFAppState().fireInsuranceSearchPackageData.houseLong}' !=
                                                      '') &&
                                                  ('${FFAppState().fireInsuranceSearchPackageData.houseLong}' !=
                                                      'null')) &&
                                              (('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                                                      '') &&
                                                  ('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                                                      'null'))) {
                                            showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: WebViewAware(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Container(
                                                        height: double.infinity,
                                                        child:
                                                            LoadingSceneWidget(),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );

                                            _model.calEstimatedOutput03NonSq =
                                                await HouseInsuranceGroup
                                                    .houseCalEstimatedApiCall
                                                    .call(
                                              houseAreaType: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseAreaType,
                                              houseTypeCode: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseTypeCode,
                                              usableArea: (int.parse(FFAppState()
                                                          .fireInsuranceSearchPackageData
                                                          .houseWidth) *
                                                      int.parse(FFAppState()
                                                          .fireInsuranceSearchPackageData
                                                          .houseLong))
                                                  .toString(),
                                              token: FFAppState().accessToken,
                                              apiUrl: FFAppState()
                                                  .apiUrlInsuranceAppState,
                                              floor: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseFloor,
                                              width: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseWidth,
                                              long: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseLong,
                                            );

                                            if ((_model.calEstimatedOutput03NonSq
                                                        ?.statusCode ??
                                                    200) ==
                                                200) {
                                              if ('${getJsonField(
                                                    (_model.calEstimatedOutput03NonSq
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.code''',
                                                  ).toString()}' ==
                                                  '200') {
                                                FFAppState().calEstimatedData =
                                                    HouseInsuranceGroup
                                                        .houseCalEstimatedApiCall
                                                        .data(
                                                  (_model.calEstimatedOutput03NonSq
                                                          ?.jsonBody ??
                                                      ''),
                                                )!;
                                                safeSetState(() {});
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            '${HouseInsuranceGroup.houseCalEstimatedApiCall.messageLayer1(
                                                          (_model.calEstimatedOutput03NonSq
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )}'),
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
                                              }
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      content: Text(
                                                          'พบข้อผิดพลาดConnection (${(_model.calEstimatedOutput03NonSq?.statusCode ?? 200).toString()})'),
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
                                            }

                                            Navigator.pop(context);
                                          }
                                        }

                                        context.safePop();

                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 65.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            width: 0.5,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              height: 60.0,
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'ทาวน์เฮาส์',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                20.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/ccd2n_.png',
                                                        width: 90.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              thickness: 1.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent4,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Builder(
                                  builder: (context) => Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 7.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState()
                                            .updateFireInsuranceSearchPackageDataStruct(
                                          (e) => e
                                            ..houseTypeCode = '04'
                                            ..houseTypeName = 'ทาวน์โฮม',
                                        );
                                        safeSetState(() {});
                                        if (FFAppState()
                                                .fireInsuranceSearchPackageData
                                                .houseAreaType ==
                                            '02') {
                                          if ((('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' != '') && ('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' != 'null')) &&
                                              (('${FFAppState().fireInsuranceSearchPackageData.usableArea}' !=
                                                      '') &&
                                                  ('${FFAppState().fireInsuranceSearchPackageData.usableArea}' !=
                                                      'null')) &&
                                              (('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                                                      '') &&
                                                  ('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                                                      'null'))) {
                                            showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: WebViewAware(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Container(
                                                        height: double.infinity,
                                                        child:
                                                            LoadingSceneWidget(),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );

                                            _model.calEstimatedOutput04Sq =
                                                await HouseInsuranceGroup
                                                    .houseCalEstimatedApiCall
                                                    .call(
                                              houseAreaType: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseAreaType,
                                              houseTypeCode: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseTypeCode,
                                              usableArea: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .usableArea,
                                              token: FFAppState().accessToken,
                                              apiUrl: FFAppState()
                                                  .apiUrlInsuranceAppState,
                                              floor: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseFloor,
                                              width: '0',
                                              long: '0',
                                            );

                                            if ((_model.calEstimatedOutput04Sq
                                                        ?.statusCode ??
                                                    200) ==
                                                200) {
                                              if ('${getJsonField(
                                                    (_model.calEstimatedOutput04Sq
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.code''',
                                                  ).toString()}' ==
                                                  '200') {
                                                FFAppState().calEstimatedData =
                                                    HouseInsuranceGroup
                                                        .houseCalEstimatedApiCall
                                                        .data(
                                                  (_model.calEstimatedOutput04Sq
                                                          ?.jsonBody ??
                                                      ''),
                                                )!;
                                                safeSetState(() {});
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            '${HouseInsuranceGroup.houseCalEstimatedApiCall.messageLayer1(
                                                          (_model.calEstimatedOutput04Sq
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )}'),
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
                                              }
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      content: Text(
                                                          'พบข้อผิดพลาดConnection (${(_model.calEstimatedOutput04Sq?.statusCode ?? 200).toString()})'),
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
                                            }

                                            Navigator.pop(context);
                                          }
                                        } else {
                                          if ((('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' != '') && ('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' != 'null')) &&
                                              (('${FFAppState().fireInsuranceSearchPackageData.houseWidth}' !=
                                                      '') &&
                                                  ('${FFAppState().fireInsuranceSearchPackageData.houseWidth}' !=
                                                      'null')) &&
                                              (('${FFAppState().fireInsuranceSearchPackageData.houseLong}' !=
                                                      '') &&
                                                  ('${FFAppState().fireInsuranceSearchPackageData.houseLong}' !=
                                                      'null')) &&
                                              (('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                                                      '') &&
                                                  ('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                                                      'null'))) {
                                            showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: WebViewAware(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Container(
                                                        height: double.infinity,
                                                        child:
                                                            LoadingSceneWidget(),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );

                                            _model.calEstimatedOutput04NonSq =
                                                await HouseInsuranceGroup
                                                    .houseCalEstimatedApiCall
                                                    .call(
                                              houseAreaType: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseAreaType,
                                              houseTypeCode: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseTypeCode,
                                              usableArea: (int.parse(FFAppState()
                                                          .fireInsuranceSearchPackageData
                                                          .houseWidth) *
                                                      int.parse(FFAppState()
                                                          .fireInsuranceSearchPackageData
                                                          .houseLong))
                                                  .toString(),
                                              token: FFAppState().accessToken,
                                              apiUrl: FFAppState()
                                                  .apiUrlInsuranceAppState,
                                              floor: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseFloor,
                                              width: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseWidth,
                                              long: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseLong,
                                            );

                                            if ((_model.calEstimatedOutput04NonSq
                                                        ?.statusCode ??
                                                    200) ==
                                                200) {
                                              if ('${getJsonField(
                                                    (_model.calEstimatedOutput04NonSq
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.code''',
                                                  ).toString()}' ==
                                                  '200') {
                                                FFAppState().calEstimatedData =
                                                    HouseInsuranceGroup
                                                        .houseCalEstimatedApiCall
                                                        .data(
                                                  (_model.calEstimatedOutput04NonSq
                                                          ?.jsonBody ??
                                                      ''),
                                                )!;
                                                safeSetState(() {});
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            '${HouseInsuranceGroup.houseCalEstimatedApiCall.messageLayer1(
                                                          (_model.calEstimatedOutput04NonSq
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )}'),
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
                                              }
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      content: Text(
                                                          'พบข้อผิดพลาดConnection (${(_model.calEstimatedOutput04NonSq?.statusCode ?? 200).toString()})'),
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
                                            }

                                            Navigator.pop(context);
                                          }
                                        }

                                        context.safePop();

                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 65.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            width: 0.5,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              height: 60.0,
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'ทาวน์โฮม',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                20.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/xa846_.png',
                                                        width: 90.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              thickness: 1.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent4,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Builder(
                                  builder: (context) => Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 7.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState()
                                            .updateFireInsuranceSearchPackageDataStruct(
                                          (e) => e
                                            ..houseTypeCode = '05'
                                            ..houseTypeName = 'อาคารพานิชย์',
                                        );
                                        safeSetState(() {});
                                        if (FFAppState()
                                                .fireInsuranceSearchPackageData
                                                .houseAreaType ==
                                            '02') {
                                          if ((('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' != '') && ('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' != 'null')) &&
                                              (('${FFAppState().fireInsuranceSearchPackageData.usableArea}' !=
                                                      '') &&
                                                  ('${FFAppState().fireInsuranceSearchPackageData.usableArea}' !=
                                                      'null')) &&
                                              (('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                                                      '') &&
                                                  ('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                                                      'null'))) {
                                            showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: WebViewAware(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Container(
                                                        height: double.infinity,
                                                        child:
                                                            LoadingSceneWidget(),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );

                                            _model.calEstimatedOutput05Sq =
                                                await HouseInsuranceGroup
                                                    .houseCalEstimatedApiCall
                                                    .call(
                                              houseAreaType: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseAreaType,
                                              houseTypeCode: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseTypeCode,
                                              usableArea: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .usableArea,
                                              token: FFAppState().accessToken,
                                              apiUrl: FFAppState()
                                                  .apiUrlInsuranceAppState,
                                              floor: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseFloor,
                                              width: '0',
                                              long: '0',
                                            );

                                            if ((_model.calEstimatedOutput05Sq
                                                        ?.statusCode ??
                                                    200) ==
                                                200) {
                                              if ('${getJsonField(
                                                    (_model.calEstimatedOutput05Sq
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.code''',
                                                  ).toString()}' ==
                                                  '200') {
                                                FFAppState().calEstimatedData =
                                                    HouseInsuranceGroup
                                                        .houseCalEstimatedApiCall
                                                        .data(
                                                  (_model.calEstimatedOutput05Sq
                                                          ?.jsonBody ??
                                                      ''),
                                                )!;
                                                safeSetState(() {});
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            '${HouseInsuranceGroup.houseCalEstimatedApiCall.messageLayer1(
                                                          (_model.calEstimatedOutput05Sq
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )}'),
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
                                              }
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      content: Text(
                                                          'พบข้อผิดพลาดConnection (${(_model.calEstimatedOutput05Sq?.statusCode ?? 200).toString()})'),
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
                                            }

                                            Navigator.pop(context);
                                          }
                                        } else {
                                          if ((('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' != '') && ('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' != 'null')) &&
                                              (('${FFAppState().fireInsuranceSearchPackageData.houseWidth}' !=
                                                      '') &&
                                                  ('${FFAppState().fireInsuranceSearchPackageData.houseWidth}' !=
                                                      'null')) &&
                                              (('${FFAppState().fireInsuranceSearchPackageData.houseLong}' !=
                                                      '') &&
                                                  ('${FFAppState().fireInsuranceSearchPackageData.houseLong}' !=
                                                      'null')) &&
                                              (('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                                                      '') &&
                                                  ('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                                                      'null'))) {
                                            showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: WebViewAware(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Container(
                                                        height: double.infinity,
                                                        child:
                                                            LoadingSceneWidget(),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );

                                            _model.calEstimatedOutput05NonSq =
                                                await HouseInsuranceGroup
                                                    .houseCalEstimatedApiCall
                                                    .call(
                                              houseAreaType: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseAreaType,
                                              houseTypeCode: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseTypeCode,
                                              usableArea: (int.parse(FFAppState()
                                                          .fireInsuranceSearchPackageData
                                                          .houseWidth) *
                                                      int.parse(FFAppState()
                                                          .fireInsuranceSearchPackageData
                                                          .houseLong))
                                                  .toString(),
                                              token: FFAppState().accessToken,
                                              apiUrl: FFAppState()
                                                  .apiUrlInsuranceAppState,
                                              floor: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseFloor,
                                              width: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseWidth,
                                              long: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseLong,
                                            );

                                            if ((_model.calEstimatedOutput05NonSq
                                                        ?.statusCode ??
                                                    200) ==
                                                200) {
                                              if ('${getJsonField(
                                                    (_model.calEstimatedOutput05NonSq
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.code''',
                                                  ).toString()}' ==
                                                  '200') {
                                                FFAppState().calEstimatedData =
                                                    HouseInsuranceGroup
                                                        .houseCalEstimatedApiCall
                                                        .data(
                                                  (_model.calEstimatedOutput05NonSq
                                                          ?.jsonBody ??
                                                      ''),
                                                )!;
                                                safeSetState(() {});
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            '${HouseInsuranceGroup.houseCalEstimatedApiCall.messageLayer1(
                                                          (_model.calEstimatedOutput05NonSq
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )}'),
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
                                              }
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      content: Text(
                                                          'พบข้อผิดพลาดConnection (${(_model.calEstimatedOutput05NonSq?.statusCode ?? 200).toString()})'),
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
                                            }

                                            Navigator.pop(context);
                                          }
                                        }

                                        context.safePop();

                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 65.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            width: 0.5,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              height: 60.0,
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'อาคารพานิชย์',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                20.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/nm5nb_.png',
                                                        width: 90.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              thickness: 1.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent4,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Builder(
                                  builder: (context) => Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 7.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState()
                                            .updateFireInsuranceSearchPackageDataStruct(
                                          (e) => e
                                            ..houseTypeCode = '06'
                                            ..houseTypeName = 'ตึกแถว',
                                        );
                                        safeSetState(() {});
                                        if (FFAppState()
                                                .fireInsuranceSearchPackageData
                                                .houseAreaType ==
                                            '02') {
                                          if ((('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' != '') && ('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' != 'null')) &&
                                              (('${FFAppState().fireInsuranceSearchPackageData.usableArea}' !=
                                                      '') &&
                                                  ('${FFAppState().fireInsuranceSearchPackageData.usableArea}' !=
                                                      'null')) &&
                                              (('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                                                      '') &&
                                                  ('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                                                      'null'))) {
                                            showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: WebViewAware(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Container(
                                                        height: double.infinity,
                                                        child:
                                                            LoadingSceneWidget(),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );

                                            _model.calEstimatedOutput06Sq =
                                                await HouseInsuranceGroup
                                                    .houseCalEstimatedApiCall
                                                    .call(
                                              houseAreaType: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseAreaType,
                                              houseTypeCode: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseTypeCode,
                                              usableArea: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .usableArea,
                                              token: FFAppState().accessToken,
                                              apiUrl: FFAppState()
                                                  .apiUrlInsuranceAppState,
                                              floor: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseFloor,
                                              width: '0',
                                              long: '0',
                                            );

                                            if ((_model.calEstimatedOutput06Sq
                                                        ?.statusCode ??
                                                    200) ==
                                                200) {
                                              if ('${getJsonField(
                                                    (_model.calEstimatedOutput06Sq
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.code''',
                                                  ).toString()}' ==
                                                  '200') {
                                                FFAppState().calEstimatedData =
                                                    HouseInsuranceGroup
                                                        .houseCalEstimatedApiCall
                                                        .data(
                                                  (_model.calEstimatedOutput06Sq
                                                          ?.jsonBody ??
                                                      ''),
                                                )!;
                                                safeSetState(() {});
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            '${HouseInsuranceGroup.houseCalEstimatedApiCall.messageLayer1(
                                                          (_model.calEstimatedOutput06Sq
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )}'),
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
                                              }
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      content: Text(
                                                          'พบข้อผิดพลาดConnection (${(_model.calEstimatedOutput06Sq?.statusCode ?? 200).toString()})'),
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
                                            }

                                            Navigator.pop(context);
                                          }
                                        } else {
                                          if ((('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' != '') && ('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' != 'null')) &&
                                              (('${FFAppState().fireInsuranceSearchPackageData.houseWidth}' !=
                                                      '') &&
                                                  ('${FFAppState().fireInsuranceSearchPackageData.houseWidth}' !=
                                                      'null')) &&
                                              (('${FFAppState().fireInsuranceSearchPackageData.houseLong}' !=
                                                      '') &&
                                                  ('${FFAppState().fireInsuranceSearchPackageData.houseLong}' !=
                                                      'null')) &&
                                              (('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                                                      '') &&
                                                  ('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                                                      'null'))) {
                                            showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: WebViewAware(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Container(
                                                        height: double.infinity,
                                                        child:
                                                            LoadingSceneWidget(),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );

                                            _model.calEstimatedOutput06NonSq =
                                                await HouseInsuranceGroup
                                                    .houseCalEstimatedApiCall
                                                    .call(
                                              houseAreaType: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseAreaType,
                                              houseTypeCode: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseTypeCode,
                                              usableArea: (int.parse(FFAppState()
                                                          .fireInsuranceSearchPackageData
                                                          .houseWidth) *
                                                      int.parse(FFAppState()
                                                          .fireInsuranceSearchPackageData
                                                          .houseLong))
                                                  .toString(),
                                              token: FFAppState().accessToken,
                                              apiUrl: FFAppState()
                                                  .apiUrlInsuranceAppState,
                                              floor: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseFloor,
                                              width: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseWidth,
                                              long: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseLong,
                                            );

                                            if ((_model.calEstimatedOutput06NonSq
                                                        ?.statusCode ??
                                                    200) ==
                                                200) {
                                              if ('${getJsonField(
                                                    (_model.calEstimatedOutput06NonSq
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.code''',
                                                  ).toString()}' ==
                                                  '200') {
                                                FFAppState().calEstimatedData =
                                                    HouseInsuranceGroup
                                                        .houseCalEstimatedApiCall
                                                        .data(
                                                  (_model.calEstimatedOutput06NonSq
                                                          ?.jsonBody ??
                                                      ''),
                                                )!;
                                                safeSetState(() {});
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            '${HouseInsuranceGroup.houseCalEstimatedApiCall.messageLayer1(
                                                          (_model.calEstimatedOutput06NonSq
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )}'),
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
                                              }
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      content: Text(
                                                          'พบข้อผิดพลาดConnection (${(_model.calEstimatedOutput06NonSq?.statusCode ?? 200).toString()})'),
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
                                            }

                                            Navigator.pop(context);
                                          }
                                        }

                                        context.safePop();

                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 65.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            width: 0.5,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              height: 60.0,
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'ตึกแถว',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                20.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/p4r6s_.png',
                                                        width: 90.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              thickness: 1.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent4,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Builder(
                                  builder: (context) => Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 7.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState()
                                            .updateFireInsuranceSearchPackageDataStruct(
                                          (e) => e
                                            ..houseTypeCode = '07'
                                            ..houseTypeName = 'คอนโด',
                                        );
                                        safeSetState(() {});
                                        if (FFAppState()
                                                .fireInsuranceSearchPackageData
                                                .houseAreaType ==
                                            '02') {
                                          if ((('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' != '') && ('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' != 'null')) &&
                                              (('${FFAppState().fireInsuranceSearchPackageData.usableArea}' !=
                                                      '') &&
                                                  ('${FFAppState().fireInsuranceSearchPackageData.usableArea}' !=
                                                      'null')) &&
                                              (('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                                                      '') &&
                                                  ('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                                                      'null'))) {
                                            showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: WebViewAware(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Container(
                                                        height: double.infinity,
                                                        child:
                                                            LoadingSceneWidget(),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );

                                            _model.calEstimatedOutput07Sq =
                                                await HouseInsuranceGroup
                                                    .houseCalEstimatedApiCall
                                                    .call(
                                              houseAreaType: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseAreaType,
                                              houseTypeCode: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseTypeCode,
                                              usableArea: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .usableArea,
                                              token: FFAppState().accessToken,
                                              apiUrl: FFAppState()
                                                  .apiUrlInsuranceAppState,
                                              floor: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseFloor,
                                              width: '0',
                                              long: '0',
                                            );

                                            if ((_model.calEstimatedOutput07Sq
                                                        ?.statusCode ??
                                                    200) ==
                                                200) {
                                              if ('${getJsonField(
                                                    (_model.calEstimatedOutput07Sq
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.code''',
                                                  ).toString()}' ==
                                                  '200') {
                                                FFAppState().calEstimatedData =
                                                    HouseInsuranceGroup
                                                        .houseCalEstimatedApiCall
                                                        .data(
                                                  (_model.calEstimatedOutput07Sq
                                                          ?.jsonBody ??
                                                      ''),
                                                )!;
                                                safeSetState(() {});
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            '${HouseInsuranceGroup.houseCalEstimatedApiCall.messageLayer1(
                                                          (_model.calEstimatedOutput07Sq
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )}'),
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
                                              }
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      content: Text(
                                                          'พบข้อผิดพลาดConnection (${(_model.calEstimatedOutput07Sq?.statusCode ?? 200).toString()})'),
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
                                            }

                                            Navigator.pop(context);
                                          }
                                        } else {
                                          if ((('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' != '') && ('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' != 'null')) &&
                                              (('${FFAppState().fireInsuranceSearchPackageData.houseWidth}' !=
                                                      '') &&
                                                  ('${FFAppState().fireInsuranceSearchPackageData.houseWidth}' !=
                                                      'null')) &&
                                              (('${FFAppState().fireInsuranceSearchPackageData.houseLong}' !=
                                                      '') &&
                                                  ('${FFAppState().fireInsuranceSearchPackageData.houseLong}' !=
                                                      'null')) &&
                                              (('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                                                      '') &&
                                                  ('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                                                      'null'))) {
                                            showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: WebViewAware(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Container(
                                                        height: double.infinity,
                                                        child:
                                                            LoadingSceneWidget(),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );

                                            _model.calEstimatedOutput07NonSq =
                                                await HouseInsuranceGroup
                                                    .houseCalEstimatedApiCall
                                                    .call(
                                              houseAreaType: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseAreaType,
                                              houseTypeCode: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseTypeCode,
                                              usableArea: (int.parse(FFAppState()
                                                          .fireInsuranceSearchPackageData
                                                          .houseWidth) *
                                                      int.parse(FFAppState()
                                                          .fireInsuranceSearchPackageData
                                                          .houseLong))
                                                  .toString(),
                                              token: FFAppState().accessToken,
                                              apiUrl: FFAppState()
                                                  .apiUrlInsuranceAppState,
                                              floor: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseFloor,
                                              width: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseWidth,
                                              long: FFAppState()
                                                  .fireInsuranceSearchPackageData
                                                  .houseLong,
                                            );

                                            if ((_model.calEstimatedOutput07NonSq
                                                        ?.statusCode ??
                                                    200) ==
                                                200) {
                                              if ('${getJsonField(
                                                    (_model.calEstimatedOutput07NonSq
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.code''',
                                                  ).toString()}' ==
                                                  '200') {
                                                FFAppState().calEstimatedData =
                                                    HouseInsuranceGroup
                                                        .houseCalEstimatedApiCall
                                                        .data(
                                                  (_model.calEstimatedOutput07NonSq
                                                          ?.jsonBody ??
                                                      ''),
                                                )!;
                                                safeSetState(() {});
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            '${HouseInsuranceGroup.houseCalEstimatedApiCall.messageLayer1(
                                                          (_model.calEstimatedOutput07NonSq
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )}'),
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
                                              }
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      content: Text(
                                                          'พบข้อผิดพลาดConnection (${(_model.calEstimatedOutput07NonSq?.statusCode ?? 200).toString()})'),
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
                                            }

                                            Navigator.pop(context);
                                          }
                                        }

                                        context.safePop();

                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 65.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            width: 0.5,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              height: 60.0,
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'คอนโด',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Noto Sans Thai',
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                    ),
                                                  ),
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.asset(
                                                      'assets/images/ilywe_.png',
                                                      width: 130.0,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              thickness: 1.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent4,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Builder(
                                  builder: (context) => InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      FFAppState()
                                          .updateFireInsuranceSearchPackageDataStruct(
                                        (e) => e
                                          ..houseTypeCode = '08'
                                          ..houseTypeName = 'แฟลต',
                                      );
                                      safeSetState(() {});
                                      if (FFAppState()
                                              .fireInsuranceSearchPackageData
                                              .houseAreaType ==
                                          '02') {
                                        if ((('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' != '') && ('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' != 'null')) &&
                                            (('${FFAppState().fireInsuranceSearchPackageData.usableArea}' !=
                                                    '') &&
                                                ('${FFAppState().fireInsuranceSearchPackageData.usableArea}' !=
                                                    'null')) &&
                                            (('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                                                    '') &&
                                                ('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                                                    'null'))) {
                                          showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: WebViewAware(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(
                                                              dialogContext)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: Container(
                                                      height: double.infinity,
                                                      child:
                                                          LoadingSceneWidget(),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );

                                          _model.calEstimatedOutput08Sq =
                                              await HouseInsuranceGroup
                                                  .houseCalEstimatedApiCall
                                                  .call(
                                            houseAreaType: FFAppState()
                                                .fireInsuranceSearchPackageData
                                                .houseAreaType,
                                            houseTypeCode: FFAppState()
                                                .fireInsuranceSearchPackageData
                                                .houseTypeCode,
                                            usableArea: FFAppState()
                                                .fireInsuranceSearchPackageData
                                                .usableArea,
                                            token: FFAppState().accessToken,
                                            apiUrl: FFAppState()
                                                .apiUrlInsuranceAppState,
                                            floor: FFAppState()
                                                .fireInsuranceSearchPackageData
                                                .houseFloor,
                                            width: '0',
                                            long: '0',
                                          );

                                          if ((_model.calEstimatedOutput08Sq
                                                      ?.statusCode ??
                                                  200) ==
                                              200) {
                                            if ('${getJsonField(
                                                  (_model.calEstimatedOutput08Sq
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.code''',
                                                ).toString()}' ==
                                                '200') {
                                              FFAppState().calEstimatedData =
                                                  HouseInsuranceGroup
                                                      .houseCalEstimatedApiCall
                                                      .data(
                                                (_model.calEstimatedOutput08Sq
                                                        ?.jsonBody ??
                                                    ''),
                                              )!;
                                              safeSetState(() {});
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      content: Text(
                                                          '${HouseInsuranceGroup.houseCalEstimatedApiCall.messageLayer1(
                                                        (_model.calEstimatedOutput08Sq
                                                                ?.jsonBody ??
                                                            ''),
                                                      )}'),
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
                                            }
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    content: Text(
                                                        'พบข้อผิดพลาดConnection (${(_model.calEstimatedOutput08Sq?.statusCode ?? 200).toString()})'),
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
                                          }

                                          Navigator.pop(context);
                                        }
                                      } else {
                                        if ((('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' != '') && ('${FFAppState().fireInsuranceSearchPackageData.houseTypeName}' != 'null')) &&
                                            (('${FFAppState().fireInsuranceSearchPackageData.houseWidth}' !=
                                                    '') &&
                                                ('${FFAppState().fireInsuranceSearchPackageData.houseWidth}' !=
                                                    'null')) &&
                                            (('${FFAppState().fireInsuranceSearchPackageData.houseLong}' !=
                                                    '') &&
                                                ('${FFAppState().fireInsuranceSearchPackageData.houseLong}' !=
                                                    'null')) &&
                                            (('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                                                    '') &&
                                                ('${FFAppState().fireInsuranceSearchPackageData.houseFloor}' !=
                                                    'null'))) {
                                          showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: WebViewAware(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(
                                                              dialogContext)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: Container(
                                                      height: double.infinity,
                                                      child:
                                                          LoadingSceneWidget(),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );

                                          _model.calEstimatedOutput08NonSq =
                                              await HouseInsuranceGroup
                                                  .houseCalEstimatedApiCall
                                                  .call(
                                            houseAreaType: FFAppState()
                                                .fireInsuranceSearchPackageData
                                                .houseAreaType,
                                            houseTypeCode: FFAppState()
                                                .fireInsuranceSearchPackageData
                                                .houseTypeCode,
                                            usableArea: (int.parse(FFAppState()
                                                        .fireInsuranceSearchPackageData
                                                        .houseWidth) *
                                                    int.parse(FFAppState()
                                                        .fireInsuranceSearchPackageData
                                                        .houseLong))
                                                .toString(),
                                            token: FFAppState().accessToken,
                                            apiUrl: FFAppState()
                                                .apiUrlInsuranceAppState,
                                            floor: FFAppState()
                                                .fireInsuranceSearchPackageData
                                                .houseFloor,
                                            width: FFAppState()
                                                .fireInsuranceSearchPackageData
                                                .houseWidth,
                                            long: FFAppState()
                                                .fireInsuranceSearchPackageData
                                                .houseLong,
                                          );

                                          if ((_model.calEstimatedOutput08NonSq
                                                      ?.statusCode ??
                                                  200) ==
                                              200) {
                                            if ('${getJsonField(
                                                  (_model.calEstimatedOutput08NonSq
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.code''',
                                                ).toString()}' ==
                                                '200') {
                                              FFAppState().calEstimatedData =
                                                  HouseInsuranceGroup
                                                      .houseCalEstimatedApiCall
                                                      .data(
                                                (_model.calEstimatedOutput08NonSq
                                                        ?.jsonBody ??
                                                    ''),
                                              )!;
                                              safeSetState(() {});
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      content: Text(
                                                          '${HouseInsuranceGroup.houseCalEstimatedApiCall.messageLayer1(
                                                        (_model.calEstimatedOutput08NonSq
                                                                ?.jsonBody ??
                                                            ''),
                                                      )}'),
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
                                            }
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    content: Text(
                                                        'พบข้อผิดพลาดConnection (${(_model.calEstimatedOutput08NonSq?.statusCode ?? 200).toString()})'),
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
                                          }

                                          Navigator.pop(context);
                                        }
                                      }

                                      context.safePop();

                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 65.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          width: 0.5,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 60.0,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'แฟลต',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans Thai',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 20.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.asset(
                                                      'assets/images/xtoc5_.png',
                                                      width: 90.0,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            thickness: 1.0,
                                            color: FlutterFlowTheme.of(context)
                                                .accent4,
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
                      ]
                          .divide(SizedBox(height: 12.0))
                          .addToStart(SizedBox(height: 24.0))
                          .addToEnd(SizedBox(height: 24.0)),
                    ),
                  ),
                  if (false)
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if (false)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    if (functions.countTrueInBoolList(FFAppState()
                                            .searchableListComponentSelectedList
                                            .toList())! <=
                                        0) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content: Text(
                                                  'กรุณาเลือกอย่างน้อย 1 รายการ'),
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
                                    if (((widget!.titleText ==
                                                'เลือกประเภทรถ') &&
                                            (widget!.fromPage ==
                                                'searchPackage')) ||
                                        ((widget!.titleText ==
                                                'เลือกประเภทรถ') &&
                                            (widget!.fromPage ==
                                                'NonePackage'))) {
                                      if (widget!.fromPage == 'searchPackage') {
                                        if ((widget!.dataList?.elementAtOrNull(
                                                functions.getIndexOfBoolList(
                                                    FFAppState()
                                                        .searchableListComponentSelectedList
                                                        .toList(),
                                                    true))) ==
                                            'รถบรรทุก หัวลาก หางพ่วง') {
                                          context.goNamed(
                                              'InsuranceWorkSelectPage');

                                          return;
                                        } else {
                                          if ((widget!.dataList?.elementAtOrNull(
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true))) ==
                                              'รถแต่ง ต่อคอก') {
                                            context.goNamed(
                                                'InsuranceWorkSelectPage');

                                            return;
                                          }
                                        }

                                        FFAppState()
                                                .insuranceVehicleTypeDropDown =
                                            (widget!.dataList!.elementAtOrNull(
                                                functions.getIndexOfBoolList(
                                                    FFAppState()
                                                        .searchableListComponentSelectedList
                                                        .toList(),
                                                    true)))!;
                                        FFAppState()
                                            .updateSearchPackageCheckFilledAtIndex(
                                          0,
                                          (_) => true,
                                        );
                                        safeSetState(() {});
                                        context.safePop();
                                        return;
                                      } else {
                                        if (widget!.fromPage == 'NonePackage') {
                                          FFAppState().nonePackageVehicleType =
                                              (widget!.dataList!.elementAtOrNull(
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true)))!;
                                          safeSetState(() {});
                                          context.safePop();
                                          return;
                                        }
                                      }

                                      return;
                                    }
                                    if (widget!.titleText == 'เลือกยี่ห้อรถ') {
                                      if (widget!.fromPage != 'NonePackage') {
                                        FFAppState().insuranceBasicBrandName =
                                            (widget!.dataList!.elementAtOrNull(
                                                functions.getIndexOfBoolList(
                                                    FFAppState()
                                                        .searchableListComponentSelectedList
                                                        .toList(),
                                                    true)))!;
                                        FFAppState().isSelectBrandInPackage =
                                            true;
                                        FFAppState().insuranceBasicBrandId =
                                            FFAppState()
                                                .insuranceBasicBrandIdList
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        safeSetState(() {});
                                        FFAppState().insuranceBasicModelNameList = functions
                                            .returnMappedListFrom2List(
                                                FFAppState()
                                                    .insuranceBasicModelNameListOriginal
                                                    .toList(),
                                                FFAppState()
                                                    .insuranceBasicModelBrandIdListOriginal
                                                    .toList(),
                                                FFAppState()
                                                    .insuranceBasicBrandIdList
                                                    .elementAtOrNull(functions
                                                        .getIndexOfBoolList(
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)))
                                            .toList()
                                            .cast<String>();
                                        FFAppState().insuranceBasicModelIdList = functions
                                            .returnMappedListFrom2List(
                                                FFAppState()
                                                    .insuranceBasicModelIdListOriginal
                                                    .toList(),
                                                FFAppState()
                                                    .insuranceBasicModelBrandIdListOriginal
                                                    .toList(),
                                                FFAppState()
                                                    .insuranceBasicBrandIdList
                                                    .elementAtOrNull(functions
                                                        .getIndexOfBoolList(
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)))
                                            .toList()
                                            .cast<String>();
                                        safeSetState(() {});
                                        FFAppState()
                                            .updateSearchPackageCheckFilledAtIndex(
                                          1,
                                          (_) => true,
                                        );
                                        safeSetState(() {});
                                        context.safePop();
                                        return;
                                      } else {
                                        FFAppState().nonePackageBrandName =
                                            (widget!.dataList!.elementAtOrNull(
                                                functions.getIndexOfBoolList(
                                                    FFAppState()
                                                        .searchableListComponentSelectedList
                                                        .toList(),
                                                    true)))!;
                                        FFAppState().nonePackageBrandId =
                                            FFAppState()
                                                .insuranceBasicBrandIdList
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        FFAppState().nonePackageIsBrandSelect =
                                            true;
                                        safeSetState(() {});
                                        FFAppState().nonePackageSearchModelList = functions
                                            .returnMappedListFrom2List(
                                                FFAppState()
                                                    .insuranceBasicModelNameListOriginal
                                                    .toList(),
                                                FFAppState()
                                                    .insuranceBasicModelBrandIdListOriginal
                                                    .toList(),
                                                FFAppState()
                                                    .insuranceBasicBrandIdList
                                                    .elementAtOrNull(functions
                                                        .getIndexOfBoolList(
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)))
                                            .toList()
                                            .cast<String>();
                                        FFAppState().nonePackageSearchModelIdList = functions
                                            .returnMappedListFrom2List(
                                                FFAppState()
                                                    .insuranceBasicModelIdListOriginal
                                                    .toList(),
                                                FFAppState()
                                                    .insuranceBasicModelBrandIdListOriginal
                                                    .toList(),
                                                FFAppState()
                                                    .insuranceBasicBrandIdList
                                                    .elementAtOrNull(functions
                                                        .getIndexOfBoolList(
                                                            FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .toList(),
                                                            true)))
                                            .toList()
                                            .cast<String>();
                                        safeSetState(() {});
                                        context.safePop();
                                        return;
                                      }
                                    }
                                    if (widget!.titleText ==
                                        'เลือกปีจดทะเบียน') {
                                      if (widget!.fromPage != 'NonePackage') {
                                        FFAppState().insuranceBasicYear =
                                            (widget!.dataList!.elementAtOrNull(
                                                functions.getIndexOfBoolList(
                                                    FFAppState()
                                                        .searchableListComponentSelectedList
                                                        .toList(),
                                                    true)))!;
                                        safeSetState(() {});
                                        FFAppState()
                                            .updateSearchPackageCheckFilledAtIndex(
                                          3,
                                          (_) => true,
                                        );
                                        safeSetState(() {});
                                        context.safePop();
                                        return;
                                      } else {
                                        FFAppState().nonePackageYear =
                                            (widget!.dataList!.elementAtOrNull(
                                                functions.getIndexOfBoolList(
                                                    FFAppState()
                                                        .searchableListComponentSelectedList
                                                        .toList(),
                                                    true)))!;
                                        safeSetState(() {});
                                        context.safePop();
                                        return;
                                      }
                                    }
                                    if (widget!.titleText ==
                                        'เลือกลักษณะการใช้รถ') {
                                      if (widget!.fromPage != 'NonePackage') {
                                        FFAppState().insuranceBasicVehicleUsedTypeId = FFAppState()
                                            .insuranceBasicVehicleUsedTypeIdList
                                            .elementAtOrNull(functions.getIndexOfSomethingList(
                                                functions
                                                    .generateInsuranceVehicleTypeDropdown(
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeCodeList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeTypeList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeNameList
                                                            .toList())
                                                    ?.toList(),
                                                widget!.dataList?.elementAtOrNull(
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))))!;
                                        FFAppState().insuranceBasicVehicleUsedTypeCode = FFAppState()
                                            .insuranceBasicVehicleUsedTypeCodeList
                                            .elementAtOrNull(functions.getIndexOfSomethingList(
                                                functions
                                                    .generateInsuranceVehicleTypeDropdown(
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeCodeList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeTypeList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeNameList
                                                            .toList())
                                                    ?.toList(),
                                                widget!.dataList?.elementAtOrNull(
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))))!;
                                        FFAppState().insuranceBasicVehicleUsedTypeName = FFAppState()
                                            .insuranceBasicVehicleUsedTypeNameList
                                            .elementAtOrNull(functions.getIndexOfSomethingList(
                                                functions
                                                    .generateInsuranceVehicleTypeDropdown(
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeCodeList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeTypeList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeNameList
                                                            .toList())
                                                    ?.toList(),
                                                widget!.dataList?.elementAtOrNull(
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))))!;
                                        safeSetState(() {});
                                        FFAppState()
                                            .updateSearchPackageCheckFilledAtIndex(
                                          4,
                                          (_) => true,
                                        );
                                        safeSetState(() {});
                                        context.safePop();
                                        return;
                                      } else {
                                        FFAppState().nonePackageUsedTypeId = FFAppState()
                                            .insuranceBasicVehicleUsedTypeIdList
                                            .elementAtOrNull(functions.getIndexOfSomethingList(
                                                functions
                                                    .generateInsuranceVehicleTypeDropdown(
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeCodeList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeTypeList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeNameList
                                                            .toList())
                                                    ?.toList(),
                                                widget!.dataList?.elementAtOrNull(
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))))!;
                                        FFAppState().nonePackageUsedTypeCode = FFAppState()
                                            .insuranceBasicVehicleUsedTypeCodeList
                                            .elementAtOrNull(functions.getIndexOfSomethingList(
                                                functions
                                                    .generateInsuranceVehicleTypeDropdown(
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeCodeList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeTypeList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeNameList
                                                            .toList())
                                                    ?.toList(),
                                                widget!.dataList?.elementAtOrNull(
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))))!;
                                        FFAppState().nonePackageUsedTypeName = FFAppState()
                                            .insuranceBasicVehicleUsedTypeNameList
                                            .elementAtOrNull(functions.getIndexOfSomethingList(
                                                functions
                                                    .generateInsuranceVehicleTypeDropdown(
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeCodeList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeTypeList
                                                            .toList(),
                                                        FFAppState()
                                                            .insuranceBasicVehicleUsedTypeNameList
                                                            .toList())
                                                    ?.toList(),
                                                widget!.dataList?.elementAtOrNull(
                                                    functions.getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))))!;
                                        safeSetState(() {});
                                        context.safePop();
                                        return;
                                      }
                                    }
                                    if (widget!.titleText ==
                                        'เลือกประเภทชั้นประกัน') {
                                      if (widget!.fromPage != 'NonePackage') {
                                        FFAppState()
                                                .insuranceBasicCoverTypeNameOutputList =
                                            functions
                                                .returnMappedListFromBoolList(
                                                    widget!.dataList?.toList(),
                                                    FFAppState()
                                                        .searchableListComponentSelectedList
                                                        .toList(),
                                                    true)
                                                .toList()
                                                .cast<String>();
                                        FFAppState()
                                                .insuranceBasicCoverTypeIdOutputList =
                                            functions
                                                .returnMappedListFromBoolList(
                                                    FFAppState()
                                                        .insuranceBasicCoverTypeIdList
                                                        .toList(),
                                                    FFAppState()
                                                        .searchableListComponentSelectedList
                                                        .toList(),
                                                    true)
                                                .toList()
                                                .cast<String>();
                                        FFAppState()
                                                .insuranceBasicCoverTypeCodeOutputList =
                                            functions
                                                .returnMappedListFromBoolList(
                                                    FFAppState()
                                                        .insuranceBasicCoverTypeCodeList
                                                        .toList(),
                                                    FFAppState()
                                                        .searchableListComponentSelectedList
                                                        .toList(),
                                                    true)
                                                .toList()
                                                .cast<String>();
                                        safeSetState(() {});
                                        context.safePop();
                                        return;
                                      } else {
                                        FFAppState().nonePackageCoverTypeId =
                                            FFAppState()
                                                .insuranceBasicCoverTypeIdList
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        FFAppState().nonePackageCoverTypeCode =
                                            FFAppState()
                                                .insuranceBasicCoverTypeCodeList
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        FFAppState().nonePackageCoverTypeName =
                                            (widget!.dataList!.elementAtOrNull(
                                                functions.getIndexOfBoolList(
                                                    FFAppState()
                                                        .searchableListComponentSelectedList
                                                        .toList(),
                                                    true)))!;
                                        safeSetState(() {});
                                        context.safePop();
                                        return;
                                      }
                                    }
                                    if (widget!.titleText ==
                                        'เลือกประเภทการซ่อม') {
                                      if (widget!.fromPage != 'NonePackage') {
                                        FFAppState()
                                                .insuranceBasicGarageTypeInPackage =
                                            functions
                                                .returnMappedListFromBoolList(
                                                    FFAppState()
                                                        .insuranceBasicGarageTypeNameList
                                                        .toList(),
                                                    FFAppState()
                                                        .searchableListComponentSelectedList
                                                        .toList(),
                                                    true)
                                                .toList()
                                                .cast<String>();
                                        FFAppState()
                                                .insuranceBasicGarageTypeIdInPackage =
                                            functions
                                                .returnMappedListFromBoolList(
                                                    FFAppState()
                                                        .insuranceBasicGarageTypeIdList
                                                        .toList(),
                                                    FFAppState()
                                                        .searchableListComponentSelectedList
                                                        .toList(),
                                                    true)
                                                .toList()
                                                .cast<String>();
                                        safeSetState(() {});
                                        context.safePop();
                                        return;
                                      } else {
                                        FFAppState().nonePackageGarageTypeId =
                                            FFAppState()
                                                .insuranceBasicGarageTypeIdList
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        FFAppState().nonePackageGarageTypeName =
                                            FFAppState()
                                                .insuranceBasicGarageTypeNameList
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        FFAppState().nonePackageGarageTypeCode =
                                            FFAppState()
                                                .nonePackageGarageTypeCodeList
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        safeSetState(() {});
                                        context.safePop();
                                        return;
                                      }
                                    }
                                    if (widget!.titleText ==
                                        'ค้นหาเปรียบเทียบบริษัทประกัน') {
                                      FFAppState().filterInsurerList = functions
                                          .returnMappedListFromBoolList(
                                              widget!.dataList?.toList(),
                                              FFAppState()
                                                  .searchableListComponentSelectedList
                                                  .toList(),
                                              true)
                                          .toList()
                                          .cast<String>();
                                      safeSetState(() {});
                                      context.safePop();
                                      return;
                                    }
                                    if (widget!.titleText ==
                                        'ค้นหาเปรียบเทียบชั้นประกัน') {
                                      FFAppState().filterCoverTypeList = functions
                                          .returnMappedListFromBoolList(
                                              widget!.dataList?.toList(),
                                              FFAppState()
                                                  .searchableListComponentSelectedList
                                                  .toList(),
                                              true)
                                          .toList()
                                          .cast<String>();
                                      safeSetState(() {});
                                      context.safePop();
                                      return;
                                    }
                                    if (widget!.titleText ==
                                        'ค้นหาเปรียบเทียบประเภทการซ่อม') {
                                      FFAppState().filterGarageTypeList = functions
                                          .returnMappedListFromBoolList(
                                              widget!.dataList?.toList(),
                                              FFAppState()
                                                  .searchableListComponentSelectedList
                                                  .toList(),
                                              true)
                                          .toList()
                                          .cast<String>();
                                      safeSetState(() {});
                                      context.safePop();
                                      return;
                                    }
                                    if (widget!.titleText == 'ประเภทบัตร') {
                                      FFAppState().insuranceInfoCardType =
                                          (widget!.dataList!.elementAtOrNull(
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)))!;
                                      safeSetState(() {});
                                      context.safePop();
                                      return;
                                    }
                                    if (widget!.titleText == 'เพศ') {
                                      FFAppState().insuranceInfoGender =
                                          (widget!.dataList!.elementAtOrNull(
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)))!;
                                      safeSetState(() {});
                                      context.safePop();
                                      return;
                                    }
                                    if (widget!.titleText == 'คำนำหน้า') {
                                      FFAppState().insuranceInfoTitle =
                                          (widget!.dataList!.elementAtOrNull(
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)))!;
                                      safeSetState(() {});
                                      context.safePop();
                                      return;
                                    }
                                    if (widget!.titleText == 'กลุ่มอาชีพ') {
                                      FFAppState()
                                              .insuranceInfoOccupationGroup =
                                          (widget!.dataList!.elementAtOrNull(
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)))!;
                                      safeSetState(() {});
                                      context.safePop();
                                      return;
                                    }
                                    if (widget!.titleText ==
                                        'เลือกจังหวัดจดทะเบียน') {
                                      if (widget!.fromPage != 'NonePackage') {
                                        return;
                                      }

                                      FFAppState().nonePackageProvinceId =
                                          FFAppState()
                                              .insuranceBasicProvinceIdList
                                              .elementAtOrNull(
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true))!;
                                      FFAppState().nonePackageProvince =
                                          (widget!.dataList!.elementAtOrNull(
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)))!;
                                      safeSetState(() {});
                                      context.safePop();
                                      return;
                                    }
                                    if (widget!.titleText == 'ค้นหาที่อยู่') {
                                      if (widget!.fromPage ==
                                          'addAddressIdCard') {
                                        FFAppState()
                                                .addAddressSelectProvinceId =
                                            FFAppState()
                                                .addAddressProvinceId
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        FFAppState()
                                                .addAddressSelectProvinceName =
                                            FFAppState()
                                                .addAddressProvinceName
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        FFAppState()
                                                .addAddressSelectDistrictId =
                                            FFAppState()
                                                .addAddressDistrictId
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!
                                                .toString();
                                        FFAppState()
                                                .addAddressSelectDistrictName =
                                            FFAppState()
                                                .addAddressDistrictName
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        FFAppState()
                                                .addAddressSelectSubdistrictId =
                                            FFAppState()
                                                .addAddressSubdistrictId
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!
                                                .toString();
                                        FFAppState()
                                                .addAddressSelectSubdistrictName =
                                            FFAppState()
                                                .addAddressSubdistrictName
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        FFAppState().addAddressSelectZipCode =
                                            FFAppState()
                                                .addAddressZipCode
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        FFAppState().addAddressSelectKeyWord =
                                            FFAppState()
                                                .addAddressKeyWord
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        FFAppState().addAddressAtIdCard =
                                            FFAppState()
                                                .addAddressKeyWord
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        safeSetState(() {});
                                        context.safePop();
                                        return;
                                      } else {
                                        FFAppState().addAddressForDoc = FFAppState()
                                            .addAddressKeyWord
                                            .elementAtOrNull(
                                                functions.getIndexOfBoolList(
                                                    FFAppState()
                                                        .searchableListComponentSelectedList
                                                        .toList(),
                                                    true))!;
                                        FFAppState()
                                                .addAdressSelectDocProvinceId =
                                            FFAppState()
                                                .addAddressProvinceId
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        FFAppState()
                                                .addAdressSelectDocProvinceName =
                                            FFAppState()
                                                .addAddressProvinceName
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        FFAppState()
                                                .addAdressSelectDocDistrictName =
                                            FFAppState()
                                                .addAddressDistrictName
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        FFAppState()
                                                .addAddressSelectDocDistrictId =
                                            FFAppState()
                                                .addAddressDistrictId
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!
                                                .toString();
                                        FFAppState()
                                                .addAddressSelectDocSubdistrictId =
                                            FFAppState()
                                                .addAddressSubdistrictId
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!
                                                .toString();
                                        FFAppState()
                                                .addAddressSelectDocSubdistrictName =
                                            FFAppState()
                                                .addAddressSubdistrictName
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        FFAppState()
                                                .addAddressSelectDocZipCode =
                                            FFAppState()
                                                .addAddressZipCode
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        FFAppState()
                                                .addAddressSelectDocKeyWord =
                                            FFAppState()
                                                .addAddressKeyWord
                                                .elementAtOrNull(functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .searchableListComponentSelectedList
                                                            .toList(),
                                                        true))!;
                                        safeSetState(() {});
                                        context.safePop();
                                        return;
                                      }
                                    }
                                    if (widget!.titleText ==
                                        'เลือกประเภทตู้เหล็ก') {
                                      if (widget!.fromPage != 'NonePackage') {
                                        return;
                                      }

                                      FFAppState().nonePackageCarrierType =
                                          (widget!.dataList!.elementAtOrNull(
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)))!;
                                      safeSetState(() {});
                                      context.safePop();
                                      return;
                                    }
                                    if (widget!.titleText ==
                                        'เลือกส่วนของรถบรรทุก') {
                                      if (widget!.fromPage != 'NonePackage') {
                                        return;
                                      }

                                      FFAppState().nonePackageTruckPart =
                                          (widget!.dataList!.elementAtOrNull(
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)))!;
                                      safeSetState(() {});
                                      context.safePop();
                                      return;
                                    }
                                    if (widget!.titleText ==
                                        'เลือกประเภทลูกค้า') {
                                      if (widget!.fromPage != 'NonePackage') {
                                        return;
                                      }

                                      FFAppState().nonePackageCusMembership =
                                          (widget!.dataList!.elementAtOrNull(
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)))!;
                                      safeSetState(() {});
                                      context.safePop();
                                      return;
                                    }
                                    if (widget!.titleText == 'เลือกปีที่ผลิต') {
                                      FFAppState().insuranceInfoProductYear =
                                          (widget!.dataList!.elementAtOrNull(
                                              functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .searchableListComponentSelectedList
                                                      .toList(),
                                                  true)))!;
                                      safeSetState(() {});
                                      context.safePop();
                                      return;
                                    }
                                  },
                                  text: 'ตกลง',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 60.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0xFFDB771B),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Noto Sans Thai',
                                          color: Colors.white,
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
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
                          ].addToStart(SizedBox(height: 16.0)),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
