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
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'fire_searchable_list_page_model.dart';
export 'fire_searchable_list_page_model.dart';

class FireSearchableListPageWidget extends StatefulWidget {
  const FireSearchableListPageWidget({
    super.key,
    String? titleText,
    required this.searchLabel,
    required this.dataList,
    bool? multiSelect,
    int? maxSelected,
    String? fromPage,
    this.index,
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
  final int? index;

  @override
  State<FireSearchableListPageWidget> createState() =>
      _FireSearchableListPageWidgetState();
}

class _FireSearchableListPageWidgetState
    extends State<FireSearchableListPageWidget> {
  late FireSearchableListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FireSearchableListPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'FireSearchableListPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().searchableListComponentData =
          widget!.dataList!.toList().cast<String>();
      FFAppState().searchableListComponentSelectedList = functions
          .createFalseListByItemNumber(false, widget!.dataList?.length)!
          .toList()
          .cast<bool>();
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
              widget!.titleText,
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
                        if (widget!.multiSelect)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  widget!.multiSelect &&
                                          (widget!.maxSelected > 0)
                                      ? 'สามารถเลือกได้สูงสุด ${widget!.maxSelected.toString()} รายการ (${widget!.multiSelect && (widget!.maxSelected > 0) ? '${functions.countTrueInBoolList(FFAppState().searchableListComponentSelectedList.toList()).toString()}/${widget!.maxSelected.toString()}' : 'เลือกแล้ว ${functions.countTrueInBoolList(FFAppState().searchableListComponentSelectedList.toList()).toString()} รายการ'}'
                                      : 'สามารถเลือกได้มากกว่า 1 รายการ',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto Sans Thai',
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        if (widget!.dataList!.length > 5)
                          Container(
                            width: double.infinity,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                width: 0.5,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.textController,
                                      focusNode: _model.textFieldFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.textController',
                                        Duration(milliseconds: 100),
                                        () => safeSetState(() {}),
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: widget!.searchLabel,
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Noto Sans Thai',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.search_outlined,
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto Sans Thai',
                                            letterSpacing: 0.0,
                                          ),
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (widget!.titleText == 'ค้นหาที่อยู่'
                            ? (_model.textController.text != null &&
                                _model.textController.text != '')
                            : true)
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: Builder(
                                builder: (context) {
                                  final dataList = widget!.dataList!.toList();

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: dataList.length,
                                    itemBuilder: (context, dataListIndex) {
                                      final dataListItem =
                                          dataList[dataListIndex];
                                      return Visibility(
                                        visible: (_model.textController.text ==
                                                    null ||
                                                _model.textController.text ==
                                                    '') ||
                                            functions.containWordinStringUrl(
                                                _model.textController.text
                                                    .toUpperCase(),
                                                widget!.dataList
                                                    ?.elementAtOrNull(
                                                        dataListIndex))!,
                                        child: Builder(
                                          builder: (context) => InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              var _shouldSetState = false;
                                              if (widget!.multiSelect) {
                                                if (widget!.maxSelected == 0) {
                                                  FFAppState()
                                                      .updateSearchableListComponentSelectedListAtIndex(
                                                    dataListIndex,
                                                    (_) => FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .elementAtOrNull(
                                                                    dataListIndex) ==
                                                            true
                                                        ? false
                                                        : true,
                                                  );
                                                  safeSetState(() {});
                                                } else {
                                                  if (functions.countTrueInBoolList(
                                                          FFAppState()
                                                              .searchableListComponentSelectedList
                                                              .toList())! >=
                                                      widget!.maxSelected) {
                                                    FFAppState()
                                                        .updateSearchableListComponentSelectedListAtIndex(
                                                      dataListIndex,
                                                      (_) => false,
                                                    );
                                                    safeSetState(() {});
                                                  } else {
                                                    FFAppState()
                                                        .updateSearchableListComponentSelectedListAtIndex(
                                                      dataListIndex,
                                                      (_) => FFAppState()
                                                                  .searchableListComponentSelectedList
                                                                  .elementAtOrNull(
                                                                      dataListIndex) ==
                                                              true
                                                          ? false
                                                          : true,
                                                    );
                                                    safeSetState(() {});
                                                  }
                                                }
                                              } else {
                                                FFAppState()
                                                        .searchableListComponentSelectedList =
                                                    functions
                                                        .setBoolValueListAtIndex(
                                                            functions
                                                                .createFalseListByItemNumber(
                                                                    false,
                                                                    widget!
                                                                        .dataList
                                                                        ?.length)
                                                                ?.toList(),
                                                            dataListIndex)!
                                                        .toList()
                                                        .cast<bool>();
                                                safeSetState(() {});
                                                if (widget!.titleText ==
                                                    'เลือกจำนวนชั้น') {
                                                  FFAppState()
                                                      .updateFireInsuranceSearchPackageDataStruct(
                                                    (e) => e
                                                      ..houseFloor = widget!
                                                          .dataList
                                                          ?.elementAtOrNull(functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true)),
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
                                                        builder:
                                                            (dialogContext) {
                                                          return Dialog(
                                                            elevation: 0,
                                                            insetPadding:
                                                                EdgeInsets.zero,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            alignment: AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                            child: WebViewAware(
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  FocusScope.of(
                                                                          dialogContext)
                                                                      .unfocus();
                                                                  FocusManager
                                                                      .instance
                                                                      .primaryFocus
                                                                      ?.unfocus();
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: double
                                                                      .infinity,
                                                                  child:
                                                                      LoadingSceneWidget(),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );

                                                      _model.calEstimatedOutputFloorSq =
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
                                                        token: FFAppState()
                                                            .accessToken,
                                                        apiUrl:
                                                            'https://is-dev.swpfin.com/ssw_tanjai_api_dev',
                                                        floor: FFAppState()
                                                            .fireInsuranceSearchPackageData
                                                            .houseFloor,
                                                        width: '0',
                                                        long: '0',
                                                      );

                                                      _shouldSetState = true;
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text((_model
                                                                          .calEstimatedOutputFloorSq
                                                                          ?.jsonBody ??
                                                                      '')
                                                                  .toString()),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      );
                                                      if ((_model.calEstimatedOutputFloorSq
                                                                  ?.statusCode ??
                                                              200) ==
                                                          200) {
                                                        if ('${getJsonField(
                                                              (_model.calEstimatedOutputFloorSq
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.code''',
                                                            ).toString()}' ==
                                                            '200') {
                                                          FFAppState()
                                                                  .calEstimatedData =
                                                              HouseInsuranceGroup
                                                                  .houseCalEstimatedApiCall
                                                                  .data(
                                                            (_model.calEstimatedOutputFloorSq
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
                                                                child:
                                                                    AlertDialog(
                                                                  content: Text(
                                                                      '${HouseInsuranceGroup.houseCalEstimatedApiCall.messageLayer1(
                                                                    (_model.calEstimatedOutputFloorSq
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )}'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
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
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                content: Text(
                                                                    'พบข้อผิดพลาดConnection (${(_model.calEstimatedOutputFloorSq?.statusCode ?? 200).toString()})'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: Text(
                                                                        'Ok'),
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
                                                        builder:
                                                            (dialogContext) {
                                                          return Dialog(
                                                            elevation: 0,
                                                            insetPadding:
                                                                EdgeInsets.zero,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            alignment: AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                            child: WebViewAware(
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  FocusScope.of(
                                                                          dialogContext)
                                                                      .unfocus();
                                                                  FocusManager
                                                                      .instance
                                                                      .primaryFocus
                                                                      ?.unfocus();
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: double
                                                                      .infinity,
                                                                  child:
                                                                      LoadingSceneWidget(),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );

                                                      _model.calEstimatedOutputFloorNonSq =
                                                          await HouseInsuranceGroup
                                                              .houseCalEstimatedApiCall
                                                              .call(
                                                        houseAreaType: FFAppState()
                                                            .fireInsuranceSearchPackageData
                                                            .houseAreaType,
                                                        houseTypeCode: FFAppState()
                                                            .fireInsuranceSearchPackageData
                                                            .houseTypeCode,
                                                        usableArea: (int.parse(
                                                                    FFAppState()
                                                                        .fireInsuranceSearchPackageData
                                                                        .houseWidth) *
                                                                int.parse(FFAppState()
                                                                    .fireInsuranceSearchPackageData
                                                                    .houseLong))
                                                            .toString(),
                                                        token: FFAppState()
                                                            .accessToken,
                                                        apiUrl:
                                                            'https://is-dev.swpfin.com/ssw_tanjai_api_dev',
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

                                                      _shouldSetState = true;
                                                      if ((_model.calEstimatedOutputFloorNonSq
                                                                  ?.statusCode ??
                                                              200) ==
                                                          200) {
                                                        if ('${getJsonField(
                                                              (_model.calEstimatedOutputFloorNonSq
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.code''',
                                                            ).toString()}' ==
                                                            '200') {
                                                          FFAppState()
                                                                  .calEstimatedData =
                                                              HouseInsuranceGroup
                                                                  .houseCalEstimatedApiCall
                                                                  .data(
                                                            (_model.calEstimatedOutputFloorNonSq
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
                                                                child:
                                                                    AlertDialog(
                                                                  content: Text(
                                                                      '${HouseInsuranceGroup.houseCalEstimatedApiCall.messageLayer1(
                                                                    (_model.calEstimatedOutputFloorNonSq
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )}'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
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
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                content: Text(
                                                                    'พบข้อผิดพลาดConnection (${(_model.calEstimatedOutputFloorNonSq?.statusCode ?? 200).toString()})'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: Text(
                                                                        'Ok'),
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
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                if (widget!.titleText ==
                                                    'เลือกฝาผนัง') {
                                                  FFAppState()
                                                      .updateLeadsHouseAtIndex(
                                                    0,
                                                    (e) => e
                                                      ..wall = widget!.dataList
                                                          ?.elementAtOrNull(
                                                              dataListIndex),
                                                  );
                                                  safeSetState(() {});
                                                  context.safePop();
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                if (widget!.titleText ==
                                                    'เลือกพื้นชั้นบน') {
                                                  FFAppState()
                                                      .updateLeadsHouseAtIndex(
                                                    0,
                                                    (e) => e
                                                      ..floorUpper = widget!
                                                          .dataList
                                                          ?.elementAtOrNull(
                                                              dataListIndex),
                                                  );
                                                  safeSetState(() {});
                                                  context.safePop();
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                if (widget!.titleText ==
                                                    'เลือกพื้นชั้นล่าง') {
                                                  FFAppState()
                                                      .updateLeadsHouseAtIndex(
                                                    0,
                                                    (e) => e
                                                      ..floorGround = widget!
                                                          .dataList
                                                          ?.elementAtOrNull(
                                                              dataListIndex),
                                                  );
                                                  safeSetState(() {});
                                                  context.safePop();
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                if (widget!.titleText ==
                                                    'เลือกโครงสร้างหลังคา') {
                                                  FFAppState()
                                                      .updateLeadsHouseAtIndex(
                                                    0,
                                                    (e) => e
                                                      ..roofFrame = widget!
                                                          .dataList
                                                          ?.elementAtOrNull(
                                                              dataListIndex),
                                                  );
                                                  safeSetState(() {});
                                                  context.safePop();
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                if (widget!.titleText ==
                                                    'เลือกหลังคา') {
                                                  FFAppState()
                                                      .updateLeadsHouseAtIndex(
                                                    0,
                                                    (e) => e
                                                      ..roof = widget!.dataList
                                                          ?.elementAtOrNull(
                                                              dataListIndex),
                                                  );
                                                  safeSetState(() {});
                                                  context.safePop();
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                if (widget!.titleText ==
                                                    'เพศ') {
                                                  FFAppState()
                                                      .updateBenefitorDataAtIndex(
                                                    widget!.index!,
                                                    (e) => e
                                                      ..gender = (widget!.dataList?.elementAtOrNull(
                                                                  functions.getIndexOfBoolList(
                                                                      FFAppState()
                                                                          .searchableListComponentSelectedList
                                                                          .toList(),
                                                                      true))) ==
                                                              'ชาย'
                                                          ? 'MALE'
                                                          : 'FEMALE',
                                                  );
                                                  safeSetState(() {});
                                                  context.safePop();
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                if (widget!.titleText ==
                                                    'คำนำหน้า') {
                                                  FFAppState()
                                                      .updateBenefitorDataAtIndex(
                                                    widget!.index!,
                                                    (e) => e
                                                      ..titleTh = widget!
                                                          .dataList
                                                          ?.elementAtOrNull(functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true))
                                                      ..titleThId = '',
                                                  );
                                                  safeSetState(() {});
                                                  context.safePop();
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                if (widget!.titleText ==
                                                    'ประเภทผู้เอาประกันภัย') {
                                                  FFAppState()
                                                      .updateBenefitorDataAtIndex(
                                                    widget!.index!,
                                                    (e) => e
                                                      ..insuredPersonTypeName = widget!
                                                          .dataList
                                                          ?.elementAtOrNull(functions
                                                              .getIndexOfBoolList(
                                                                  FFAppState()
                                                                      .searchableListComponentSelectedList
                                                                      .toList(),
                                                                  true))
                                                      ..insuredPersonType = () {
                                                        if ((widget!.dataList?.elementAtOrNull(
                                                                functions.getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true))) ==
                                                            'คู่สมรส') {
                                                          return 'S';
                                                        } else if ((widget!
                                                                .dataList
                                                                ?.elementAtOrNull(functions.getIndexOfBoolList(
                                                                    FFAppState()
                                                                        .searchableListComponentSelectedList
                                                                        .toList(),
                                                                    true))) ==
                                                            'บุตร') {
                                                          return 'C';
                                                        } else {
                                                          return 'O';
                                                        }
                                                      }(),
                                                  );
                                                  safeSetState(() {});
                                                  context.safePop();
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                if (widget!.titleText ==
                                                    'เลือกผู้เอาประกันภัย') {
                                                  FFAppState()
                                                      .updateLeadsHouseAtIndex(
                                                    0,
                                                    (e) => e
                                                      ..assured = widget!
                                                          .dataList
                                                          ?.elementAtOrNull(
                                                              dataListIndex),
                                                  );
                                                  safeSetState(() {});
                                                  context.safePop();
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                              }

                                              if (_shouldSetState)
                                                safeSetState(() {});
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              height: 60.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: double.infinity,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(),
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
                                                                      12.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              () {
                                                                if (widget!
                                                                        .titleText ==
                                                                    'ค้นหาเปรียบเทียบชั้นประกัน') {
                                                                  return (functions
                                                                      .coverTypeCodeToName(widget!
                                                                          .dataList
                                                                          ?.toList())
                                                                      ?.elementAtOrNull(
                                                                          dataListIndex));
                                                                } else if (widget!
                                                                        .titleText ==
                                                                    'ค้นหาเปรียบเทียบประเภทการซ่อม') {
                                                                  return (functions
                                                                      .garageTypeCodeToName(widget!
                                                                          .dataList
                                                                          ?.toList())
                                                                      ?.elementAtOrNull(
                                                                          dataListIndex));
                                                                } else {
                                                                  return (widget!
                                                                      .dataList
                                                                      ?.elementAtOrNull(
                                                                          dataListIndex));
                                                                }
                                                              }(),
                                                              '-',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans Thai',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        if (FFAppState()
                                                                .searchableListComponentSelectedList
                                                                .elementAtOrNull(
                                                                    dataListIndex) ??
                                                            true)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        12.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .check_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .success,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                  Divider(
                                                    thickness: 1.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent4,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                      ]
                          .divide(SizedBox(height: 12.0))
                          .addToStart(SizedBox(height: 12.0))
                          .addToEnd(SizedBox(height: 24.0)),
                    ),
                  ),
                  if (widget!.multiSelect)
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
                                  if (((widget!.titleText == 'เลือกประเภทรถ') &&
                                          (widget!.fromPage ==
                                              'searchPackage')) ||
                                      ((widget!.titleText == 'เลือกประเภทรถ') &&
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
                                        context
                                            .goNamed('InsuranceWorkSelectPage');

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
                                              .elementAtOrNull(
                                                  functions.getIndexOfBoolList(
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
                                      FFAppState().nonePackageBrandId = FFAppState()
                                          .insuranceBasicBrandIdList
                                          .elementAtOrNull(
                                              functions.getIndexOfBoolList(
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
                                  if (widget!.titleText == 'เลือกปีจดทะเบียน') {
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
                                              .elementAtOrNull(
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true))!;
                                      FFAppState().nonePackageCoverTypeCode =
                                          FFAppState()
                                              .insuranceBasicCoverTypeCodeList
                                              .elementAtOrNull(
                                                  functions.getIndexOfBoolList(
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
                                              .elementAtOrNull(
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true))!;
                                      FFAppState().nonePackageGarageTypeName =
                                          FFAppState()
                                              .insuranceBasicGarageTypeNameList
                                              .elementAtOrNull(
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true))!;
                                      FFAppState().nonePackageGarageTypeCode =
                                          FFAppState()
                                              .nonePackageGarageTypeCodeList
                                              .elementAtOrNull(
                                                  functions.getIndexOfBoolList(
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
                                    FFAppState().insuranceInfoOccupationGroup =
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
                                      FFAppState().addAddressSelectProvinceId =
                                          FFAppState()
                                              .addAddressProvinceId
                                              .elementAtOrNull(
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true))!;
                                      FFAppState()
                                              .addAddressSelectProvinceName =
                                          FFAppState()
                                              .addAddressProvinceName
                                              .elementAtOrNull(
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true))!;
                                      FFAppState().addAddressSelectDistrictId =
                                          FFAppState()
                                              .addAddressDistrictId
                                              .elementAtOrNull(
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true))!
                                              .toString();
                                      FFAppState()
                                              .addAddressSelectDistrictName =
                                          FFAppState()
                                              .addAddressDistrictName
                                              .elementAtOrNull(
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true))!;
                                      FFAppState()
                                              .addAddressSelectSubdistrictId =
                                          FFAppState()
                                              .addAddressSubdistrictId
                                              .elementAtOrNull(
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true))!
                                              .toString();
                                      FFAppState()
                                              .addAddressSelectSubdistrictName =
                                          FFAppState()
                                              .addAddressSubdistrictName
                                              .elementAtOrNull(
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true))!;
                                      FFAppState().addAddressSelectZipCode =
                                          FFAppState()
                                              .addAddressZipCode
                                              .elementAtOrNull(
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true))!;
                                      FFAppState().addAddressSelectKeyWord =
                                          FFAppState()
                                              .addAddressKeyWord
                                              .elementAtOrNull(
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true))!;
                                      FFAppState().addAddressAtIdCard = FFAppState()
                                          .addAddressKeyWord
                                          .elementAtOrNull(
                                              functions.getIndexOfBoolList(
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
                                              .elementAtOrNull(
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true))!;
                                      FFAppState()
                                              .addAdressSelectDocProvinceName =
                                          FFAppState()
                                              .addAddressProvinceName
                                              .elementAtOrNull(
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true))!;
                                      FFAppState()
                                              .addAdressSelectDocDistrictName =
                                          FFAppState()
                                              .addAddressDistrictName
                                              .elementAtOrNull(
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true))!;
                                      FFAppState()
                                              .addAddressSelectDocDistrictId =
                                          FFAppState()
                                              .addAddressDistrictId
                                              .elementAtOrNull(
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true))!
                                              .toString();
                                      FFAppState()
                                              .addAddressSelectDocSubdistrictId =
                                          FFAppState()
                                              .addAddressSubdistrictId
                                              .elementAtOrNull(
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true))!
                                              .toString();
                                      FFAppState()
                                              .addAddressSelectDocSubdistrictName =
                                          FFAppState()
                                              .addAddressSubdistrictName
                                              .elementAtOrNull(
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true))!;
                                      FFAppState().addAddressSelectDocZipCode =
                                          FFAppState()
                                              .addAddressZipCode
                                              .elementAtOrNull(
                                                  functions.getIndexOfBoolList(
                                                      FFAppState()
                                                          .searchableListComponentSelectedList
                                                          .toList(),
                                                      true))!;
                                      FFAppState().addAddressSelectDocKeyWord =
                                          FFAppState()
                                              .addAddressKeyWord
                                              .elementAtOrNull(
                                                  functions.getIndexOfBoolList(
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
